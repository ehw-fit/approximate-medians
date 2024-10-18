/* 
 * File:   FitnessBdd.cpp
 * Author: imrazek
 * 
 * Fitness evaluation of the chromosome using BDD
 * BDD is used to calculate the error distribution
 * which is transformed to the fitness value by the
 * formula  sum(j**2 * (H(j)))
 * 
 * The library uses BuDDy BDD library
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
    long long * cn_cache; // cache for combination coefficients for a given number of inputs
};

#endif	/* FITNESSBDD_H */

