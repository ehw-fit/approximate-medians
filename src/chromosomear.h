/**
 * File: chromosomear.h
 * Author: mrazek
 * 
 * Chromosome for median problem. Represents the median network
 * as a composition of CAS (compare and swap) units.
 * 
 * Inherently it transforms the representation to the pipelined
 * version of the median network and calculates the number of
 * operations and registers and stages (delay).
 * 
 * It is possible to export the area to VHDL or C code.
 */

#pragma once
#include <iostream>
#include <ostream>
#include <bdd.h>

using namespace std;

/* temporary structure for ASAP planning*/
struct TPos 
{
    int min;
    int max;

    void set(int i, int b = -1)
    {
        min = i;
        if(b >= 0)
            max = b;
        else
            max = i;
    }
};

class ChromosomeAr {
    friend ostream & operator<<(ostream & in,const ChromosomeAr & c);

public:

    /**
     * Generates chromosome with specified size
     * @param rows rows count
     * @param cols cols count
     * @param inputs inputs count
     */
    ChromosomeAr(int rows, int cols, int inputs);
    
    /**
     * Load chromosome and whole settings from file
     * @param name filename
     */
    ChromosomeAr(const char * name);
    
    
    /**
     * Creates chromosome with unspecified size
     */
    ChromosomeAr();
    
    /**
     * Creates chromosome with size copied from previous
     */
    ChromosomeAr(ChromosomeAr & prev);
    
    void InitBy(ChromosomeAr & parent, int mutation);
    void MutateBy(ChromosomeAr & parent, int mutation);
    
    /**
     * Destructor
     */
    ~ChromosomeAr();

    /**
     * Generates BDD, before the inputs settings must be setted
     * @return median value
     */
    bdd GenerateBdd();
   
    /**
     * Simulates median function
     * @param buff array of inputs and buffer of data, len = inputs +  rows * cols
     **/

    int SimulateMedian(int * buff);
    /**
     * Gets estimated size
     * @return 
     */
    int GetSize();
    
    int GetComparators();

    int rows, cols, inputs, output;

    /**
     * Returns number of operations with func id = oid
     * @return
     **/
    int Ops(int oid);
    const int SIZEMULT = 2;


    void ToVHDL(ostream & cout);
    void ToC(ostream & cout);
    
    ChromosomeAr & operator=(const ChromosomeAr & other);

    void PrintStat(ostream & out);
private:
    bool * actives;
    bool actives_detected;
    
    /**
     * Inits data to specified size
     * @param r rows
     * @param c cols
     * @param in inputs
     */
    void Init(int r, int c, int in);

    /**
     * Detects active nodes, skips if the detection is already done
     */
    void DetectActives();
    
    
    
    
    /**
     * Gets count of active nodes, just if active nodes are counted
     * @return 
     */
    int GetSizeConst() const;
    
    void GetParams(int & ops, int & regs);
    
    bdd * nodes;
    int * data;
    TPos * positions;

    int p_ops, p_regs;
};
