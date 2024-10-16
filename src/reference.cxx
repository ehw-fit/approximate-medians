/* 
 * File:   reference.cxx
 * Author: imrazek
 * 
 * Created on 24. dubna 2015, 8:37
 */


#include "reference.h"
#include <assert.h>
#include <cstdlib>
#include <iostream>

using namespace std;

Reference::Reference(int inputs)
{
    assert(bdd_varnum() == inputs);
    assert((inputs & 1) == 1); // odd number
    this->inputs = inputs;

    this->wires = new bdd[inputs];
    this->counts = new bdd[inputs + 1];

    for (int i = 0; i < inputs; i++) {
        this->wires[i] = bdd_ithvar(i);
    }

    // generates reference by bubble sort
    for (int i = 0; i < inputs; i++) {
        for (int j = inputs - 2; j >= i; j--) {
            //cout << "nodes " << j + 1 << " - " << j << endl;
            bdd a = wires[j];
            bdd b = wires[j + 1];

            wires[j] = a & b;
            wires[j + 1] = a | b;
        }
    }

    // generates counts bdd
    this->counts[0] = !wires[inputs - 1];

    for (int i = 1; i < inputs; i++) {
        //cout << inputs - i << " -- " << inputs - i - 1 << endl;
        this->counts[i] = wires[inputs - i] & !wires[inputs - i - 1];
    }
    this->counts[inputs] = wires[0];

}

Reference::~Reference()
{
    delete[] this->wires;
    delete[] this->counts;
}

bdd Reference::GetOnesCount(int ones)
{
    assert(ones <= inputs && ones >= 0);

    return this->counts[ones];
}

bdd Reference::GetValidMedian()
{

    return wires[inputs / 2];
}

