#include <cstdlib>
#include <cstdlib>
#include <assert.h>
#include <stdio.h>
#include <iostream>
#include <string.h>
#include "vhdlconst.h"

#include "chromosomear.h"
#include "chromosome.h" // constants 

using namespace std;
//using namespace Chrom;

ostream & operator<<(ostream & in, const ChromosomeAr & c)
{
    int size = c.GetSizeConst();
    in << "{" << c.inputs << ",1," << c.cols << "," << c.rows << ",2,2," << size << "}";
    // fprintf(stderr, "A");
    for (int i = 0; i < c.rows * c.cols; i++) {
        in << "([" << 2*i + c.inputs << "," << 2*i + 1 + c.inputs << "]" << c.data[i * 3] << "," << c.data[i * 3 + 1] << "," << c.data[i * 3 + 2] << ")";
        //  fprintf(stderr, "B %d\n" , i);
    }

    in << "(" << c.output << ")";
    return in;
}


ostream & operator<<(ostream & in, const TPos & c)
{
    in << "[" << c.min << " ... " << c.max << "]";
    return in;
}


ChromosomeAr::ChromosomeAr(int rows, int cols, int inputs)
{
    data = NULL;
    assert(0);
}

ChromosomeAr::ChromosomeAr()
{
    data = NULL;
    inputs = 0;
    rows = 0;
    cols = 0;
    output = 0;
}

ChromosomeAr::ChromosomeAr(ChromosomeAr & prev)
{
    this->InitBy(prev, 0);
}

void ChromosomeAr::InitBy(ChromosomeAr & parent, int mutation)
{
    this->actives_detected = false;
    this->Init(parent.rows, parent.cols, parent.inputs);
    this->MutateBy(parent, mutation);
}

void ChromosomeAr::MutateBy(ChromosomeAr & parent, int mutation)
{
    this->actives_detected = false;
    for (int i = 0; i < (rows * cols * 3); i++)
        this->data[i] = parent.data[i];
    this->output = parent.output;

    /* TODO : mutation*/
    
    for(int m=0; m<mutation; m++)
    {
        int pos = rand() % (3*rows * cols + 1);
        
        if(pos == 3*rows * cols) // output
        {
        //    cerr << "mut a";
            output = inputs + (rand() % (2 * rows * cols));
        }
        else
        {
            if(pos % 3 == 2) // function
            {
          //  cerr << "mut b";
                this->data[pos] = 1+rand() % 2;
            }
            else // nodes inputs
            {
           // cerr << "mut c";
                int node = pos / 3;
                this->data[pos] = rand() % (inputs + 2 * node);
            }
        }
        
        
    }
}

ChromosomeAr::ChromosomeAr(const char * name)
{
    data = NULL;
    cout << "# Load " << name << endl;

    FILE * f = fopen(name, "r");
    if (f == NULL) {
        cerr << "Unable to load file \"" << name << "\" as input chromosome file" << endl;
        exit(1);
    }

    int pi, po;
    int c, r;
    int fitness;
    int out;

    int z;

    // comments at begin
    while (1) {
        z = getc(f);
        if (z == EOF) assert(0);

        if (z != '{') {
            if (z == '#') {
                while (z != '\n') {
                    z = getc(f);
                    if (z == EOF) assert(0);
                }
            }
        } else {
            break;
        }
    }


    // preamble
    if (fscanf(f, "%d,%d", &pi, &po) != 2) assert(0);
    //printf("%d - %d \n", pi, po);
    if (fscanf(f, ",%d,%d", &c, &r) != 2) assert(0);
    //printf("%d - %d \n", c, r);
    if (fscanf(f, ",2,2,%d}", &fitness) != 1) assert(0);

    this->Init(r, c, pi);

    cout << "# Chromosome: " << r << " x " << c << endl;

    // nodes
    for (int i = 0; i < r * c; i++) {
        int id, id2, ina, inb, fnc;
        if (fscanf(f, "([%d,%d]%d,%d,%d)", &id, &id2, &ina, &inb, &fnc) != 5) {
            cout << " + ukonceno cteni " << i << endl;
            break;

        }

        id -= pi;
        id /= 2;
        //printf("node .. %d - %d,%d (f:%d) %d\n", id, ina, inb, fnc, r * c);
        assert(id >= 0 && id < 2*(r * c));
        this->data[id * 3] = ina;
        this->data[id * 3 + 1] = inb;
        this->data[id * 3 + 2] = fnc;
    }

    int ch;
    // output
    ch = getc(f);

    if (ch != '(') // should be deletd by fscanf above            
        ungetc(ch, f);
    /*
    {
        int c;
        while((c = getc(f)) != EOF)
            cout << "Read:" << (char)c;
   }*/
 
    if (fscanf(f, "%d)", &out) != 1)
    {
        int c;
        while((c = getc(f)) != EOF)
            cout << (char)c;

        assert(0);
    }



    this->output = out;

    fclose(f);
    actives_detected = false;
}


ChromosomeAr & ChromosomeAr::operator=(const ChromosomeAr & other)
{
    //cerr << "kopiruji" << endl;
    assert(this->rows == other.rows);
    assert(this->cols == other.cols);
    assert(this->inputs == other.inputs);
     for (int i = 0; i < this->rows * this->cols * 3; i++)
        this->data[i] = other.data[i];
    
    this->output = other.output;
    
    
    this->actives_detected = false;
    return *this;
    
}

ChromosomeAr::~ChromosomeAr()
{
    delete[] data;
    delete[] actives;
    delete[] nodes;
    delete[] positions;
   // delete[] disable;
    //delete[] levels;
}

void ChromosomeAr::Init(int r, int c, int in)
{
    this->data = new int[r * c * 3];
    this->actives = new bool[r * c];
    this->nodes = new bdd[ 2 * r * c];
    this->positions = new TPos[in + 2 * r * c];
    //this->disable = new bool[r * c];
    //this->levels = new int[in + r * c];
    

    this->actives_detected = false;
    for (int i = 0; i < r * c * 3; i++)
        data[i] = 0;
    //memset(data, r * c * 3 * sizeof (int), 0);
    memset(actives, r * c * sizeof (bool), 0);
    memset(nodes, 2 * r * c * sizeof (bdd), 0);
    

    this->rows = r;
    this->cols = c;
    this->inputs = in;
    this->output = 0;
}

void ChromosomeAr::DetectActives()
{
    //cerr << "act start" << endl;
    if (actives_detected) return;

    memset(this->actives, 0, this->cols * this->rows * sizeof (bool));
    
    this->actives[(this->output - this->inputs) / 2] = 1;

   // cerr << "act middle" << endl;
    for (int i = this->cols * this->rows - 1; i >= 0; i--) {
     //   cout << i << ": " << actives[i] << endl;
        if (!actives[i]) continue;

        int ida = this->data[i * 3] - this->inputs;
        int idb = this->data[i * 3 + 1] - this->inputs;

        if (ida >= 0) actives[ida / 2] = 1;
        if (idb >= 0) actives[idb / 2] = 1;
    }
    //cerr << "act end" << endl;
    actives_detected = true;

    this->GetParams(p_ops, p_regs);
}


void ChromosomeAr::GetParams(int & ops, int & regs) 
{
    ops = 0;
    regs = 0;
    for(int i = 0; i < inputs; i++)
        this->positions[i].set(0);

    for (int i = 0; i < this->rows * this->cols; i++)
    {
        if (!actives[i]) continue;
        ops++;

        int ida = this->data[i * 3];
        int idb = this->data[i * 3 + 1];

        int best = max(positions[ida].min, positions[idb].min);

        //cout << inputs + 2 * i <<  " to " << best + 1 << endl;
        if(positions[ida].max < best)
        {
            regs += best - positions[ida].max;
            positions[ida].max = best;
        }

        if(positions[idb].max < best)
        {
            regs += best - positions[idb].max;
            positions[idb].max = best;
        }

        this->positions[inputs + 2 * i].set(best + 1, best);
        this->positions[inputs + 2 * i + 1].set(best + 1, best);
    }
#if 0
    cout << "ops = " << ops << ", regs = " << regs << endl ;


    for(int i = 0; i < inputs; i++)
        cout << "input " << i << this->positions[i] << endl;

    for (int i = 0; i < this->rows * this->cols; i++)
    {
        if (!actives[i]) continue;
        ops++;
        
        int ida = this->data[i * 3];
        int idb = this->data[i * 3 + 1];

        cout << "Node " << inputs + 2 * i + 1 << " ( " << ida << ", " << idb << ") " << this->positions[inputs + 2 * i] << endl;
        cout << "Node " << inputs + 2 * i + 1 << " ( " << ida << ", " << idb << ") " << this->positions[inputs + 2 * i + 1] << endl;
    }
#endif
}

static int totcnt = 0;
static void VHDLsig(ostream & co, int i, int j)
{
    if(!(totcnt % 8))
        co << "  signal ";
    else
        co << ", ";

    co << "sig_" << i << "_" << j;
    totcnt++;
    if(!(totcnt % 8))
        co << " : std_logic_vector(DATA_WIDTH-1 downto 0);" << endl;
}

static void VHDLsig(ostream & co)
{
    if(totcnt % 8)
        co << " : std_logic_vector(DATA_WIDTH-1 downto 0);" << endl;
}

static void VHDLreg(ostream & co, int i, int j, int k)
{
    co << "  reg_" << i << "_" << j << ": entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(" << endl
       << "    RESET => RESET," << endl
       << "    CLK   => CLK," << endl
       << "    X => sig_" << i << "_" << j  << "," << endl
       << "    Q => sig_" << i << "_" << k  << "" << endl
       << "  );" << endl << endl;
}


static void VHDLcmp(ostream & co, int min_a, int min_b, int max_a, int max_b, int in1_a, int in1_b, int in2_a, int in2_b)
{
    co << "  cmpswp_" << min_a << "_" << min_b << ": entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(" << endl
       << "    RESET => RESET," << endl
       << "    CLK   => CLK," << endl
       << "    X => sig_" << in1_a << "_" << in1_b << "," << endl
       << "    Y => sig_" << in2_a << "_" << in2_b << "," << endl
       << "    MIN => sig_" << min_a << "_" << min_b << "," << endl
       << "    MAX => sig_" << max_a << "_" << max_b << "" << endl
       << "  );" << endl << endl;

}

void ChromosomeAr::ToVHDL(ostream & co)
{
    this->DetectActives();
    int ops, regs;
    this->GetParams(ops, regs);
    co << vhdl_preamble;

    // entity
    co << "entity median_" << inputs << " is " << endl
       << "  generic(" << endl
       << "    DATA_WIDTH  : integer := 8" << endl
       << "  );" << endl
       << "  port(" << endl
       << "    RESET : in std_logic;" << endl
       << "    CLK   : in std_logic;" << endl
       << "    " << endl
       << "    sig_in : in tkernel(0 to " << inputs - 1 << ",DATA_WIDTH-1 downto 0);" << endl
       << "    " << endl
       << "    sig_out_med : out std_logic_vector(DATA_WIDTH-1 downto 0)" << endl
       << "  );" << endl
       << "end entity;" << endl
       << "" << endl
       << "architecture generated of  median_" << inputs << " is" << endl;

    // signals



    totcnt = 0;
    for(int i = 0; i < inputs; i++)
    {
        for(int j = positions[i].min; j <= (positions[i].max); j++)
        {
            VHDLsig(co, i, j);
        }
    }

    for (int i = 0; i < this->rows * this->cols; i++)
    {
        if (!actives[i]) continue;
        ops++;

        int func = this->data[i * 3 + 2];

        int id_min = 0, id_max = 0;
        if(func == MAX_CODE) {
            id_min =  2 * i + 1 + this->inputs;
            id_max =  2 * i + this->inputs;
        }
        else if(func == MIN_CODE) {
            id_min =  2 * i + this->inputs;
            id_max =  2 * i + 1 + this->inputs;
        }
        else { assert(0); }

        VHDLsig(co, id_min, positions[id_min].min);
        VHDLsig(co, id_max, positions[id_max].min); // << " = " << ida << "_" << best - 1 << ", " << idb << "_" << best - 1 << endl;
        
        for(int j = positions[id_min].min; j < positions[id_min].max; j++)
        {
            VHDLsig(co, id_min, j + 1);
        }


        for(int j = positions[id_max].min; j < (positions[id_max].max); j++)
        {
            VHDLsig(co, id_max, j + 1);
        }
    }

    VHDLsig(co);
    // blocks

    co << "begin" << endl;

    co << "  cons: for i in 0 to DATA_WIDTH-1 generate" << endl;
    for(int i = 0; i < inputs; i++)
    {
        co << "    sig_" << i << "_0(i) <= sig_in(" << i << ",i);" << endl;
    }
    co << "  end generate;" << endl;

    for(int i = 0; i < inputs; i++)
    {

        for(int j = positions[i].min; j < (positions[i].max); j++)
        {
            VHDLreg(co, i, j, j + 1); //co << "REG " << i << "_" << j << " to " <<  i << "_" << j + 1 << endl;
        }
    }

    for (int i = 0; i < this->rows * this->cols; i++)
    {
        if (!actives[i]) continue;
        ops++;

        int ida = this->data[i * 3];
        int idb = this->data[i * 3 + 1];
        int func = this->data[i * 3 + 2];

        int id_min = 0, id_max = 0;
        if(func == MAX_CODE) {
            id_min =  2 * i + 1 + this->inputs;
            id_max =  2 * i + this->inputs;
        }
        else if(func == MIN_CODE) {
            id_min =  2 * i + this->inputs;
            id_max =  2 * i + 1 + this->inputs;
        }
        else { assert(0); }

        int best = max(positions[id_min].min, positions[id_max].min);

        VHDLcmp(co, 
            id_min, positions[id_min].min,
            id_max, positions[id_max].min,
            ida, best - 1,
            idb, best - 1
        );
        //co << "MIN - MAX: " << id_min << "_" << positions[id_min].min <<
        //    ", " << id_max << "_" << positions[id_max].min << " = " << ida << "_" << best - 1 << ", " << idb << "_" << best - 1 << endl;

        for(int j = positions[id_min].min; j < positions[id_min].max; j++)
        {
            VHDLreg(co, id_min, j, j + 1); 
            //co << "REG " << id_min << "_" << j << " to " <<  id_min << "_" << j + 1 << endl;
        }


        for(int j = positions[id_max].min; j < (positions[id_max].max); j++)
        {
            VHDLreg(co, id_max, j, j + 1); 
            //co << "REG " << id_max << "_" << j << " to " <<  id_max << "_" << j + 1 << endl;
        }
    }
    co << "  sig_out_med <= sig_" << output << "_" << positions[output].min << ";" << endl;
    co << "end generated;" << endl;
}

static int totcntC = 0;
static void Csig(ostream & co, int i, int j)
{
    if(!(totcntC % 8))
        co << "  signal_t ";
    else
        co << ", ";

    co << "sig_" << i << "_" << j;
    totcntC++;
    if(!(totcntC % 8))
        co << ";" << endl;
}

static void Csig(ostream & co)
{
    if(totcnt % 8)
        co << ";" << endl;
}

static void Creg(ostream & co, int i, int j, int k)
{
    /*co << "  reg_" << i << "_" << j << ": entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(" << endl
       << "    RESET => RESET," << endl
       << "    CLK   => CLK," << endl
       << "    X => sig_" << i << "_" << j  << "," << endl
       << "    Q => sig_" << i << "_" << k  << "" << endl
       << "  );" << endl << endl*/

    co << "  sig_" << i << "_" << k  << " = " 
       << "sig_" << i << "_" << j  << ";" << endl;
}


static void Ccmp(ostream & co, int min_a, int min_b, int max_a, int max_b, int in1_a, int in1_b, int in2_a, int in2_b)
{
    co << "  sig_" << min_a << "_" << min_b << " = min(" 
       << "  sig_" << in1_a << "_" << in1_b << ", " 
       << "  sig_" << in2_a << "_" << in2_b << ");" << endl;

    co << "  sig_" << max_a << "_" << max_b << " = max(" 
       << "  sig_" << in1_a << "_" << in1_b << ", "
       << "  sig_" << in2_a << "_" << in2_b << ");" << endl;
}

void ChromosomeAr::ToC(ostream & co)
{
    this->DetectActives();
    int ops, regs;
    this->GetParams(ops, regs);
    co << "#include <stdint.h>" << endl;
    co << "typedef int signal_t;" << endl;
    co << "#define min(a,b) ((a) < (b) ? (a) : (b))" << endl;
    co << "#define max(a,b) ((a) > (b) ? (a) : (b))" << endl;


    // entity
    co << "signal_t median_" << inputs << "(signal_t * sig_in) {" << endl;

    // signals



    totcnt = 0;
    for(int i = 0; i < inputs; i++)
    {
        for(int j = positions[i].min; j <= (positions[i].max); j++)
        {
            Csig(co, i, j);
        }
    }

    for (int i = 0; i < this->rows * this->cols; i++)
    {
        if (!actives[i]) continue;
        ops++;

        int func = this->data[i * 3 + 2];

        int id_min = 0, id_max = 0;
        if(func == MAX_CODE) {
            id_min =  2 * i + 1 + this->inputs;
            id_max =  2 * i + this->inputs;
        }
        else if(func == MIN_CODE) {
            id_min =  2 * i + this->inputs;
            id_max =  2 * i + 1 + this->inputs;
        }
        else { assert(0); }

        Csig(co, id_min, positions[id_min].min);
        Csig(co, id_max, positions[id_max].min); // << " = " << ida << "_" << best - 1 << ", " << idb << "_" << best - 1 << endl;
        
        for(int j = positions[id_min].min; j < positions[id_min].max; j++)
        {
            Csig(co, id_min, j + 1);
        }


        for(int j = positions[id_max].min; j < (positions[id_max].max); j++)
        {
            Csig(co, id_max, j + 1);
        }
    }

    Csig(co);
    co << ";" << endl;
    // blocks
    for(int i = 0; i < inputs; i++)
    {
        co << "  sig_" << i << "_0 = sig_in[" << i << "];" << endl;
    }
    

    for(int i = 0; i < inputs; i++)
    {

        for(int j = positions[i].min; j < (positions[i].max); j++)
        {
            Creg(co, i, j, j + 1); //co << "REG " << i << "_" << j << " to " <<  i << "_" << j + 1 << endl;
        }
    }

    for (int i = 0; i < this->rows * this->cols; i++)
    {
        if (!actives[i]) continue;
        ops++;

        int ida = this->data[i * 3];
        int idb = this->data[i * 3 + 1];
        int func = this->data[i * 3 + 2];

        int id_min = 0, id_max = 0;
        if(func == MAX_CODE) {
            id_min =  2 * i + 1 + this->inputs;
            id_max =  2 * i + this->inputs;
        }
        else if(func == MIN_CODE) {
            id_min =  2 * i + this->inputs;
            id_max =  2 * i + 1 + this->inputs;
        }
        else { assert(0); }

        int best = max(positions[id_min].min, positions[id_max].min);

        Ccmp(co, 
            id_min, positions[id_min].min,
            id_max, positions[id_max].min,
            ida, best - 1,
            idb, best - 1
        );
        //co << "MIN - MAX: " << id_min << "_" << positions[id_min].min <<
        //    ", " << id_max << "_" << positions[id_max].min << " = " << ida << "_" << best - 1 << ", " << idb << "_" << best - 1 << endl;

        for(int j = positions[id_min].min; j < positions[id_min].max; j++)
        {
            Creg(co, id_min, j, j + 1); 
            //co << "REG " << id_min << "_" << j << " to " <<  id_min << "_" << j + 1 << endl;
        }


        for(int j = positions[id_max].min; j < (positions[id_max].max); j++)
        {
            Creg(co, id_max, j, j + 1); 
            //co << "REG " << id_max << "_" << j << " to " <<  id_max << "_" << j + 1 << endl;
        }
    }
    co << "  return sig_" << output << "_" << positions[output].min << ";" << endl;
    co << "}" << endl;
}

int ChromosomeAr::GetSizeConst() const
{
    if (!actives_detected)
        return -1;
    else {
        
        return 920 * p_ops + 86 * p_regs;
    }
}

void ChromosomeAr::PrintStat(ostream & o) 
{
    this->DetectActives();
    int ops, regs;
    this->GetParams(ops, regs);
    o << "size=" << GetSizeConst() <<";ops=" << ops << ";regs=" << regs << ";delay=" << this->positions[output].min;
}



#if 0
int ChromosomeAr::GetArea()
{
    // Results obtained by MAP - opt results of SN.
 //   cout << "Comparators: " << this->GetComparators() << endl;
   // cout << "Levels: " << this->GetLevels() << endl;
    return 0; //920 * this->GetComparators() + 86 * this->inputs * this->GetLevels();
}

int ChromosomeAr::GetLevels()
{
    /*//this->DetectActives();
    int i;
    for(i = 0; i < this->inputs; i++)
        this->levels[i] = 0;
        
    for(i = 0; i < this->rows * this->cols; i++)
    {
        int id_a = this->data[i * 3];
        int id_b = this->data[i * 3 + 1];
        int id_f = this->data[i * 3 + 2];
        if(id_f == MAX_CODE || id_f == MIN_CODE)
        {
            int lev = 0;
            
            lev = max(this->levels[id_a], this->levels[id_b]);
            this->levels[i + this->inputs] = lev + 1;
        }
    }
    
    return this->levels[this->output];*/
}
#endif

int ChromosomeAr::GetSize()
{
    this->DetectActives();
    return this->GetSizeConst();
}

int ChromosomeAr::GetComparators()
{
    return this->GetSize();
    #if 0
    this->DetectActives();

    for(int i = 0; i < this->rows * this->cols; i++)
        disable[i] = false;


    int comp = 0;
    for (int i = 0; i < this->rows * this->cols; i++)
    {
        if (!actives[i]) continue;
        if ( disable[i] ) continue;

        for(int j = i+1; j < this->rows * this->cols; j++)
        {
            int id_i_a = this->data[i * 3];
            int id_i_b = this->data[i * 3 + 1];
            int id_j_a = this->data[j * 3];
            int id_j_b = this->data[j * 3 + 1];
            if ( (id_i_a == id_j_a && id_i_b == id_j_b) || (id_i_a == id_j_b && id_i_b == id_j_a))
                {
                disable[j] = true;
             //   cout << "delete " << i <<" - " << j << endl;
                }

/*            if(i == 18 && j == 19)
            {
                cout << "(" << id_i_a << "," << id_i_b << ") == (" << id_j_a << "," << id_j_b << ")" << endl;
            }*/
        }
        
        comp++;
    }

    return comp;
    #endif
}

int ChromosomeAr::Ops(int oid)
{
    this->DetectActives();

    int comp = 0;
    for (int i = 0; i < this->rows * this->cols; i++)
    {
        if (!actives[i]) continue;

        //int id_a = this->data[i * 3];
        //int id_b = this->data[i * 3 + 1];
        int id_fn = this->data[i * 3 + 2];
       
        if(id_fn == oid)
            comp++;
    }

    return comp;
}


bdd ChromosomeAr::GenerateBdd()
{
    // todo gets active nodes
    this->DetectActives();

    // build 
    for (int i = 0; i < this->cols * this->rows; i++) {
        if (!actives[i]) 
            {
             //   cout << i << " not active " << endl;
                continue;
            }
        bdd a;
        bdd b;

        int ida = this->data[i * 3] - this->inputs;
        int idb = this->data[i * 3 + 1] - this->inputs;

        //cout << i << ": " << ida << " - " << idb << endl;
        if (ida >= 0) a = nodes[ida];
        else a = bdd_ithvar(this->data[i * 3]);

        if (idb >= 0) b = nodes[idb];
        else b = bdd_ithvar(this->data[i * 3 + 1]);

        if (this->data[i * 3 + 2] == MIN_CODE)
        {
            nodes[2 * i] = a & b;
            nodes[2 * i + 1] = a | b;
        }
        else
        {
            nodes[2 * i] = a | b;
            nodes[2 * i + 1] = a & b;
        }
    }

    //cout << "done" << endl;
    return nodes[output - this->inputs];

}


int ChromosomeAr::SimulateMedian(int * buff)
{
    // TODO smazat vypisy!!!
//    assert(0);
    // todo gets active nodes
    this->DetectActives();

    for (int i = 0; i < this->cols * this->rows; i++) {
        if (!actives[i]) continue;

        int ida = this->data[i * 3];
        int idb = this->data[i * 3 + 1];
        int func = this->data[i * 3 + 2];

        assert(ida >= 0 && ida < (2 * this->cols * this->rows + this->inputs));
        assert(idb >= 0 && idb < (2 * this->cols * this->rows + this->inputs));

        assert(func == MAX_CODE || func == MIN_CODE);
        if(func == MAX_CODE) {
            buff[2 * i + this->inputs] = max(buff[ida], buff[idb]);
            // cout << "buff[" << (2 * i + this->inputs) << "] = max(buff[" << ida << "], buff[" << idb << "]); // " 
            //    << buff[2 * i + this->inputs] << " = max(" << buff[ida] << ", " << buff[idb] << ")" << endl;
            buff[2 * i + 1 + this->inputs] = min(buff[ida], buff[idb]);
            // cout << "buff[" << (2 * i + 1 + this->inputs) << "] = min(buff[" << ida << "], buff[" << idb << "]); // " 
            //    << buff[2 * i + 1 + this->inputs] << " = min(" << buff[ida] << ", " << buff[idb] << ")" << endl;
        }
        else if(func == MIN_CODE) {
            buff[2 * i + this->inputs] = min(buff[ida], buff[idb]);
            // cout << "buff[" << (2 * i + this->inputs) << "] = min(buff[" << ida << "], buff[" << idb << "]); // " 
            //    << buff[2 * i + this->inputs] << " = min(" << buff[ida] << ", " << buff[idb] << ")" << endl;
            buff[2 * i + 1 + this->inputs] = max(buff[ida], buff[idb]);
            // cout << "buff[" << (2 * i + 1 + this->inputs) << "] = max(buff[" << ida << "], buff[" << idb << "]); // " 
            //    << buff[2 * i + 1 + this->inputs] << " = max(" << buff[ida] << ", " << buff[idb] << ")" << endl;
        }
    }

    // cout << "return buff[" << this->output << "]; // out = " << buff[this->output] << endl;
    return buff[this->output];

}
