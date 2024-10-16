/* 
 * File:   FitnessBdd.h
 * Author: imrazek
 *
 * Created on 27. dubna 2015, 11:05
 */

#ifndef FITNESSBDD_H
#define	FITNESSBDD_H


#include "reference.h"
#include <stdint.h>
#include <iostream>


typedef int64_t T_FIT;
using namespace std;

template <class CH>
class FitnessBdd {
public:
    FitnessBdd(CH & init);
    
    T_FIT GetFitness(CH & chrom);
    void PrintFitness(CH & chrom, ostream & out = cout);
    
    virtual ~FitnessBdd();

    void GetMinMaxDiff(CH & chrom, int & minimum, int & maximum);
private:
    Reference * ref;
};

#endif	/* FITNESSBDD_H */

