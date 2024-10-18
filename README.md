# AxMED
Approximate medians and their formal verifications

This repository shows implementations of approximate medians described in paper submitted to ISCAS conference. The implementations and their parameters can be found in directories
*  [netlist](netlist) netlists for CGP (and for this tool)
*  [vhdl](VHDL) exports of all proposed 

The complete parameters of the proposed medians can be found at the end of this document.

## Median of Medians
The netlists can also be combined together using _median of medians_ approach using [mom.py](mom.py) script.

![median of medians](img/mom.png)

```bash
# 9-input median of medians (3x 03-input + 1x 03-input)
python3 mom.py 9 netlist/m03.cha netlist/m03.cha | tail -1 > tmp.cha

# 15-input median of medians (5x 03 + 1x 05)
python3 mom.py 15 netlist/m03.cha netlist/m05.cha | tail -1 > tmp.cha


# 15-input median of medians (3x 05 + 1x 03) - as illustrated
python3 mom.py 15 netlist/m05.cha netlist/m03.cha | tail -1 > tmp.cha

# Also the approximate implementations can be used from the netlist folder
```


## Formal verification of approximate medians
This tool is able to determine the histogram of errors for arbitrary approximate median having accurate Compare & swap units but somehow pruned. An example of this median is also _median of medians_ shown the abovementioned folders. 

### Basic usage
Firstly, it is imporant to build the BuDDy library (for BDDs) and 
```sh
cmake -B ./build
cmake --build ./build --config Release -j 8 
```

Then you can test the circuit
```sh
./median-validate ../netlist/s_9_3.cha
```

For details about formal verification, please reffer `PrintFitness` function in [fitnessbdd.cxx](src/fitnessbdd.cxx) folder.


It is possible to export C / VHDL (pipelined) representation
```sh
./median-validate -ccode.c ../netlist/s_9_3.cha
./median-validate -varch.vhdl ../netlist/s_9_3.cha
```


## Parameters of proposed approximate medians
## 9-input median
|   d_L |   d_H |   Q(M) |   size |   ops |   regs |   delay |   bw |    area |   power |   H0 | links                                                        |
|------:|------:|-------:|-------:|------:|-------:|--------:|-----:|--------:|--------:|-----:|:-------------------------------------------------------------|
|     0 |     0 |  0     |   5056 |    19 |     41 |       8 |    9 | 6272.19 |  6.4413 | 1    | [s_9_1](VHDL/s_9_1.vhd) l [netlist](netlist/s_9_1.cha)       |
|     1 |     1 |  0.015 |   4864 |    18 |     40 |       8 |    9 | 5989.68 |  6.245  | 0.98 | [s_9_2](VHDL/s_9_2.vhd) l [netlist](netlist/s_9_2.cha)       |
|     1 |     1 |  0.055 |   4544 |    17 |     37 |       8 |    9 | 5579.98 |  5.8469 | 0.94 | [s_9_3](VHDL/s_9_3.vhd) l [netlist](netlist/s_9_3.cha)       |
|     1 |     1 |  0.103 |   4288 |    16 |     35 |       8 |    9 | 5226.59 |  5.4303 | 0.9  | [s_9_4](VHDL/s_9_4.vhd) l [netlist](netlist/s_9_4.cha)       |
|     1 |     1 |  0.126 |   3648 |    15 |     27 |       7 |    9 | 4497.77 |  4.3876 | 0.87 | [s_9_5](VHDL/s_9_5.vhd) l [netlist](netlist/s_9_5.cha)       |
|     1 |     1 |  0.285 |   3264 |    14 |     23 |       6 |    9 | 4018.62 |  3.7624 | 0.71 | [s_9_6](VHDL/s_9_6.vhd) l [netlist](netlist/s_9_6.cha)       |
|     2 |     2 |  0.555 |   2624 |    12 |     17 |       5 |    9 | 3203.44 |  2.8635 | 0.52 | [s_9_7](VHDL/s_9_7.vhd) l [netlist](netlist/s_9_7.cha)       |
|     2 |     2 |  0.861 |   2304 |    10 |     16 |       5 |    9 | 2846.77 |  2.6612 | 0.39 | [s_9_8](VHDL/s_9_8.vhd) l [netlist](netlist/s_9_8.cha)       |
|     2 |     2 |  1.253 |   1600 |     8 |      9 |       4 |    9 | 1892.69 |  1.6027 | 0.32 | [s_9_9](VHDL/s_9_9.vhd) l [netlist](netlist/s_9_9.cha)       |
|     3 |     2 |  1.952 |   1152 |     6 |      6 |       3 |    9 | 1413.06 |  1.1352 | 0.25 | [s_9_10](VHDL/s_9_10.vhd) l [netlist](netlist/s_9_10.cha)    |
|     1 |     1 |  0.428 |   3008 |    12 |     23 |       6 |    9 | 3759.56 |  3.6395 | 0.57 | [mom9_v2](VHDL/mom9_v2.vhd) l [netlist](netlist/mom9_v2.cha) |
## 11-input median
|   d_L |   d_H |   Q(M) |   size |   ops |   regs |   delay |   bw |     area |   power |   H0 | links                                                        |
|------:|------:|-------:|-------:|------:|-------:|--------:|-----:|---------:|--------:|-----:|:-------------------------------------------------------------|
|     0 |     0 |  0     |   9472 |    28 |     92 |      15 |   11 | 11329.8  | 13.5553 | 1    | [s_11_1](VHDL/s_11_1.vhd) l [netlist](netlist/s_11_1.cha)    |
|     0 |     0 |  0     |   8704 |    27 |     82 |      13 |   11 | 10491.2  | 12.2776 | 1    | [s_11_2](VHDL/s_11_2.vhd) l [netlist](netlist/s_11_2.cha)    |
|     0 |     0 |  0     |   7424 |    27 |     62 |      11 |   11 |  9207.67 |  9.712  | 1    | [s_11_3](VHDL/s_11_3.vhd) l [netlist](netlist/s_11_3.cha)    |
|     0 |     0 |  0     |   6784 |    26 |     54 |       9 |   11 |  8477.44 |  8.6439 | 1    | [s_11_4](VHDL/s_11_4.vhd) l [netlist](netlist/s_11_4.cha)    |
|     1 |     1 |  0.008 |   6592 |    25 |     53 |       9 |   11 |  8197.26 |  8.4093 | 0.99 | [s_11_5](VHDL/s_11_5.vhd) l [netlist](netlist/s_11_5.cha)    |
|     1 |     1 |  0.106 |   6080 |    22 |     51 |       9 |   11 |  7407.9  |  7.8752 | 0.89 | [s_11_6](VHDL/s_11_6.vhd) l [netlist](netlist/s_11_6.cha)    |
|     1 |     1 |  0.19  |   5184 |    19 |     43 |       9 |   11 |  6258.58 |  6.6685 | 0.81 | [s_11_7](VHDL/s_11_7.vhd) l [netlist](netlist/s_11_7.cha)    |
|     2 |     2 |  0.567 |   4096 |    16 |     32 |       7 |   11 |  4889.17 |  4.9795 | 0.54 | [s_11_8](VHDL/s_11_8.vhd) l [netlist](netlist/s_11_8.cha)    |
|     2 |     2 |  1.018 |   3008 |    13 |     21 |       6 |   11 |  3609.39 |  3.4325 | 0.36 | [s_11_9](VHDL/s_11_9.vhd) l [netlist](netlist/s_11_9.cha)    |
|     2 |     3 |  1.761 |   2112 |    10 |     13 |       5 |   11 |  2440.36 |  2.2034 | 0.28 | [s_11_10](VHDL/s_11_10.vhd) l [netlist](netlist/s_11_10.cha) |
## 13-input median
|   d_L |   d_H |   Q(M) |   size |   ops |   regs |   delay |   bw |     area |   power |   H0 | links                                                        |
|------:|------:|-------:|-------:|------:|-------:|--------:|-----:|---------:|--------:|-----:|:-------------------------------------------------------------|
|     0 |     0 |  0     |  11456 |    39 |    101 |      13 |   13 | 13858.4  | 15.4563 | 1    | [s_13_1](VHDL/s_13_1.vhd) l [netlist](netlist/s_13_1.cha)    |
|     0 |     0 |  0     |  10816 |    37 |     95 |      13 |   13 | 13359.6  | 14.6254 | 1    | [s_13_2](VHDL/s_13_2.vhd) l [netlist](netlist/s_13_2.cha)    |
|     0 |     0 |  0     |   9856 |    36 |     82 |      11 |   13 | 12276.9  | 12.9259 | 1    | [s_13_3](VHDL/s_13_3.vhd) l [netlist](netlist/s_13_3.cha)    |
|     1 |     1 |  0.004 |   9984 |    35 |     86 |      11 |   13 | 12338.4  | 13.351  | 1    | [s_13_4](VHDL/s_13_4.vhd) l [netlist](netlist/s_13_4.cha)    |
|     1 |     1 |  0.006 |   9408 |    33 |     81 |      12 |   13 | 11564    | 12.5683 | 0.99 | [s_13_5](VHDL/s_13_5.vhd) l [netlist](netlist/s_13_5.cha)    |
|     1 |     1 |  0.063 |   8192 |    29 |     70 |      11 |   13 | 10015.3  | 10.8653 | 0.94 | [s_13_6](VHDL/s_13_6.vhd) l [netlist](netlist/s_13_6.cha)    |
|     1 |     1 |  0.177 |   6400 |    26 |     48 |       9 |   13 |  7944.31 |  7.8343 | 0.82 | [s_13_7](VHDL/s_13_7.vhd) l [netlist](netlist/s_13_7.cha)    |
|     2 |     2 |  0.486 |   5184 |    22 |     37 |       7 |   13 |  6390.46 |  6.0747 | 0.62 | [s_13_8](VHDL/s_13_8.vhd) l [netlist](netlist/s_13_8.cha)    |
|     3 |     2 |  1.101 |   3904 |    18 |     25 |       6 |   13 |  4746.5  |  4.2235 | 0.35 | [s_13_9](VHDL/s_13_9.vhd) l [netlist](netlist/s_13_9.cha)    |
|     3 |     3 |  1.91  |   3072 |    13 |     22 |       6 |   13 |  3538.05 |  3.5292 | 0.27 | [s_13_10](VHDL/s_13_10.vhd) l [netlist](netlist/s_13_10.cha) |
## 15-input median
|   d_L |   d_H |   Q(M) |   size |   ops |   regs |   delay |   bw |     area |   power |   H0 | links                                                        |
|------:|------:|-------:|-------:|------:|-------:|--------:|-----:|---------:|--------:|-----:|:-------------------------------------------------------------|
|     0 |     0 |  0     |  14720 |    50 |    130 |      15 |   15 | 17645.7  | 20.1727 | 1    | [s_15_1](VHDL/s_15_1.vhd) l [netlist](netlist/s_15_1.cha)    |
|     1 |     1 |  0.001 |  15168 |    46 |    145 |      17 |   15 | 18132.3  | 21.5135 | 1    | [s_15_2](VHDL/s_15_2.vhd) l [netlist](netlist/s_15_2.cha)    |
|     1 |     1 |  0.003 |  14912 |    45 |    143 |      16 |   15 | 17780.4  | 21.2516 | 1    | [s_15_3](VHDL/s_15_3.vhd) l [netlist](netlist/s_15_3.cha)    |
|     1 |     1 |  0.008 |  14080 |    43 |    134 |      15 |   15 | 16824.4  | 19.9981 | 0.99 | [s_15_4](VHDL/s_15_4.vhd) l [netlist](netlist/s_15_4.cha)    |
|     1 |     1 |  0.009 |  12608 |    41 |    115 |      14 |   15 | 15177.2  | 17.5422 | 0.99 | [s_15_5](VHDL/s_15_5.vhd) l [netlist](netlist/s_15_5.cha)    |
|     2 |     2 |  0.069 |  10496 |    37 |     90 |      12 |   15 | 12884.6  | 13.9001 | 0.94 | [s_15_6](VHDL/s_15_6.vhd) l [netlist](netlist/s_15_6.cha)    |
|     2 |     2 |  0.197 |   8576 |    32 |     70 |      10 |   15 | 10502    | 10.9612 | 0.81 | [s_15_7](VHDL/s_15_7.vhd) l [netlist](netlist/s_15_7.cha)    |
|     2 |     2 |  0.491 |   7168 |    27 |     58 |      10 |   15 |  8680.64 |  8.9997 | 0.61 | [s_15_8](VHDL/s_15_8.vhd) l [netlist](netlist/s_15_8.cha)    |
|     3 |     3 |  1.014 |   5312 |    22 |     39 |       8 |   15 |  6381.54 |  6.2261 | 0.4  | [s_15_9](VHDL/s_15_9.vhd) l [netlist](netlist/s_15_9.cha)    |
|     4 |     4 |  1.914 |   3968 |    17 |     28 |       7 |   15 |  4569.1  |  4.4609 | 0.28 | [s_15_10](VHDL/s_15_10.vhd) l [netlist](netlist/s_15_10.cha) |
## 19-input median
|   d_L |   d_H |   Q(M) |   size |   ops |   regs |   delay |   bw |     area |   power |   H0 | links                                                        |
|------:|------:|-------:|-------:|------:|-------:|--------:|-----:|---------:|--------:|-----:|:-------------------------------------------------------------|
|     0 |     0 |  0     |  23040 |    68 |    224 |      22 |   19 | 27521.6  | 33.519  | 1    | [s_19_1](VHDL/s_19_1.vhd) l [netlist](netlist/s_19_1.cha)    |
|     2 |     1 |  0.029 |  23232 |    61 |    241 |      23 |   19 | 27159.3  | 34.6344 | 0.97 | [s_19_2](VHDL/s_19_2.vhd) l [netlist](netlist/s_19_2.cha)    |
|     2 |     3 |  0.067 |  21632 |    62 |    214 |      19 |   19 | 25638.8  | 31.4375 | 0.94 | [s_19_3](VHDL/s_19_3.vhd) l [netlist](netlist/s_19_3.cha)    |
|     2 |     3 |  0.096 |  20672 |    58 |    207 |      19 |   19 | 24367    | 30.3588 | 0.92 | [s_19_4](VHDL/s_19_4.vhd) l [netlist](netlist/s_19_4.cha)    |
|     3 |     2 |  0.115 |  19584 |    53 |    200 |      19 |   19 | 22861.9  | 28.7521 | 0.9  | [s_19_5](VHDL/s_19_5.vhd) l [netlist](netlist/s_19_5.cha)    |
|     3 |     3 |  0.219 |  15872 |    50 |    148 |      15 |   19 | 18965.4  | 22.411  | 0.82 | [s_19_6](VHDL/s_19_6.vhd) l [netlist](netlist/s_19_6.cha)    |
|     3 |     3 |  0.39  |  13632 |    43 |    127 |      15 |   19 | 16158.9  | 19.0868 | 0.69 | [s_19_7](VHDL/s_19_7.vhd) l [netlist](netlist/s_19_7.cha)    |
|     4 |     4 |  0.721 |  10240 |    38 |     84 |      11 |   19 | 12471.2  | 13.0716 | 0.54 | [s_19_8](VHDL/s_19_8.vhd) l [netlist](netlist/s_19_8.cha)    |
|     4 |     4 |  1.241 |   7936 |    31 |     62 |      10 |   19 |  9508.02 |  9.6919 | 0.37 | [s_19_9](VHDL/s_19_9.vhd) l [netlist](netlist/s_19_9.cha)    |
|     5 |     4 |  2.392 |   5504 |    24 |     38 |       8 |   19 |  6461.32 |  6.1571 | 0.25 | [s_19_10](VHDL/s_19_10.vhd) l [netlist](netlist/s_19_10.cha) |
## 25-input median
|   d_L |   d_H |   Q(M) |   size |   ops |   regs |   delay |   bw |     area |   power |   H0 | links                                                           |
|------:|------:|-------:|-------:|------:|-------:|--------:|-----:|---------:|--------:|-----:|:----------------------------------------------------------------|
|     0 |     0 |  0     |  31488 |    99 |    294 |      24 |   25 | 38112.3  | 45.3873 | 1    | [s_25_1](VHDL/s_25_1.vhd) l [netlist](netlist/s_25_1.cha)       |
|     4 |     4 |  0.051 |  28416 |    89 |    266 |      22 |   25 | 34100.7  | 40.4884 | 0.96 | [s_25_2](VHDL/s_25_2.vhd) l [netlist](netlist/s_25_2.cha)       |
|     5 |     4 |  0.326 |  32192 |    78 |    347 |      25 |   25 | 37129.6  | 49.2163 | 0.75 | [s_25_3](VHDL/s_25_3.vhd) l [netlist](netlist/s_25_3.cha)       |
|     4 |     5 |  0.455 |  30272 |    74 |    325 |      24 |   25 | 34656.4  | 46.0021 | 0.66 | [s_25_4](VHDL/s_25_4.vhd) l [netlist](netlist/s_25_4.cha)       |
|     5 |     4 |  0.636 |  27904 |    67 |    302 |      24 |   25 | 32020.3  | 42.8021 | 0.57 | [s_25_5](VHDL/s_25_5.vhd) l [netlist](netlist/s_25_5.cha)       |
|     5 |     6 |  0.667 |  22528 |    64 |    224 |      20 |   25 | 26414.5  | 32.7923 | 0.6  | [s_25_6](VHDL/s_25_6.vhd) l [netlist](netlist/s_25_6.cha)       |
|     5 |     5 |  0.991 |  18880 |    58 |    179 |      18 |   25 | 22290.8  | 26.647  | 0.48 | [s_25_7](VHDL/s_25_7.vhd) l [netlist](netlist/s_25_7.cha)       |
|     5 |     5 |  1.419 |  14976 |    50 |    134 |      13 |   25 | 17779.4  | 20.3357 | 0.37 | [s_25_8](VHDL/s_25_8.vhd) l [netlist](netlist/s_25_8.cha)       |
|     6 |     6 |  2.372 |  11136 |    42 |     90 |      11 |   25 | 13267.1  | 13.9788 | 0.26 | [s_25_9](VHDL/s_25_9.vhd) l [netlist](netlist/s_25_9.cha)       |
|     7 |     7 |  3.597 |   7488 |    32 |     53 |       9 |   25 |  8746.81 |  8.5491 | 0.2  | [s_25_10](VHDL/s_25_10.vhd) l [netlist](netlist/s_25_10.cha)    |
|     4 |     4 |  1.947 |  10688 |    42 |     83 |      10 |   25 | 12092.5  | 12.8755 | 0.29 | [mom25_v2](VHDL/mom25_v2.vhd) l [netlist](netlist/mom25_v2.cha) |
