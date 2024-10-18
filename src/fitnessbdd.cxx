/* 
 * File:   fitnessbdd.cpp
 * Author: mrazek
 * 
 * Fitness evaluation of the chromosome using BDD
 * BDD is used to calculate the error distribution
 * which is transformed to the fitness value by the
 * formula  sum(j**2 * (H(j)))
 * 
 * The library uses BuDDy BDD library
 */

#include "fitnessbdd.h"
#include "chromosomear.h"
#include <bdd.h>


static void bdd_gbchandler(int pre, bddGbcStat *s);

static long long cn(int n, int r);

template <class CH>
FitnessBdd<CH>::FitnessBdd(CH & init)
{
    bdd_init(1000000, 1000000);
    bdd_setvarnum(init.inputs);
    bdd_gbc_hook(bdd_gbchandler);
    this->ref = new Reference(init.inputs);
	cout << " + Fitness unit: BDD" << endl;

    /* prefil the number of coefitiones */
    cn_cache = new long long[init.inputs + 1];
    for (int i = 0; i <= init.inputs; i++) {
        cn_cache[i] = cn(init.inputs, i);
    }
}

template <class CH>
FitnessBdd<CH>::~FitnessBdd()
{
    delete this->ref;

    bdd_done();
}

template <class CH>
T_FIT FitnessBdd<CH>::GetFitness(CH & chrom)
{
    bdd median_test = chrom.GenerateBdd();


    #if 0
        T_FIT fit = 0;
        // the histogram is overestimated
        // the histogram is not used in the fitness function
        fit = 0 * 0 * bdd_satcount(!(median_test ^ ref->GetValidMedian()));

        
        for (int i = 1; i <= chrom.inputs / 2; i++) {
            int id = (chrom.inputs/2 - i + 1);
            fit += id * id *  bdd_satcount(median_test & ref->GetOnesCount(i));
        }
        for (int i = chrom.inputs / 2 + 1; i < chrom.inputs; i++) {
            int id =  (i - chrom.inputs/2);
            fit += id * id * bdd_satcount((!median_test) & ref->GetOnesCount(i));
        }
        return fit;
    #else
        double fit = 0;
        int med = (chrom.inputs-1)/2;
        double histn[med+2];
        double histp[med+2];

        histp[med+1] = histn[med+1] = 0;
        for (int k = 0; k <= med; k++) {
            histn[k] = bdd_satcount(!median_test & ref->GetOnesCount(med+k));
            histp[k] = bdd_satcount(median_test & ref->GetOnesCount(med-k+1));
        }

        // cn_cache represent precalculated combination coefficients for a given number of inputs
        // cn_cache[i] = cn(chrom.inputs, i)
        // size is chrom.inputs + 1

        for (int k = med; k > 0; k--) {
            double h = (histn[k]/cn_cache[med+1-k] - histn[k+1]/cn_cache[med+1-k-1]);
            //cout << " -" << k << ":" << histn[k] << "=> " << h << "%" << endl;
            fit += k*k*h;
        }
        {
            int k = 0;
            double h = (histn[k]/cn_cache[med+1-k] - histn[k+1]/cn_cache[med+1-k-1]);
            //cout << "  " << k << ":" << histn[k] << "=> " << h << "%" << endl;
            fit += k*k*h;
        }
        for (int k = 1; k <= med; k++) {
            double h = (histp[k]/cn_cache[med+k] - histp[k+1]/cn_cache[med+k+1]);
            //cout << " +" << k << ":" << histp[k] << "=> " << h << "%" << endl;
            fit += k*k*h;
        }
        return -(T_FIT)(1000*fit);
    #endif
}



long long factorial(int num) {
    long long fact = 1;
    for (int i = 1; i <= num; i++) {
        fact *= i;
    }
    return fact;
}

// Function to calculate combination (nCr)
static long long cn(int n, int r) {
    // https://stackoverflow.com/questions/9330915/number-of-combinations-n-choose-r-in-c
    // better than factorial(n) / (factorial(r) * factorial(n - r))
    //cout << "r" << r << "n" << n << endl;
    int k = r;
    if (k > n) return 0;
    if (k * 2 > n) k = n-k;
    if (k == 0) return 1;

    int result = n;
    for( int i = 2; i <= k; ++i ) {
        result *= (n-i+1);
        result /= i;
    }
    return result;
}

template <class CH>
void  FitnessBdd<CH>::PrintFitness(CH & chrom, ostream & out)
{
    int med = (chrom.inputs-1)/2;
    double histn[med+2];
    double histp[med+2];

    bdd median_test = chrom.GenerateBdd(); // output of the candidate median function
    //out << "==============================" << endl;
    //out << "Size: " << chrom.GetSize() << endl;
    //fit = bdd_satcount(median_test ^ ref->GetValidMedian());

    histp[med+1] = histn[med+1] = 0;
    for (int k = 0; k <= med; k++) {
        histn[k] = bdd_satcount(!median_test & ref->GetOnesCount(med+k));
        histp[k] = bdd_satcount(median_test & ref->GetOnesCount(med-k+1));
    }

    // cn_cache represent precalculated combination coefficients for a given number of inputs
    // cn_cache[i] = cn(chrom.inputs, i)
    // size is chrom.inputs + 1

    for (int k = med; k > 0; k--) {
        double h = 100*(histn[k]/cn_cache[med+1-k] - histn[k+1]/cn_cache[med+1-k-1]);
        out << " -" << k << ":" << histn[k] << "=> " << h << "%" << endl;
    }
    {
        int k = 0;
        double h = 100*(histn[k]/cn_cache[med+1-k] - histn[k+1]/cn_cache[med+1-k-1]);
        out << "  " << k << ":" << histn[k] << "=> " << h << "%" << endl;
    }
    for (int k = 1; k <= med; k++) {
        double h = 100*(histp[k]/cn_cache[med+k] - histp[k+1]/cn_cache[med+k+1]);
        out << " +" << k << ":" << histp[k] << "=> " << h << "%" << endl;
    }

}


template <class CH>
void FitnessBdd<CH>::GetMinMaxDiff(CH & chrom, int & minimum, int & maximum)
{
    minimum = 0;
    maximum = 0;
    bdd median_test = chrom.GenerateBdd();
    for (int i = 1; i <= chrom.inputs / 2 + 1; i++) {
        minimum = (chrom.inputs/2 - i + 1);
        if (bdd_satone(median_test & ref->GetOnesCount(i)) != bddfalse)
            break;
    }
    
    for (int i = chrom.inputs - 1; i >=  chrom.inputs / 2 + 0; i--) {
        maximum = (i - chrom.inputs/2);
        if(bdd_satone((!median_test) & ref->GetOnesCount(i)) != bddfalse)
            break;
    }

}



static void bdd_gbchandler(int pre, bddGbcStat *s)
{
   if (!pre)
   {
      /*printf("myGarbage collection #%d: %d nodes / %d free",
	     s->num, s->nodes, s->freenodes);
      printf(" / %.1fs / %.1fs total\n",
	     (float)s->time, //(float)(CLOCKS_PER_SEC),
	     (float)s->sumtime); //(float)CLOCKS_PER_SEC);
       */
   }
}

template class FitnessBdd<ChromosomeAr>;
