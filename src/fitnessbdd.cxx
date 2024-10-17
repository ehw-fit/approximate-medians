/* 
 * File:   FitnessBdd.cpp
 * Author: imrazek
 * 
 * Created on 27. dubna 2015, 11:05
 */

#include "fitnessbdd.h"
#include "chromosomear.h"
#include <bdd.h>


static void bdd_gbchandler(int pre, bddGbcStat *s);

template <class CH>
FitnessBdd<CH>::FitnessBdd(CH & init)
{
    bdd_init(1000000, 1000000);
    bdd_setvarnum(init.inputs);
    bdd_gbc_hook(bdd_gbchandler);
    this->ref = new Reference(init.inputs);
	cout << " + Fitness unit: BDD" << endl;
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
//    double tm = cpuTime();
    T_FIT fit = 0;
    bdd median_test = chrom.GenerateBdd();



   // cout << "==============================" << endl << "SAT count: " << bdd_satcount(median_test ^ ref->GetValidMedian()) << endl;

    fit = 0 * 0 * bdd_satcount(!(median_test ^ ref->GetValidMedian()));

    
    for (int i = 1; i <= chrom.inputs / 2; i++) {
        int id = (chrom.inputs/2 - i + 1);
        fit += id * id *  bdd_satcount(median_test & ref->GetOnesCount(i));
    }
    for (int i = chrom.inputs / 2 + 1; i < chrom.inputs; i++) {
        int id =  (i - chrom.inputs/2);
        fit += id * id * bdd_satcount((!median_test) & ref->GetOnesCount(i));

    }

//    cout << "Time of fitness " << cpuTime() - tm << endl;
    return fit;
}



long long factorial(int num) {
    long long fact = 1;
    for (int i = 1; i <= num; i++) {
        fact *= i;
    }
    return fact;
}

// Function to calculate combination (nCr)
long long cn(int n, int r) {
    long long x = factorial(n) / (factorial(n - r) * factorial(r));
    return x;
}

template <class CH>
void  FitnessBdd<CH>::PrintFitness(CH & chrom, ostream & out)
{
    int med = (chrom.inputs-1)/2;
    double histn[med+2];
    double histp[med+2];

    bdd median_test = chrom.GenerateBdd();
    //out << "==============================" << endl;
    //out << "Size: " << chrom.GetSize() << endl;
    //fit = bdd_satcount(median_test ^ ref->GetValidMedian());

    histp[med+1] = histn[med+1] = 0;
    for (int k = 0; k <= med; k++) {
        histn[k] = bdd_satcount(!median_test & ref->GetOnesCount(med+k));
        histp[k] = bdd_satcount(median_test & ref->GetOnesCount(med-k+1));
    }


    for (int k = med; k > 0; k--) {
        double h = 100*(histn[k]/cn(chrom.inputs, med+1-k) - histn[k+1]/cn(chrom.inputs, med+1-k-1));
        out << " -" << k << ":" << histn[k] << "=> " << h << "%" << endl;
    }
    {
        int k = 0;
        double h = 100*(histn[k]/cn(chrom.inputs, med+1-k) - histn[k+1]/cn(chrom.inputs, med+1-k-1));
        out << "  " << k << ":" << histn[k] << "=> " << h << "%" << endl;
    }
    for (int k = 1; k <= med; k++) {
        double h = 100*(histp[k]/cn(chrom.inputs, med+k) - histp[k+1]/cn(chrom.inputs, med+k+1));
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
