#include <iostream>
#include <cstdlib>
#include <cstring>
#include <fstream>

#include "chromosomear.h"
#include "fitnessbdd.h"

using namespace std;


int main(int argc, char ** argv)
{
    if(argc != 2 && argc != 3)
    {
        cout << "Usage: " << argv[0] << " [opts] chromosome" << endl;
        cout << "Parameters: " << endl;
        cout << "  none           ... shows statistics" << endl;
        cout << "  -vOUTPUTFILE   ... outs VHDL file" << endl;
        cout << "  -cOUTPUTFILE   ... outs C file" << endl;
        return EXIT_FAILURE;
    }

    ChromosomeAr chrom(argv[argc - 1]);


    bool param_v = false, param_c = false, param_b;

    param_v = (argc == 3 && argv[1][0] == '-' && argv[1][1] == 'v');
    param_c = (argc == 3 && argv[1][0] == '-' && argv[1][1] == 'c');

    if(param_v)
    {
        /* VHDL export */
        char * filename = argv[1] + 2;
        if(strlen(filename) < 1)
        {
            cerr << "Filename for VHDL file is not specified" << endl;
            return EXIT_FAILURE;
        }
        
        ofstream f(filename);
        chrom.ToVHDL(f);
        f.close();
        return EXIT_SUCCESS;
    }

    if(param_c)
    {
        /* C file export */
        char * filename = argv[1] + 2;
        if(strlen(filename) < 1)
        {
            cerr << "Filename for C file is not specified" << endl;
            return EXIT_FAILURE;
        }
        
        ofstream f(filename);
        chrom.ToC(f);
        f.close();
        return EXIT_SUCCESS;

    }
    
    /* Statistics calculation */
    FitnessBdd<ChromosomeAr> fb(chrom);

    /* Get min and max error */
    int min, max;
    fb.GetMinMaxDiff(chrom, min, max);
    cout << "d_L = " << min << ", d_H = " << max << endl;

    /* Calculate fitness */
    T_FIT fit = fb.GetFitness(chrom);
    cout << "Q(M) = " << fit << endl;


    cout << "Error distribution = {" << endl;
    fb.PrintFitness(chrom);

    cout << "}" << endl;
    
    cout << "stat = ";
    chrom.PrintStat(cout) ;
    cout << endl;
    return 0;
}

