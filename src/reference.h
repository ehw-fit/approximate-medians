#pragma once

#include <bdd.h>

class Reference {
public:
    /**
     * Generates BDD reference for median and sorting networks from bubblesort algorithm
     * @param inputs number of inputs, must be odd
     */
    Reference(int inputs);
    
    ~Reference();

    /**
     * Gets BDD node that input has exactly /ones/ ones
     * @param ones number of ones, should be from 0 up to inputs
     * @return BDD node
     */
    bdd GetOnesCount(int ones);
    
    /**
     * Returns valid BDD node from real median
     * @return BDD node
     */
    bdd GetValidMedian();

private:
    bdd * wires;
    bdd * counts;

    int inputs;
};


