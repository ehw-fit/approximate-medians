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


template <class CH>
void  FitnessBdd<CH>::PrintFitness(CH & chrom, ostream & out)
{
    bdd median_test = chrom.GenerateBdd();
    //out << "==============================" << endl;
    //out << "Size: " << chrom.GetSize() << endl;
    //fit = bdd_satcount(median_test ^ ref->GetValidMedian());

    for (int i = 1; i <= chrom.inputs / 2; i++) {
        out << "SAT count: " << (chrom.inputs/2 - i + 1) << " - " << bdd_satcount(median_test & ref->GetOnesCount(i)) << endl;
        //int id = (chrom.inputs/2 - i + 1);
        //fit -= id * id *  bdd_satcount(median_test & ref->GetOnesCount(i));
    }
    //out << endl;

    out << "SAT count (0): " << bdd_satcount(!(median_test ^ ref->GetValidMedian())) << endl;
    for (int i = chrom.inputs / 2 + 1; i < chrom.inputs; i++) {
        out << "SAT count: " << i << "-" << (i - chrom.inputs/2) << " - " << bdd_satcount((!median_test) & ref->GetOnesCount(i)) << endl;
      //  int id = (i - chrom.inputs/2);
       // fit -= id * id * bdd_satcount((!median_test) & ref->GetOnesCount(i));

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
