/* This file auto-generated from insns.dat by insns.pl - don't edit it */

#include "nasm.h"
#include "insns.h"

static const struct itemplate instrux_AAA[] = {
    {I_AAA, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27775, 1},
    ITEMPLATE_END
};

static const struct itemplate instrux_AAD[] = {
    {I_AAD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26783, 1},
    {I_AAD, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26787, 2},
    ITEMPLATE_END
};

static const struct itemplate instrux_AAM[] = {
    {I_AAM, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26791, 1},
    {I_AAM, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26795, 2},
    ITEMPLATE_END
};

static const struct itemplate instrux_AAS[] = {
    {I_AAS, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27778, 1},
    ITEMPLATE_END
};

static const struct itemplate instrux_ADC[] = {
    {I_ADC, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+25033, 3},
    {I_ADC, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+25034, 0},
    {I_ADC, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21421, 3},
    {I_ADC, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21422, 0},
    {I_ADC, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21427, 4},
    {I_ADC, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21428, 5},
    {I_ADC, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21433, 6},
    {I_ADC, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21434, 7},
    {I_ADC, 2, {REG_GPR|BITS8,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+16020, 8},
    {I_ADC, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+16020, 0},
    {I_ADC, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25038, 8},
    {I_ADC, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+25038, 0},
    {I_ADC, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25043, 9},
    {I_ADC, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+25043, 5},
    {I_ADC, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25048, 10},
    {I_ADC, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+25048, 7},
    {I_ADC, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+12636, 11},
    {I_ADC, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+12643, 12},
    {I_ADC, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+12650, 13},
    {I_ADC, 2, {REG_AL,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26799, 8},
    {I_ADC, 2, {REG_AX,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12637, 8},
    {I_ADC, 2, {REG_AX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25053, 8},
    {I_ADC, 2, {REG_EAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12644, 9},
    {I_ADC, 2, {REG_EAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25058, 9},
    {I_ADC, 2, {REG_RAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12651, 10},
    {I_ADC, 2, {REG_RAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25063, 10},
    {I_ADC, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21439, 3},
    {I_ADC, 2, {RM_GPR|BITS16,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12636, 3},
    {I_ADC, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12657, 3},
    {I_ADC, 2, {RM_GPR|BITS32,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12643, 4},
    {I_ADC, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12664, 4},
    {I_ADC, 2, {RM_GPR|BITS64,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12650, 6},
    {I_ADC, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12671, 6},
    {I_ADC, 2, {MEMORY,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+21439, 3},
    {I_ADC, 2, {MEMORY,SBYTEWORD|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12636, 3},
    {I_ADC, 2, {MEMORY,IMMEDIATE|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12657, 3},
    {I_ADC, 2, {MEMORY,SBYTEDWORD|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12643, 4},
    {I_ADC, 2, {MEMORY,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12664, 4},
    {I_ADC, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21445, 14},
    ITEMPLATE_END
};

static const struct itemplate instrux_ADCX[] = {
    {I_ADCX, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+7676, 124},
    {I_ADCX, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+7684, 125},
    ITEMPLATE_END
};

static const struct itemplate instrux_ADD[] = {
    {I_ADD, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+25068, 3},
    {I_ADD, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+25069, 0},
    {I_ADD, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21451, 3},
    {I_ADD, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21452, 0},
    {I_ADD, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21457, 4},
    {I_ADD, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21458, 5},
    {I_ADD, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21463, 6},
    {I_ADD, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21464, 7},
    {I_ADD, 2, {REG_GPR|BITS8,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+19765, 8},
    {I_ADD, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+19765, 0},
    {I_ADD, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25073, 8},
    {I_ADD, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+25073, 0},
    {I_ADD, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25078, 9},
    {I_ADD, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+25078, 5},
    {I_ADD, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25083, 10},
    {I_ADD, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+25083, 7},
    {I_ADD, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+12678, 11},
    {I_ADD, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+12685, 12},
    {I_ADD, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+12692, 13},
    {I_ADD, 2, {REG_AL,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26803, 8},
    {I_ADD, 2, {REG_AX,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12679, 8},
    {I_ADD, 2, {REG_AX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25088, 8},
    {I_ADD, 2, {REG_EAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12686, 9},
    {I_ADD, 2, {REG_EAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25093, 9},
    {I_ADD, 2, {REG_RAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12693, 10},
    {I_ADD, 2, {REG_RAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25098, 10},
    {I_ADD, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21469, 3},
    {I_ADD, 2, {RM_GPR|BITS16,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12678, 3},
    {I_ADD, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12699, 3},
    {I_ADD, 2, {RM_GPR|BITS32,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12685, 4},
    {I_ADD, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12706, 4},
    {I_ADD, 2, {RM_GPR|BITS64,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12692, 6},
    {I_ADD, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12713, 6},
    {I_ADD, 2, {MEMORY,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+21469, 3},
    {I_ADD, 2, {MEMORY,SBYTEWORD|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12678, 3},
    {I_ADD, 2, {MEMORY,IMMEDIATE|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12699, 3},
    {I_ADD, 2, {MEMORY,SBYTEDWORD|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12685, 4},
    {I_ADD, 2, {MEMORY,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12706, 4},
    {I_ADD, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21475, 14},
    ITEMPLATE_END
};

static const struct itemplate instrux_ADDPD[] = {
    {I_ADDPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23323, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_ADDPS[] = {
    {I_ADDPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22627, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_ADDSD[] = {
    {I_ADDSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23329, 136},
    ITEMPLATE_END
};

static const struct itemplate instrux_ADDSS[] = {
    {I_ADDSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22633, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_ADDSUBPD[] = {
    {I_ADDSUBPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23599, 146},
    ITEMPLATE_END
};

static const struct itemplate instrux_ADDSUBPS[] = {
    {I_ADDSUBPS, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23605, 146},
    ITEMPLATE_END
};

static const struct itemplate instrux_ADOX[] = {
    {I_ADOX, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+7692, 124},
    {I_ADOX, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+7700, 125},
    ITEMPLATE_END
};

static const struct itemplate instrux_AESDEC[] = {
    {I_AESDEC, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14547, 173},
    ITEMPLATE_END
};

static const struct itemplate instrux_AESDECLAST[] = {
    {I_AESDECLAST, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14554, 173},
    ITEMPLATE_END
};

static const struct itemplate instrux_AESENC[] = {
    {I_AESENC, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14533, 173},
    ITEMPLATE_END
};

static const struct itemplate instrux_AESENCLAST[] = {
    {I_AESENCLAST, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14540, 173},
    ITEMPLATE_END
};

static const struct itemplate instrux_AESIMC[] = {
    {I_AESIMC, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14561, 173},
    ITEMPLATE_END
};

static const struct itemplate instrux_AESKEYGENASSIST[] = {
    {I_AESKEYGENASSIST, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+6756, 173},
    ITEMPLATE_END
};

static const struct itemplate instrux_AND[] = {
    {I_AND, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+25103, 3},
    {I_AND, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+25104, 0},
    {I_AND, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21481, 3},
    {I_AND, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21482, 0},
    {I_AND, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21487, 4},
    {I_AND, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21488, 5},
    {I_AND, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21493, 6},
    {I_AND, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21494, 7},
    {I_AND, 2, {REG_GPR|BITS8,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+20045, 8},
    {I_AND, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+20045, 0},
    {I_AND, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25108, 8},
    {I_AND, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+25108, 0},
    {I_AND, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25113, 9},
    {I_AND, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+25113, 5},
    {I_AND, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25118, 10},
    {I_AND, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+25118, 7},
    {I_AND, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+12720, 11},
    {I_AND, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+12727, 12},
    {I_AND, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+12734, 13},
    {I_AND, 2, {REG_AL,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26807, 8},
    {I_AND, 2, {REG_AX,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12721, 8},
    {I_AND, 2, {REG_AX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25123, 8},
    {I_AND, 2, {REG_EAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12728, 9},
    {I_AND, 2, {REG_EAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25128, 9},
    {I_AND, 2, {REG_RAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12735, 10},
    {I_AND, 2, {REG_RAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25133, 10},
    {I_AND, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21499, 3},
    {I_AND, 2, {RM_GPR|BITS16,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12720, 3},
    {I_AND, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12741, 3},
    {I_AND, 2, {RM_GPR|BITS32,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12727, 4},
    {I_AND, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12748, 4},
    {I_AND, 2, {RM_GPR|BITS64,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12734, 6},
    {I_AND, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12755, 6},
    {I_AND, 2, {MEMORY,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+21499, 3},
    {I_AND, 2, {MEMORY,SBYTEWORD|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12720, 3},
    {I_AND, 2, {MEMORY,IMMEDIATE|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12741, 3},
    {I_AND, 2, {MEMORY,SBYTEDWORD|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12727, 4},
    {I_AND, 2, {MEMORY,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12748, 4},
    {I_AND, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21505, 14},
    ITEMPLATE_END
};

static const struct itemplate instrux_ANDN[] = {
    {I_ANDN, 3, {REG_GPR|BITS32,REG_GPR|BITS32,RM_GPR|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+20994, 192},
    {I_ANDN, 3, {REG_GPR|BITS64,REG_GPR|BITS64,RM_GPR|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+21001, 193},
    ITEMPLATE_END
};

static const struct itemplate instrux_ANDNPD[] = {
    {I_ANDNPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23335, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_ANDNPS[] = {
    {I_ANDNPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22639, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_ANDPD[] = {
    {I_ANDPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23341, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_ANDPS[] = {
    {I_ANDPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22645, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_ARPL[] = {
    {I_ARPL, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+26811, 15},
    {I_ARPL, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+26811, 16},
    ITEMPLATE_END
};

static const struct itemplate instrux_BB0_RESET[] = {
    {I_BB0_RESET, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26815, 17},
    ITEMPLATE_END
};

static const struct itemplate instrux_BB1_RESET[] = {
    {I_BB1_RESET, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26819, 17},
    ITEMPLATE_END
};

static const struct itemplate instrux_BEXTR[] = {
    {I_BEXTR, 3, {REG_GPR|BITS32,RM_GPR|BITS32,REG_GPR|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+21008, 192},
    {I_BEXTR, 3, {REG_GPR|BITS64,RM_GPR|BITS64,REG_GPR|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+21015, 193},
    {I_BEXTR, 3, {REG_GPR|BITS32,RM_GPR|BITS32,IMMEDIATE|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+9700, 194},
    {I_BEXTR, 3, {REG_GPR|BITS64,RM_GPR|BITS64,IMMEDIATE|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+9708, 195},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLCFILL[] = {
    {I_BLCFILL, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21078, 194},
    {I_BLCFILL, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21085, 195},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLCI[] = {
    {I_BLCI, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21022, 194},
    {I_BLCI, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21029, 195},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLCIC[] = {
    {I_BLCIC, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21036, 194},
    {I_BLCIC, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21043, 195},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLCMSK[] = {
    {I_BLCMSK, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21106, 194},
    {I_BLCMSK, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21113, 195},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLCS[] = {
    {I_BLCS, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21148, 194},
    {I_BLCS, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21155, 195},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLENDPD[] = {
    {I_BLENDPD, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6540, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLENDPS[] = {
    {I_BLENDPS, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6548, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLENDVPD[] = {
    {I_BLENDVPD, 3, {XMM_L16,RM_XMM_L16,XMM0,0,0}, NO_DECORATOR, nasm_bytecodes+14295, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLENDVPS[] = {
    {I_BLENDVPS, 3, {XMM_L16,RM_XMM_L16,XMM0,0,0}, NO_DECORATOR, nasm_bytecodes+14302, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLSFILL[] = {
    {I_BLSFILL, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21092, 194},
    {I_BLSFILL, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21099, 195},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLSI[] = {
    {I_BLSI, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21050, 192},
    {I_BLSI, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21057, 193},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLSIC[] = {
    {I_BLSIC, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21064, 194},
    {I_BLSIC, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21071, 195},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLSMSK[] = {
    {I_BLSMSK, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21120, 192},
    {I_BLSMSK, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21127, 193},
    ITEMPLATE_END
};

static const struct itemplate instrux_BLSR[] = {
    {I_BLSR, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21134, 192},
    {I_BLSR, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21141, 193},
    ITEMPLATE_END
};

static const struct itemplate instrux_BNDCL[] = {
    {I_BNDCL, 2, {BNDREG,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21394, 207},
    {I_BNDCL, 2, {BNDREG,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21394, 208},
    {I_BNDCL, 2, {BNDREG,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21393, 209},
    ITEMPLATE_END
};

static const struct itemplate instrux_BNDCN[] = {
    {I_BNDCN, 2, {BNDREG,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21408, 207},
    {I_BNDCN, 2, {BNDREG,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21408, 208},
    {I_BNDCN, 2, {BNDREG,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21407, 209},
    ITEMPLATE_END
};

static const struct itemplate instrux_BNDCU[] = {
    {I_BNDCU, 2, {BNDREG,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21401, 207},
    {I_BNDCU, 2, {BNDREG,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21401, 208},
    {I_BNDCU, 2, {BNDREG,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21400, 209},
    ITEMPLATE_END
};

static const struct itemplate instrux_BNDLDX[] = {
    {I_BNDLDX, 2, {BNDREG,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+23834, 206},
    {I_BNDLDX, 3, {BNDREG,MEMORY,REG_GPR|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+23845, 210},
    {I_BNDLDX, 3, {BNDREG,MEMORY,REG_GPR|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+23845, 211},
    ITEMPLATE_END
};

static const struct itemplate instrux_BNDMK[] = {
    {I_BNDMK, 2, {BNDREG,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+23827, 206},
    ITEMPLATE_END
};

static const struct itemplate instrux_BNDMOV[] = {
    {I_BNDMOV, 2, {BNDREG,BNDREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+23833, 207},
    {I_BNDMOV, 2, {BNDREG,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+23833, 207},
    {I_BNDMOV, 2, {BNDREG,BNDREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+23839, 207},
    {I_BNDMOV, 2, {MEMORY,BNDREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+23839, 207},
    ITEMPLATE_END
};

static const struct itemplate instrux_BNDSTX[] = {
    {I_BNDSTX, 2, {MEMORY,BNDREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+23840, 206},
    {I_BNDSTX, 3, {MEMORY,REG_GPR|BITS32,BNDREG,0,0}, NO_DECORATOR, nasm_bytecodes+23851, 210},
    {I_BNDSTX, 3, {MEMORY,REG_GPR|BITS64,BNDREG,0,0}, NO_DECORATOR, nasm_bytecodes+23851, 211},
    {I_BNDSTX, 3, {MEMORY,BNDREG,REG_GPR|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+23857, 210},
    {I_BNDSTX, 3, {MEMORY,BNDREG,REG_GPR|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+23857, 211},
    ITEMPLATE_END
};

static const struct itemplate instrux_BOUND[] = {
    {I_BOUND, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25138, 18},
    {I_BOUND, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25143, 19},
    ITEMPLATE_END
};

static const struct itemplate instrux_BSF[] = {
    {I_BSF, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+12762, 9},
    {I_BSF, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12762, 5},
    {I_BSF, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+12769, 9},
    {I_BSF, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12769, 5},
    {I_BSF, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+12776, 10},
    {I_BSF, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12776, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_BSR[] = {
    {I_BSR, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+12783, 9},
    {I_BSR, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12783, 5},
    {I_BSR, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+12790, 9},
    {I_BSR, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12790, 5},
    {I_BSR, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+12797, 10},
    {I_BSR, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12797, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_BSWAP[] = {
    {I_BSWAP, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21511, 20},
    {I_BSWAP, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21517, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_BT[] = {
    {I_BT, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21523, 9},
    {I_BT, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21523, 5},
    {I_BT, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21529, 9},
    {I_BT, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21529, 5},
    {I_BT, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21535, 10},
    {I_BT, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21535, 7},
    {I_BT, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12804, 21},
    {I_BT, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12811, 21},
    {I_BT, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12818, 22},
    ITEMPLATE_END
};

static const struct itemplate instrux_BTC[] = {
    {I_BTC, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12825, 4},
    {I_BTC, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12826, 5},
    {I_BTC, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12832, 4},
    {I_BTC, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12833, 5},
    {I_BTC, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12839, 6},
    {I_BTC, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12840, 7},
    {I_BTC, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+5964, 23},
    {I_BTC, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+5972, 23},
    {I_BTC, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+5980, 24},
    ITEMPLATE_END
};

static const struct itemplate instrux_BTR[] = {
    {I_BTR, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12846, 4},
    {I_BTR, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12847, 5},
    {I_BTR, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12853, 4},
    {I_BTR, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12854, 5},
    {I_BTR, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12860, 6},
    {I_BTR, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12861, 7},
    {I_BTR, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+5988, 23},
    {I_BTR, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+5996, 23},
    {I_BTR, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+6004, 24},
    ITEMPLATE_END
};

static const struct itemplate instrux_BTS[] = {
    {I_BTS, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12867, 4},
    {I_BTS, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12868, 5},
    {I_BTS, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12874, 4},
    {I_BTS, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12875, 5},
    {I_BTS, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12881, 6},
    {I_BTS, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12882, 7},
    {I_BTS, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+6012, 23},
    {I_BTS, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+6020, 23},
    {I_BTS, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+6028, 24},
    ITEMPLATE_END
};

static const struct itemplate instrux_BZHI[] = {
    {I_BZHI, 3, {REG_GPR|BITS32,RM_GPR|BITS32,REG_GPR|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+21162, 196},
    {I_BZHI, 3, {REG_GPR|BITS64,RM_GPR|BITS64,REG_GPR|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+21169, 197},
    ITEMPLATE_END
};

static const struct itemplate instrux_CALL[] = {
    {I_CALL, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25148, 25},
    {I_CALL, 1, {IMMEDIATE|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25148, 25},
    {I_CALL, 1, {IMMEDIATE|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21541, 1},
    {I_CALL, 1, {IMMEDIATE|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25153, 26},
    {I_CALL, 1, {IMMEDIATE|BITS16|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25153, 26},
    {I_CALL, 1, {IMMEDIATE|BITS16|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21547, 1},
    {I_CALL, 1, {IMMEDIATE|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25158, 27},
    {I_CALL, 1, {IMMEDIATE|BITS32|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25158, 27},
    {I_CALL, 1, {IMMEDIATE|BITS32|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21553, 19},
    {I_CALL, 1, {IMMEDIATE|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25163, 28},
    {I_CALL, 1, {IMMEDIATE|BITS64|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25163, 28},
    {I_CALL, 2, {IMMEDIATE|COLON,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21559, 1},
    {I_CALL, 2, {IMMEDIATE|BITS16|COLON,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21565, 1},
    {I_CALL, 2, {IMMEDIATE|COLON,IMMEDIATE|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21565, 1},
    {I_CALL, 2, {IMMEDIATE|BITS32|COLON,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21571, 19},
    {I_CALL, 2, {IMMEDIATE|COLON,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21571, 19},
    {I_CALL, 1, {MEMORY|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25168, 1},
    {I_CALL, 1, {MEMORY|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25173, 7},
    {I_CALL, 1, {MEMORY|BITS16|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25178, 0},
    {I_CALL, 1, {MEMORY|BITS32|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25183, 5},
    {I_CALL, 1, {MEMORY|BITS64|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25173, 7},
    {I_CALL, 1, {MEMORY|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25188, 25},
    {I_CALL, 1, {RM_GPR|BITS16|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25193, 26},
    {I_CALL, 1, {RM_GPR|BITS32|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25198, 27},
    {I_CALL, 1, {RM_GPR|BITS64|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25203, 28},
    {I_CALL, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25188, 25},
    {I_CALL, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25193, 26},
    {I_CALL, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25198, 27},
    {I_CALL, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25203, 28},
    ITEMPLATE_END
};

static const struct itemplate instrux_CBW[] = {
    {I_CBW, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26823, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_CDQ[] = {
    {I_CDQ, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26827, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_CDQE[] = {
    {I_CDQE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26831, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_CLAC[] = {
    {I_CLAC, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26748, 183},
    ITEMPLATE_END
};

static const struct itemplate instrux_CLC[] = {
    {I_CLC, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26570, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_CLD[] = {
    {I_CLD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27781, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_CLFLUSH[] = {
    {I_CLFLUSH, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22903, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_CLGI[] = {
    {I_CLGI, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26693, 148},
    ITEMPLATE_END
};

static const struct itemplate instrux_CLI[] = {
    {I_CLI, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27784, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_CLTS[] = {
    {I_CLTS, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26835, 29},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMC[] = {
    {I_CMC, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27787, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMP[] = {
    {I_CMP, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26839, 8},
    {I_CMP, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26839, 0},
    {I_CMP, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+25208, 8},
    {I_CMP, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+25208, 0},
    {I_CMP, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+25213, 9},
    {I_CMP, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+25213, 5},
    {I_CMP, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+25218, 10},
    {I_CMP, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+25218, 7},
    {I_CMP, 2, {REG_GPR|BITS8,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+20003, 8},
    {I_CMP, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+20003, 0},
    {I_CMP, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25223, 8},
    {I_CMP, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+25223, 0},
    {I_CMP, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25228, 9},
    {I_CMP, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+25228, 5},
    {I_CMP, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25233, 10},
    {I_CMP, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+25233, 7},
    {I_CMP, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+21577, 0},
    {I_CMP, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+21583, 5},
    {I_CMP, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+21589, 7},
    {I_CMP, 2, {REG_AL,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26843, 8},
    {I_CMP, 2, {REG_AX,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+21577, 8},
    {I_CMP, 2, {REG_AX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25238, 8},
    {I_CMP, 2, {REG_EAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+21583, 9},
    {I_CMP, 2, {REG_EAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25243, 9},
    {I_CMP, 2, {REG_RAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+21589, 10},
    {I_CMP, 2, {REG_RAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25248, 10},
    {I_CMP, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25253, 8},
    {I_CMP, 2, {RM_GPR|BITS16,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+21577, 8},
    {I_CMP, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21595, 8},
    {I_CMP, 2, {RM_GPR|BITS32,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+21583, 9},
    {I_CMP, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21601, 9},
    {I_CMP, 2, {RM_GPR|BITS64,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+21589, 10},
    {I_CMP, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21607, 10},
    {I_CMP, 2, {MEMORY,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+25253, 8},
    {I_CMP, 2, {MEMORY,SBYTEWORD|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21577, 8},
    {I_CMP, 2, {MEMORY,IMMEDIATE|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21595, 8},
    {I_CMP, 2, {MEMORY,SBYTEDWORD|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21583, 9},
    {I_CMP, 2, {MEMORY,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21601, 9},
    {I_CMP, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25258, 30},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPEQPD[] = {
    {I_CMPEQPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6364, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPEQPS[] = {
    {I_CMPEQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+6188, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPEQSD[] = {
    {I_CMPEQSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6372, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPEQSS[] = {
    {I_CMPEQSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+6196, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPLEPD[] = {
    {I_CMPLEPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6380, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPLEPS[] = {
    {I_CMPLEPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+6204, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPLESD[] = {
    {I_CMPLESD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6388, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPLESS[] = {
    {I_CMPLESS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+6212, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPLTPD[] = {
    {I_CMPLTPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6396, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPLTPS[] = {
    {I_CMPLTPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+6220, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPLTSD[] = {
    {I_CMPLTSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6404, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPLTSS[] = {
    {I_CMPLTSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+6228, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPNEQPD[] = {
    {I_CMPNEQPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6412, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPNEQPS[] = {
    {I_CMPNEQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+6236, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPNEQSD[] = {
    {I_CMPNEQSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6420, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPNEQSS[] = {
    {I_CMPNEQSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+6244, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPNLEPD[] = {
    {I_CMPNLEPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6428, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPNLEPS[] = {
    {I_CMPNLEPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+6252, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPNLESD[] = {
    {I_CMPNLESD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6436, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPNLESS[] = {
    {I_CMPNLESS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+6260, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPNLTPD[] = {
    {I_CMPNLTPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6444, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPNLTPS[] = {
    {I_CMPNLTPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+6268, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPNLTSD[] = {
    {I_CMPNLTSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6452, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPNLTSS[] = {
    {I_CMPNLTSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+6276, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPORDPD[] = {
    {I_CMPORDPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6460, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPORDPS[] = {
    {I_CMPORDPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+6284, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPORDSD[] = {
    {I_CMPORDSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6468, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPORDSS[] = {
    {I_CMPORDSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+6292, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPPD[] = {
    {I_CMPPD, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+13980, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPPS[] = {
    {I_CMPPS, 3, {XMM_L16,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13672, 112},
    {I_CMPPS, 3, {XMM_L16,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13672, 112},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPSB[] = {
    {I_CMPSB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26847, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPSD[] = {
    {I_CMPSD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25263, 5},
    {I_CMPSD, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+13987, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPSQ[] = {
    {I_CMPSQ, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25268, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPSS[] = {
    {I_CMPSS, 3, {XMM_L16,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13679, 112},
    {I_CMPSS, 3, {XMM_L16,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13679, 112},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPSW[] = {
    {I_CMPSW, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25273, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPUNORDPD[] = {
    {I_CMPUNORDPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6476, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPUNORDPS[] = {
    {I_CMPUNORDPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+6300, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPUNORDSD[] = {
    {I_CMPUNORDSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6484, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPUNORDSS[] = {
    {I_CMPUNORDSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+6308, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPXCHG[] = {
    {I_CMPXCHG, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+21613, 31},
    {I_CMPXCHG, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+21614, 32},
    {I_CMPXCHG, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12888, 31},
    {I_CMPXCHG, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12889, 32},
    {I_CMPXCHG, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12895, 31},
    {I_CMPXCHG, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12896, 32},
    {I_CMPXCHG, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12902, 6},
    {I_CMPXCHG, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12903, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPXCHG16B[] = {
    {I_CMPXCHG16B, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21631, 13},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPXCHG486[] = {
    {I_CMPXCHG486, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+25278, 33},
    {I_CMPXCHG486, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+25278, 34},
    {I_CMPXCHG486, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21619, 33},
    {I_CMPXCHG486, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21619, 34},
    {I_CMPXCHG486, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21625, 33},
    {I_CMPXCHG486, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21625, 34},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMPXCHG8B[] = {
    {I_CMPXCHG8B, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+12909, 35},
    ITEMPLATE_END
};

static const struct itemplate instrux_COMISD[] = {
    {I_COMISD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23347, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_COMISS[] = {
    {I_COMISS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22651, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_CPUID[] = {
    {I_CPUID, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26851, 32},
    ITEMPLATE_END
};

static const struct itemplate instrux_CPU_READ[] = {
    {I_CPU_READ, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26855, 17},
    ITEMPLATE_END
};

static const struct itemplate instrux_CPU_WRITE[] = {
    {I_CPU_WRITE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26859, 17},
    ITEMPLATE_END
};

static const struct itemplate instrux_CQO[] = {
    {I_CQO, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26863, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_CRC32[] = {
    {I_CRC32, 2, {REG_GPR|BITS32,RM_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+6645, 166},
    {I_CRC32, 2, {REG_GPR|BITS32,RM_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6628, 166},
    {I_CRC32, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+6636, 166},
    {I_CRC32, 2, {REG_GPR|BITS64,RM_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+6644, 167},
    {I_CRC32, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+6652, 167},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTDQ2PD[] = {
    {I_CVTDQ2PD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23353, 136},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTDQ2PS[] = {
    {I_CVTDQ2PS, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23359, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTPD2DQ[] = {
    {I_CVTPD2DQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23365, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTPD2PI[] = {
    {I_CVTPD2PI, 2, {MMXREG,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23371, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTPD2PS[] = {
    {I_CVTPD2PS, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23377, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTPI2PD[] = {
    {I_CVTPI2PD, 2, {XMM_L16,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+23383, 136},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTPI2PS[] = {
    {I_CVTPI2PS, 2, {XMM_L16,RM_MMX|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22657, 113},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTPS2DQ[] = {
    {I_CVTPS2DQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23389, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTPS2PD[] = {
    {I_CVTPS2PD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23395, 136},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTPS2PI[] = {
    {I_CVTPS2PI, 2, {MMXREG,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22663, 113},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTSD2SI[] = {
    {I_CVTSD2SI, 2, {REG_GPR|BITS32,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13994, 142},
    {I_CVTSD2SI, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+13994, 142},
    {I_CVTSD2SI, 2, {REG_GPR|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14001, 143},
    {I_CVTSD2SI, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+14001, 143},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTSD2SS[] = {
    {I_CVTSD2SS, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23401, 136},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTSI2SD[] = {
    {I_CVTSI2SD, 2, {XMM_L16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+14016, 144},
    {I_CVTSI2SD, 2, {XMM_L16,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+14008, 144},
    {I_CVTSI2SD, 2, {XMM_L16,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+14015, 143},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTSI2SS[] = {
    {I_CVTSI2SS, 2, {XMM_L16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+13687, 114},
    {I_CVTSI2SS, 2, {XMM_L16,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13687, 114},
    {I_CVTSI2SS, 2, {XMM_L16,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+13686, 115},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTSS2SD[] = {
    {I_CVTSS2SD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23407, 135},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTSS2SI[] = {
    {I_CVTSS2SI, 2, {REG_GPR|BITS32,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13694, 114},
    {I_CVTSS2SI, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+13694, 114},
    {I_CVTSS2SI, 2, {REG_GPR|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13693, 116},
    {I_CVTSS2SI, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+13693, 116},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTTPD2DQ[] = {
    {I_CVTTPD2DQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23419, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTTPD2PI[] = {
    {I_CVTTPD2PI, 2, {MMXREG,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23413, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTTPS2DQ[] = {
    {I_CVTTPS2DQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23425, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTTPS2PI[] = {
    {I_CVTTPS2PI, 2, {MMXREG,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22669, 117},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTTSD2SI[] = {
    {I_CVTTSD2SI, 2, {REG_GPR|BITS32,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14022, 142},
    {I_CVTTSD2SI, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+14022, 142},
    {I_CVTTSD2SI, 2, {REG_GPR|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14029, 143},
    {I_CVTTSD2SI, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+14029, 143},
    ITEMPLATE_END
};

static const struct itemplate instrux_CVTTSS2SI[] = {
    {I_CVTTSS2SI, 2, {REG_GPR|BITS32,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13701, 114},
    {I_CVTTSS2SI, 2, {REG_GPR|BITS64,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13700, 116},
    ITEMPLATE_END
};

static const struct itemplate instrux_CWD[] = {
    {I_CWD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26867, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_CWDE[] = {
    {I_CWDE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26871, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_DAA[] = {
    {I_DAA, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27790, 1},
    ITEMPLATE_END
};

static const struct itemplate instrux_DAS[] = {
    {I_DAS, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27793, 1},
    ITEMPLATE_END
};

static const struct itemplate instrux_DB[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_DD[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_DEC[] = {
    {I_DEC, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26875, 1},
    {I_DEC, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26879, 19},
    {I_DEC, 1, {RM_GPR|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25283, 11},
    {I_DEC, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21637, 11},
    {I_DEC, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21643, 12},
    {I_DEC, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21649, 13},
    ITEMPLATE_END
};

static const struct itemplate instrux_DIV[] = {
    {I_DIV, 1, {RM_GPR|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26883, 0},
    {I_DIV, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25288, 0},
    {I_DIV, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25293, 5},
    {I_DIV, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25298, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_DIVPD[] = {
    {I_DIVPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23431, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_DIVPS[] = {
    {I_DIVPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22675, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_DIVSD[] = {
    {I_DIVSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23437, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_DIVSS[] = {
    {I_DIVSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22681, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_DMINT[] = {
    {I_DMINT, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26887, 36},
    ITEMPLATE_END
};

static const struct itemplate instrux_DO[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_DPPD[] = {
    {I_DPPD, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6556, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_DPPS[] = {
    {I_DPPS, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6564, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_DQ[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_DT[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_DW[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_DY[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_DZ[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_EMMS[] = {
    {I_EMMS, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26891, 37},
    ITEMPLATE_END
};

static const struct itemplate instrux_ENTER[] = {
    {I_ENTER, 2, {IMMEDIATE,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25303, 38},
    ITEMPLATE_END
};

static const struct itemplate instrux_EQU[] = {
    {I_EQU, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27834, 0},
    {I_EQU, 2, {IMMEDIATE|COLON,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+27834, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_EXTRACTPS[] = {
    {I_EXTRACTPS, 3, {RM_GPR|BITS32,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1501, 159},
    {I_EXTRACTPS, 3, {REG_GPR|BITS64,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1500, 160},
    ITEMPLATE_END
};

static const struct itemplate instrux_EXTRQ[] = {
    {I_EXTRQ, 3, {XMM_L16,IMMEDIATE,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6524, 156},
    {I_EXTRQ, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23683, 156},
    ITEMPLATE_END
};

static const struct itemplate instrux_F2XM1[] = {
    {I_F2XM1, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26895, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FABS[] = {
    {I_FABS, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26899, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FADD[] = {
    {I_FADD, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26903, 39},
    {I_FADD, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26907, 39},
    {I_FADD, 1, {FPUREG|TO,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25308, 39},
    {I_FADD, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25313, 39},
    {I_FADD, 2, {FPUREG,FPU0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25308, 39},
    {I_FADD, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25318, 39},
    {I_FADD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26911, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FADDP[] = {
    {I_FADDP, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25323, 39},
    {I_FADDP, 2, {FPUREG,FPU0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25323, 39},
    {I_FADDP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26911, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FBLD[] = {
    {I_FBLD, 1, {MEMORY|BITS80,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26915, 39},
    {I_FBLD, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26915, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FBSTP[] = {
    {I_FBSTP, 1, {MEMORY|BITS80,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26919, 39},
    {I_FBSTP, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26919, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCHS[] = {
    {I_FCHS, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26923, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCLEX[] = {
    {I_FCLEX, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25328, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCMOVB[] = {
    {I_FCMOVB, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25333, 40},
    {I_FCMOVB, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25338, 40},
    {I_FCMOVB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26927, 40},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCMOVBE[] = {
    {I_FCMOVBE, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25343, 40},
    {I_FCMOVBE, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25348, 40},
    {I_FCMOVBE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26931, 40},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCMOVE[] = {
    {I_FCMOVE, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25353, 40},
    {I_FCMOVE, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25358, 40},
    {I_FCMOVE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26935, 40},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCMOVNB[] = {
    {I_FCMOVNB, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25363, 40},
    {I_FCMOVNB, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25368, 40},
    {I_FCMOVNB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26939, 40},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCMOVNBE[] = {
    {I_FCMOVNBE, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25373, 40},
    {I_FCMOVNBE, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25378, 40},
    {I_FCMOVNBE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26943, 40},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCMOVNE[] = {
    {I_FCMOVNE, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25383, 40},
    {I_FCMOVNE, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25388, 40},
    {I_FCMOVNE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26947, 40},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCMOVNU[] = {
    {I_FCMOVNU, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25393, 40},
    {I_FCMOVNU, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25398, 40},
    {I_FCMOVNU, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26951, 40},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCMOVU[] = {
    {I_FCMOVU, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25403, 40},
    {I_FCMOVU, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25408, 40},
    {I_FCMOVU, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26955, 40},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCOM[] = {
    {I_FCOM, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26959, 39},
    {I_FCOM, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26963, 39},
    {I_FCOM, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25413, 39},
    {I_FCOM, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25418, 39},
    {I_FCOM, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26967, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCOMI[] = {
    {I_FCOMI, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25423, 40},
    {I_FCOMI, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25428, 40},
    {I_FCOMI, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26971, 40},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCOMIP[] = {
    {I_FCOMIP, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25433, 40},
    {I_FCOMIP, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25438, 40},
    {I_FCOMIP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26975, 40},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCOMP[] = {
    {I_FCOMP, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26979, 39},
    {I_FCOMP, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26983, 39},
    {I_FCOMP, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25443, 39},
    {I_FCOMP, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25448, 39},
    {I_FCOMP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26987, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCOMPP[] = {
    {I_FCOMPP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26991, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FCOS[] = {
    {I_FCOS, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26995, 41},
    ITEMPLATE_END
};

static const struct itemplate instrux_FDECSTP[] = {
    {I_FDECSTP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26999, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FDISI[] = {
    {I_FDISI, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25453, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FDIV[] = {
    {I_FDIV, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27003, 39},
    {I_FDIV, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27007, 39},
    {I_FDIV, 1, {FPUREG|TO,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25458, 39},
    {I_FDIV, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25463, 39},
    {I_FDIV, 2, {FPUREG,FPU0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25458, 39},
    {I_FDIV, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25468, 39},
    {I_FDIV, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27011, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FDIVP[] = {
    {I_FDIVP, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25473, 39},
    {I_FDIVP, 2, {FPUREG,FPU0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25473, 39},
    {I_FDIVP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27011, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FDIVR[] = {
    {I_FDIVR, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27015, 39},
    {I_FDIVR, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27019, 39},
    {I_FDIVR, 1, {FPUREG|TO,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25478, 39},
    {I_FDIVR, 2, {FPUREG,FPU0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25478, 39},
    {I_FDIVR, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25483, 39},
    {I_FDIVR, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25488, 39},
    {I_FDIVR, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27023, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FDIVRP[] = {
    {I_FDIVRP, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25493, 39},
    {I_FDIVRP, 2, {FPUREG,FPU0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25493, 39},
    {I_FDIVRP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27023, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FEMMS[] = {
    {I_FEMMS, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27027, 42},
    ITEMPLATE_END
};

static const struct itemplate instrux_FENI[] = {
    {I_FENI, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25498, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FFREE[] = {
    {I_FFREE, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25503, 39},
    {I_FFREE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27031, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FFREEP[] = {
    {I_FFREEP, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25508, 43},
    {I_FFREEP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27035, 43},
    ITEMPLATE_END
};

static const struct itemplate instrux_FIADD[] = {
    {I_FIADD, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27039, 39},
    {I_FIADD, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27043, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FICOM[] = {
    {I_FICOM, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27047, 39},
    {I_FICOM, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27051, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FICOMP[] = {
    {I_FICOMP, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27055, 39},
    {I_FICOMP, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27059, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FIDIV[] = {
    {I_FIDIV, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27063, 39},
    {I_FIDIV, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27067, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FIDIVR[] = {
    {I_FIDIVR, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27071, 39},
    {I_FIDIVR, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27075, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FILD[] = {
    {I_FILD, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27079, 39},
    {I_FILD, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27083, 39},
    {I_FILD, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27087, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FIMUL[] = {
    {I_FIMUL, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27091, 39},
    {I_FIMUL, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27095, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FINCSTP[] = {
    {I_FINCSTP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27099, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FINIT[] = {
    {I_FINIT, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25513, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FIST[] = {
    {I_FIST, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27103, 39},
    {I_FIST, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27107, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FISTP[] = {
    {I_FISTP, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27111, 39},
    {I_FISTP, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27115, 39},
    {I_FISTP, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27119, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FISTTP[] = {
    {I_FISTTP, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27123, 44},
    {I_FISTTP, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27127, 44},
    {I_FISTTP, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27131, 44},
    ITEMPLATE_END
};

static const struct itemplate instrux_FISUB[] = {
    {I_FISUB, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27135, 39},
    {I_FISUB, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27139, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FISUBR[] = {
    {I_FISUBR, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27143, 39},
    {I_FISUBR, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27147, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FLD[] = {
    {I_FLD, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27151, 39},
    {I_FLD, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27155, 39},
    {I_FLD, 1, {MEMORY|BITS80,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27159, 39},
    {I_FLD, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25518, 39},
    {I_FLD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27163, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FLD1[] = {
    {I_FLD1, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27167, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FLDCW[] = {
    {I_FLDCW, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27171, 45},
    ITEMPLATE_END
};

static const struct itemplate instrux_FLDENV[] = {
    {I_FLDENV, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27175, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FLDL2E[] = {
    {I_FLDL2E, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27179, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FLDL2T[] = {
    {I_FLDL2T, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27183, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FLDLG2[] = {
    {I_FLDLG2, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27187, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FLDLN2[] = {
    {I_FLDLN2, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27191, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FLDPI[] = {
    {I_FLDPI, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27195, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FLDZ[] = {
    {I_FLDZ, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27199, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FMUL[] = {
    {I_FMUL, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27203, 39},
    {I_FMUL, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27207, 39},
    {I_FMUL, 1, {FPUREG|TO,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25523, 39},
    {I_FMUL, 2, {FPUREG,FPU0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25523, 39},
    {I_FMUL, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25528, 39},
    {I_FMUL, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25533, 39},
    {I_FMUL, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27211, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FMULP[] = {
    {I_FMULP, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25538, 39},
    {I_FMULP, 2, {FPUREG,FPU0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25538, 39},
    {I_FMULP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27211, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FNCLEX[] = {
    {I_FNCLEX, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25329, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FNDISI[] = {
    {I_FNDISI, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25454, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FNENI[] = {
    {I_FNENI, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25499, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FNINIT[] = {
    {I_FNINIT, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25514, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FNOP[] = {
    {I_FNOP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27215, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FNSAVE[] = {
    {I_FNSAVE, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25544, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FNSTCW[] = {
    {I_FNSTCW, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25554, 45},
    ITEMPLATE_END
};

static const struct itemplate instrux_FNSTENV[] = {
    {I_FNSTENV, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25559, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FNSTSW[] = {
    {I_FNSTSW, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25569, 45},
    {I_FNSTSW, 1, {REG_AX,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25574, 46},
    ITEMPLATE_END
};

static const struct itemplate instrux_FPATAN[] = {
    {I_FPATAN, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27219, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FPREM[] = {
    {I_FPREM, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27223, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FPREM1[] = {
    {I_FPREM1, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27227, 41},
    ITEMPLATE_END
};

static const struct itemplate instrux_FPTAN[] = {
    {I_FPTAN, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27231, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FRNDINT[] = {
    {I_FRNDINT, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27235, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FRSTOR[] = {
    {I_FRSTOR, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27239, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSAVE[] = {
    {I_FSAVE, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25543, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSCALE[] = {
    {I_FSCALE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27243, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSETPM[] = {
    {I_FSETPM, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27247, 46},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSIN[] = {
    {I_FSIN, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27251, 41},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSINCOS[] = {
    {I_FSINCOS, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27255, 41},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSQRT[] = {
    {I_FSQRT, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27259, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FST[] = {
    {I_FST, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27263, 39},
    {I_FST, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27267, 39},
    {I_FST, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25548, 39},
    {I_FST, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27271, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSTCW[] = {
    {I_FSTCW, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25553, 45},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSTENV[] = {
    {I_FSTENV, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25558, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSTP[] = {
    {I_FSTP, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27275, 39},
    {I_FSTP, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27279, 39},
    {I_FSTP, 1, {MEMORY|BITS80,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27283, 39},
    {I_FSTP, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25563, 39},
    {I_FSTP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27287, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSTSW[] = {
    {I_FSTSW, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25568, 45},
    {I_FSTSW, 1, {REG_AX,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25573, 46},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSUB[] = {
    {I_FSUB, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27291, 39},
    {I_FSUB, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27295, 39},
    {I_FSUB, 1, {FPUREG|TO,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25578, 39},
    {I_FSUB, 2, {FPUREG,FPU0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25578, 39},
    {I_FSUB, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25583, 39},
    {I_FSUB, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25588, 39},
    {I_FSUB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27299, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSUBP[] = {
    {I_FSUBP, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25593, 39},
    {I_FSUBP, 2, {FPUREG,FPU0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25593, 39},
    {I_FSUBP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27299, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSUBR[] = {
    {I_FSUBR, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27303, 39},
    {I_FSUBR, 1, {MEMORY|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27307, 39},
    {I_FSUBR, 1, {FPUREG|TO,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25598, 39},
    {I_FSUBR, 2, {FPUREG,FPU0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25598, 39},
    {I_FSUBR, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25603, 39},
    {I_FSUBR, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25608, 39},
    {I_FSUBR, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27311, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FSUBRP[] = {
    {I_FSUBRP, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25613, 39},
    {I_FSUBRP, 2, {FPUREG,FPU0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25613, 39},
    {I_FSUBRP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27311, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FTST[] = {
    {I_FTST, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27315, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FUCOM[] = {
    {I_FUCOM, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25618, 41},
    {I_FUCOM, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25623, 41},
    {I_FUCOM, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27319, 41},
    ITEMPLATE_END
};

static const struct itemplate instrux_FUCOMI[] = {
    {I_FUCOMI, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25628, 40},
    {I_FUCOMI, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25633, 40},
    {I_FUCOMI, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27323, 40},
    ITEMPLATE_END
};

static const struct itemplate instrux_FUCOMIP[] = {
    {I_FUCOMIP, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25638, 40},
    {I_FUCOMIP, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25643, 40},
    {I_FUCOMIP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27327, 40},
    ITEMPLATE_END
};

static const struct itemplate instrux_FUCOMP[] = {
    {I_FUCOMP, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25648, 41},
    {I_FUCOMP, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25653, 41},
    {I_FUCOMP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27331, 41},
    ITEMPLATE_END
};

static const struct itemplate instrux_FUCOMPP[] = {
    {I_FUCOMPP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27335, 41},
    ITEMPLATE_END
};

static const struct itemplate instrux_FWAIT[] = {
    {I_FWAIT, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27321, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_FXAM[] = {
    {I_FXAM, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27339, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FXCH[] = {
    {I_FXCH, 1, {FPUREG,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25658, 39},
    {I_FXCH, 2, {FPUREG,FPU0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25658, 39},
    {I_FXCH, 2, {FPU0,FPUREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25663, 39},
    {I_FXCH, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27343, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FXRSTOR[] = {
    {I_FXRSTOR, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13722, 119},
    ITEMPLATE_END
};

static const struct itemplate instrux_FXRSTOR64[] = {
    {I_FXRSTOR64, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13721, 120},
    ITEMPLATE_END
};

static const struct itemplate instrux_FXSAVE[] = {
    {I_FXSAVE, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13729, 119},
    ITEMPLATE_END
};

static const struct itemplate instrux_FXSAVE64[] = {
    {I_FXSAVE64, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13728, 120},
    ITEMPLATE_END
};

static const struct itemplate instrux_FXTRACT[] = {
    {I_FXTRACT, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27347, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FYL2X[] = {
    {I_FYL2X, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27351, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_FYL2XP1[] = {
    {I_FYL2XP1, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27355, 39},
    ITEMPLATE_END
};

static const struct itemplate instrux_GETSEC[] = {
    {I_GETSEC, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27771, 126},
    ITEMPLATE_END
};

static const struct itemplate instrux_HADDPD[] = {
    {I_HADDPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23611, 146},
    ITEMPLATE_END
};

static const struct itemplate instrux_HADDPS[] = {
    {I_HADDPS, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23617, 146},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP0[] = {
    {I_HINT_NOP0, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23899, 213},
    {I_HINT_NOP0, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23905, 213},
    {I_HINT_NOP0, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23911, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP1[] = {
    {I_HINT_NOP1, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23917, 213},
    {I_HINT_NOP1, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23923, 213},
    {I_HINT_NOP1, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23929, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP10[] = {
    {I_HINT_NOP10, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24079, 213},
    {I_HINT_NOP10, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24085, 213},
    {I_HINT_NOP10, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24091, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP11[] = {
    {I_HINT_NOP11, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24097, 213},
    {I_HINT_NOP11, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24103, 213},
    {I_HINT_NOP11, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24109, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP12[] = {
    {I_HINT_NOP12, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24115, 213},
    {I_HINT_NOP12, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24121, 213},
    {I_HINT_NOP12, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24127, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP13[] = {
    {I_HINT_NOP13, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24133, 213},
    {I_HINT_NOP13, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24139, 213},
    {I_HINT_NOP13, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24145, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP14[] = {
    {I_HINT_NOP14, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24151, 213},
    {I_HINT_NOP14, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24157, 213},
    {I_HINT_NOP14, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24163, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP15[] = {
    {I_HINT_NOP15, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24169, 213},
    {I_HINT_NOP15, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24175, 213},
    {I_HINT_NOP15, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24181, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP16[] = {
    {I_HINT_NOP16, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24187, 213},
    {I_HINT_NOP16, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24193, 213},
    {I_HINT_NOP16, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24199, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP17[] = {
    {I_HINT_NOP17, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24205, 213},
    {I_HINT_NOP17, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24211, 213},
    {I_HINT_NOP17, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24217, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP18[] = {
    {I_HINT_NOP18, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24223, 213},
    {I_HINT_NOP18, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24229, 213},
    {I_HINT_NOP18, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24235, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP19[] = {
    {I_HINT_NOP19, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24241, 213},
    {I_HINT_NOP19, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24247, 213},
    {I_HINT_NOP19, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24253, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP2[] = {
    {I_HINT_NOP2, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23935, 213},
    {I_HINT_NOP2, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23941, 213},
    {I_HINT_NOP2, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23947, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP20[] = {
    {I_HINT_NOP20, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24259, 213},
    {I_HINT_NOP20, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24265, 213},
    {I_HINT_NOP20, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24271, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP21[] = {
    {I_HINT_NOP21, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24277, 213},
    {I_HINT_NOP21, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24283, 213},
    {I_HINT_NOP21, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24289, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP22[] = {
    {I_HINT_NOP22, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24295, 213},
    {I_HINT_NOP22, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24301, 213},
    {I_HINT_NOP22, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24307, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP23[] = {
    {I_HINT_NOP23, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24313, 213},
    {I_HINT_NOP23, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24319, 213},
    {I_HINT_NOP23, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24325, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP24[] = {
    {I_HINT_NOP24, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24331, 213},
    {I_HINT_NOP24, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24337, 213},
    {I_HINT_NOP24, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24343, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP25[] = {
    {I_HINT_NOP25, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24349, 213},
    {I_HINT_NOP25, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24355, 213},
    {I_HINT_NOP25, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24361, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP26[] = {
    {I_HINT_NOP26, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24367, 213},
    {I_HINT_NOP26, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24373, 213},
    {I_HINT_NOP26, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24379, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP27[] = {
    {I_HINT_NOP27, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24385, 213},
    {I_HINT_NOP27, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24391, 213},
    {I_HINT_NOP27, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24397, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP28[] = {
    {I_HINT_NOP28, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24403, 213},
    {I_HINT_NOP28, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24409, 213},
    {I_HINT_NOP28, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24415, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP29[] = {
    {I_HINT_NOP29, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24421, 213},
    {I_HINT_NOP29, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24427, 213},
    {I_HINT_NOP29, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24433, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP3[] = {
    {I_HINT_NOP3, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23953, 213},
    {I_HINT_NOP3, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23959, 213},
    {I_HINT_NOP3, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23965, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP30[] = {
    {I_HINT_NOP30, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24439, 213},
    {I_HINT_NOP30, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24445, 213},
    {I_HINT_NOP30, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24451, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP31[] = {
    {I_HINT_NOP31, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24457, 213},
    {I_HINT_NOP31, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24463, 213},
    {I_HINT_NOP31, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24469, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP32[] = {
    {I_HINT_NOP32, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24475, 213},
    {I_HINT_NOP32, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24481, 213},
    {I_HINT_NOP32, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24487, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP33[] = {
    {I_HINT_NOP33, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24493, 213},
    {I_HINT_NOP33, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24499, 213},
    {I_HINT_NOP33, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24505, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP34[] = {
    {I_HINT_NOP34, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24511, 213},
    {I_HINT_NOP34, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24517, 213},
    {I_HINT_NOP34, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24523, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP35[] = {
    {I_HINT_NOP35, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24529, 213},
    {I_HINT_NOP35, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24535, 213},
    {I_HINT_NOP35, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24541, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP36[] = {
    {I_HINT_NOP36, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24547, 213},
    {I_HINT_NOP36, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24553, 213},
    {I_HINT_NOP36, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24559, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP37[] = {
    {I_HINT_NOP37, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24565, 213},
    {I_HINT_NOP37, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24571, 213},
    {I_HINT_NOP37, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24577, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP38[] = {
    {I_HINT_NOP38, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24583, 213},
    {I_HINT_NOP38, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24589, 213},
    {I_HINT_NOP38, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24595, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP39[] = {
    {I_HINT_NOP39, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24601, 213},
    {I_HINT_NOP39, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24607, 213},
    {I_HINT_NOP39, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24613, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP4[] = {
    {I_HINT_NOP4, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23971, 213},
    {I_HINT_NOP4, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23977, 213},
    {I_HINT_NOP4, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23983, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP40[] = {
    {I_HINT_NOP40, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24619, 213},
    {I_HINT_NOP40, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24625, 213},
    {I_HINT_NOP40, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24631, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP41[] = {
    {I_HINT_NOP41, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24637, 213},
    {I_HINT_NOP41, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24643, 213},
    {I_HINT_NOP41, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24649, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP42[] = {
    {I_HINT_NOP42, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24655, 213},
    {I_HINT_NOP42, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24661, 213},
    {I_HINT_NOP42, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24667, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP43[] = {
    {I_HINT_NOP43, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24673, 213},
    {I_HINT_NOP43, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24679, 213},
    {I_HINT_NOP43, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24685, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP44[] = {
    {I_HINT_NOP44, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24691, 213},
    {I_HINT_NOP44, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24697, 213},
    {I_HINT_NOP44, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24703, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP45[] = {
    {I_HINT_NOP45, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24709, 213},
    {I_HINT_NOP45, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24715, 213},
    {I_HINT_NOP45, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24721, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP46[] = {
    {I_HINT_NOP46, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24727, 213},
    {I_HINT_NOP46, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24733, 213},
    {I_HINT_NOP46, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24739, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP47[] = {
    {I_HINT_NOP47, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24745, 213},
    {I_HINT_NOP47, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24751, 213},
    {I_HINT_NOP47, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24757, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP48[] = {
    {I_HINT_NOP48, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24763, 213},
    {I_HINT_NOP48, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24769, 213},
    {I_HINT_NOP48, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24775, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP49[] = {
    {I_HINT_NOP49, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24781, 213},
    {I_HINT_NOP49, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24787, 213},
    {I_HINT_NOP49, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24793, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP5[] = {
    {I_HINT_NOP5, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23989, 213},
    {I_HINT_NOP5, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23995, 213},
    {I_HINT_NOP5, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24001, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP50[] = {
    {I_HINT_NOP50, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24799, 213},
    {I_HINT_NOP50, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24805, 213},
    {I_HINT_NOP50, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24811, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP51[] = {
    {I_HINT_NOP51, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24817, 213},
    {I_HINT_NOP51, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24823, 213},
    {I_HINT_NOP51, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24829, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP52[] = {
    {I_HINT_NOP52, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24835, 213},
    {I_HINT_NOP52, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24841, 213},
    {I_HINT_NOP52, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24847, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP53[] = {
    {I_HINT_NOP53, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24853, 213},
    {I_HINT_NOP53, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24859, 213},
    {I_HINT_NOP53, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24865, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP54[] = {
    {I_HINT_NOP54, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24871, 213},
    {I_HINT_NOP54, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24877, 213},
    {I_HINT_NOP54, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24883, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP55[] = {
    {I_HINT_NOP55, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24889, 213},
    {I_HINT_NOP55, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24895, 213},
    {I_HINT_NOP55, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24901, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP56[] = {
    {I_HINT_NOP56, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22111, 213},
    {I_HINT_NOP56, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22117, 213},
    {I_HINT_NOP56, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22123, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP57[] = {
    {I_HINT_NOP57, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24907, 213},
    {I_HINT_NOP57, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24913, 213},
    {I_HINT_NOP57, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24919, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP58[] = {
    {I_HINT_NOP58, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24925, 213},
    {I_HINT_NOP58, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24931, 213},
    {I_HINT_NOP58, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24937, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP59[] = {
    {I_HINT_NOP59, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24943, 213},
    {I_HINT_NOP59, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24949, 213},
    {I_HINT_NOP59, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24955, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP6[] = {
    {I_HINT_NOP6, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24007, 213},
    {I_HINT_NOP6, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24013, 213},
    {I_HINT_NOP6, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24019, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP60[] = {
    {I_HINT_NOP60, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24961, 213},
    {I_HINT_NOP60, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24967, 213},
    {I_HINT_NOP60, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24973, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP61[] = {
    {I_HINT_NOP61, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24979, 213},
    {I_HINT_NOP61, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24985, 213},
    {I_HINT_NOP61, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24991, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP62[] = {
    {I_HINT_NOP62, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24997, 213},
    {I_HINT_NOP62, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25003, 213},
    {I_HINT_NOP62, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25009, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP63[] = {
    {I_HINT_NOP63, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25015, 213},
    {I_HINT_NOP63, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25021, 213},
    {I_HINT_NOP63, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25027, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP7[] = {
    {I_HINT_NOP7, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24025, 213},
    {I_HINT_NOP7, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24031, 213},
    {I_HINT_NOP7, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24037, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP8[] = {
    {I_HINT_NOP8, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24043, 213},
    {I_HINT_NOP8, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24049, 213},
    {I_HINT_NOP8, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24055, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HINT_NOP9[] = {
    {I_HINT_NOP9, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24061, 213},
    {I_HINT_NOP9, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24067, 213},
    {I_HINT_NOP9, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+24073, 214},
    ITEMPLATE_END
};

static const struct itemplate instrux_HLT[] = {
    {I_HLT, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27796, 47},
    ITEMPLATE_END
};

static const struct itemplate instrux_HSUBPD[] = {
    {I_HSUBPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23623, 146},
    ITEMPLATE_END
};

static const struct itemplate instrux_HSUBPS[] = {
    {I_HSUBPS, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23629, 146},
    ITEMPLATE_END
};

static const struct itemplate instrux_IBTS[] = {
    {I_IBTS, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21619, 48},
    {I_IBTS, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21619, 49},
    {I_IBTS, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21625, 50},
    {I_IBTS, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21625, 49},
    ITEMPLATE_END
};

static const struct itemplate instrux_ICEBP[] = {
    {I_ICEBP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27799, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_IDIV[] = {
    {I_IDIV, 1, {RM_GPR|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27359, 0},
    {I_IDIV, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25668, 0},
    {I_IDIV, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25673, 5},
    {I_IDIV, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25678, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_IMUL[] = {
    {I_IMUL, 1, {RM_GPR|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27363, 0},
    {I_IMUL, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25683, 0},
    {I_IMUL, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25688, 5},
    {I_IMUL, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25693, 7},
    {I_IMUL, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21655, 9},
    {I_IMUL, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21655, 5},
    {I_IMUL, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21661, 9},
    {I_IMUL, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21661, 5},
    {I_IMUL, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21667, 10},
    {I_IMUL, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21667, 7},
    {I_IMUL, 3, {REG_GPR|BITS16,MEMORY,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+21673, 51},
    {I_IMUL, 3, {REG_GPR|BITS16,MEMORY,SBYTEWORD,0,0}, NO_DECORATOR, nasm_bytecodes+21673, 51},
    {I_IMUL, 3, {REG_GPR|BITS16,MEMORY,IMMEDIATE|BITS16,0,0}, NO_DECORATOR, nasm_bytecodes+21679, 51},
    {I_IMUL, 3, {REG_GPR|BITS16,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+21679, 51},
    {I_IMUL, 3, {REG_GPR|BITS16,REG_GPR|BITS16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+21673, 38},
    {I_IMUL, 3, {REG_GPR|BITS16,REG_GPR|BITS16,SBYTEWORD,0,0}, NO_DECORATOR, nasm_bytecodes+21673, 51},
    {I_IMUL, 3, {REG_GPR|BITS16,REG_GPR|BITS16,IMMEDIATE|BITS16,0,0}, NO_DECORATOR, nasm_bytecodes+21679, 38},
    {I_IMUL, 3, {REG_GPR|BITS16,REG_GPR|BITS16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+21679, 51},
    {I_IMUL, 3, {REG_GPR|BITS32,MEMORY,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+21685, 9},
    {I_IMUL, 3, {REG_GPR|BITS32,MEMORY,SBYTEDWORD,0,0}, NO_DECORATOR, nasm_bytecodes+21685, 9},
    {I_IMUL, 3, {REG_GPR|BITS32,MEMORY,IMMEDIATE|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+21691, 9},
    {I_IMUL, 3, {REG_GPR|BITS32,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+21691, 9},
    {I_IMUL, 3, {REG_GPR|BITS32,REG_GPR|BITS32,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+21685, 5},
    {I_IMUL, 3, {REG_GPR|BITS32,REG_GPR|BITS32,SBYTEDWORD,0,0}, NO_DECORATOR, nasm_bytecodes+21685, 9},
    {I_IMUL, 3, {REG_GPR|BITS32,REG_GPR|BITS32,IMMEDIATE|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+21691, 5},
    {I_IMUL, 3, {REG_GPR|BITS32,REG_GPR|BITS32,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+21691, 9},
    {I_IMUL, 3, {REG_GPR|BITS64,MEMORY,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+21697, 10},
    {I_IMUL, 3, {REG_GPR|BITS64,MEMORY,SBYTEDWORD,0,0}, NO_DECORATOR, nasm_bytecodes+21697, 10},
    {I_IMUL, 3, {REG_GPR|BITS64,MEMORY,IMMEDIATE|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+21703, 10},
    {I_IMUL, 3, {REG_GPR|BITS64,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+21709, 10},
    {I_IMUL, 3, {REG_GPR|BITS64,REG_GPR|BITS64,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+21697, 7},
    {I_IMUL, 3, {REG_GPR|BITS64,REG_GPR|BITS64,SBYTEDWORD,0,0}, NO_DECORATOR, nasm_bytecodes+21697, 10},
    {I_IMUL, 3, {REG_GPR|BITS64,REG_GPR|BITS64,IMMEDIATE|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+21703, 7},
    {I_IMUL, 3, {REG_GPR|BITS64,REG_GPR|BITS64,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+21709, 10},
    {I_IMUL, 2, {REG_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+21715, 38},
    {I_IMUL, 2, {REG_GPR|BITS16,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+21715, 51},
    {I_IMUL, 2, {REG_GPR|BITS16,IMMEDIATE|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21721, 38},
    {I_IMUL, 2, {REG_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21721, 51},
    {I_IMUL, 2, {REG_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+21727, 5},
    {I_IMUL, 2, {REG_GPR|BITS32,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+21727, 9},
    {I_IMUL, 2, {REG_GPR|BITS32,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21733, 5},
    {I_IMUL, 2, {REG_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21733, 9},
    {I_IMUL, 2, {REG_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+21739, 7},
    {I_IMUL, 2, {REG_GPR|BITS64,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+21739, 10},
    {I_IMUL, 2, {REG_GPR|BITS64,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21745, 7},
    {I_IMUL, 2, {REG_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21745, 10},
    ITEMPLATE_END
};

static const struct itemplate instrux_IN[] = {
    {I_IN, 2, {REG_AL,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+27367, 52},
    {I_IN, 2, {REG_AX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25698, 52},
    {I_IN, 2, {REG_EAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+25703, 21},
    {I_IN, 2, {REG_AL,REG_DX,0,0,0}, NO_DECORATOR, nasm_bytecodes+27802, 0},
    {I_IN, 2, {REG_AX,REG_DX,0,0,0}, NO_DECORATOR, nasm_bytecodes+27371, 0},
    {I_IN, 2, {REG_EAX,REG_DX,0,0,0}, NO_DECORATOR, nasm_bytecodes+27375, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_INC[] = {
    {I_INC, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27379, 1},
    {I_INC, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27383, 19},
    {I_INC, 1, {RM_GPR|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25708, 11},
    {I_INC, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21751, 11},
    {I_INC, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21757, 12},
    {I_INC, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21763, 13},
    ITEMPLATE_END
};

static const struct itemplate instrux_INCBIN[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_INSB[] = {
    {I_INSB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27805, 38},
    ITEMPLATE_END
};

static const struct itemplate instrux_INSD[] = {
    {I_INSD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27387, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_INSERTPS[] = {
    {I_INSERTPS, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6572, 161},
    ITEMPLATE_END
};

static const struct itemplate instrux_INSERTQ[] = {
    {I_INSERTQ, 4, {XMM_L16,XMM_L16,IMMEDIATE,IMMEDIATE,0}, NO_DECORATOR, nasm_bytecodes+6532, 156},
    {I_INSERTQ, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23689, 156},
    ITEMPLATE_END
};

static const struct itemplate instrux_INSW[] = {
    {I_INSW, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27391, 38},
    ITEMPLATE_END
};

static const struct itemplate instrux_INT[] = {
    {I_INT, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27395, 52},
    ITEMPLATE_END
};

static const struct itemplate instrux_INT01[] = {
    {I_INT01, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27799, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_INT03[] = {
    {I_INT03, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27808, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_INT1[] = {
    {I_INT1, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27799, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_INT3[] = {
    {I_INT3, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27808, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_INTO[] = {
    {I_INTO, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27811, 1},
    ITEMPLATE_END
};

static const struct itemplate instrux_INVD[] = {
    {I_INVD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27399, 53},
    ITEMPLATE_END
};

static const struct itemplate instrux_INVEPT[] = {
    {I_INVEPT, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+6493, 152},
    {I_INVEPT, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+6492, 153},
    ITEMPLATE_END
};

static const struct itemplate instrux_INVLPG[] = {
    {I_INVLPG, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25713, 53},
    ITEMPLATE_END
};

static const struct itemplate instrux_INVLPGA[] = {
    {I_INVLPGA, 2, {REG_AX,REG_ECX,0,0,0}, NO_DECORATOR, nasm_bytecodes+21769, 56},
    {I_INVLPGA, 2, {REG_EAX,REG_ECX,0,0,0}, NO_DECORATOR, nasm_bytecodes+21775, 57},
    {I_INVLPGA, 2, {REG_RAX,REG_ECX,0,0,0}, NO_DECORATOR, nasm_bytecodes+12923, 58},
    {I_INVLPGA, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21776, 57},
    ITEMPLATE_END
};

static const struct itemplate instrux_INVPCID[] = {
    {I_INVPCID, 2, {REG_GPR|BITS32,MEMORY|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+12916, 54},
    {I_INVPCID, 2, {REG_GPR|BITS64,MEMORY|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+12916, 55},
    ITEMPLATE_END
};

static const struct itemplate instrux_INVVPID[] = {
    {I_INVVPID, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+6501, 152},
    {I_INVVPID, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+6500, 153},
    ITEMPLATE_END
};

static const struct itemplate instrux_IRET[] = {
    {I_IRET, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27403, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_IRETD[] = {
    {I_IRETD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27407, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_IRETQ[] = {
    {I_IRETQ, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27411, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_IRETW[] = {
    {I_IRETW, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27415, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_JCXZ[] = {
    {I_JCXZ, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25718, 1},
    ITEMPLATE_END
};

static const struct itemplate instrux_JECXZ[] = {
    {I_JECXZ, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25723, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_JMP[] = {
    {I_JMP, 1, {IMMEDIATE|SHORT,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25734, 0},
    {I_JMP, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25733, 0},
    {I_JMP, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25738, 25},
    {I_JMP, 1, {IMMEDIATE|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25738, 25},
    {I_JMP, 1, {IMMEDIATE|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21781, 1},
    {I_JMP, 1, {IMMEDIATE|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25743, 26},
    {I_JMP, 1, {IMMEDIATE|BITS16|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25743, 26},
    {I_JMP, 1, {IMMEDIATE|BITS16|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21787, 1},
    {I_JMP, 1, {IMMEDIATE|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25748, 27},
    {I_JMP, 1, {IMMEDIATE|BITS32|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25748, 27},
    {I_JMP, 1, {IMMEDIATE|BITS32|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21793, 19},
    {I_JMP, 1, {IMMEDIATE|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25753, 28},
    {I_JMP, 1, {IMMEDIATE|BITS64|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25753, 28},
    {I_JMP, 2, {IMMEDIATE|COLON,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21799, 1},
    {I_JMP, 2, {IMMEDIATE|BITS16|COLON,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21805, 1},
    {I_JMP, 2, {IMMEDIATE|COLON,IMMEDIATE|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21805, 1},
    {I_JMP, 2, {IMMEDIATE|BITS32|COLON,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+21811, 19},
    {I_JMP, 2, {IMMEDIATE|COLON,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21811, 19},
    {I_JMP, 1, {MEMORY|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25758, 1},
    {I_JMP, 1, {MEMORY|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25763, 7},
    {I_JMP, 1, {MEMORY|BITS16|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25768, 0},
    {I_JMP, 1, {MEMORY|BITS32|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25773, 5},
    {I_JMP, 1, {MEMORY|BITS64|FAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25763, 7},
    {I_JMP, 1, {MEMORY|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25778, 25},
    {I_JMP, 1, {RM_GPR|BITS16|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25783, 26},
    {I_JMP, 1, {RM_GPR|BITS32|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25788, 27},
    {I_JMP, 1, {RM_GPR|BITS64|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25793, 28},
    {I_JMP, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25778, 25},
    {I_JMP, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25783, 26},
    {I_JMP, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25788, 27},
    {I_JMP, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25793, 28},
    ITEMPLATE_END
};

static const struct itemplate instrux_JMPE[] = {
    {I_JMPE, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21817, 59},
    {I_JMPE, 1, {IMMEDIATE|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21823, 59},
    {I_JMPE, 1, {IMMEDIATE|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21829, 59},
    {I_JMPE, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21835, 59},
    {I_JMPE, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21841, 59},
    ITEMPLATE_END
};

static const struct itemplate instrux_JRCXZ[] = {
    {I_JRCXZ, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25728, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_KANDNW[] = {
    {I_KANDNW, 3, {KREG,KREG,KREG,0,0}, NO_DECORATOR, nasm_bytecodes+21309, 201},
    ITEMPLATE_END
};

static const struct itemplate instrux_KANDW[] = {
    {I_KANDW, 3, {KREG,KREG,KREG,0,0}, NO_DECORATOR, nasm_bytecodes+21316, 201},
    ITEMPLATE_END
};

static const struct itemplate instrux_KMOVW[] = {
    {I_KMOVW, 2, {KREG,RM_K|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21323, 201},
    {I_KMOVW, 2, {KREG,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21330, 201},
    {I_KMOVW, 2, {MEMORY|BITS16,KREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+21337, 201},
    {I_KMOVW, 2, {REG_GPR|BITS32,KREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+21344, 201},
    ITEMPLATE_END
};

static const struct itemplate instrux_KNOTW[] = {
    {I_KNOTW, 2, {KREG,KREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+21351, 201},
    ITEMPLATE_END
};

static const struct itemplate instrux_KORTESTW[] = {
    {I_KORTESTW, 2, {KREG,KREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+21358, 201},
    ITEMPLATE_END
};

static const struct itemplate instrux_KORW[] = {
    {I_KORW, 3, {KREG,KREG,KREG,0,0}, NO_DECORATOR, nasm_bytecodes+21365, 201},
    ITEMPLATE_END
};

static const struct itemplate instrux_KSHIFTLW[] = {
    {I_KSHIFTLW, 3, {KREG,KREG,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+12492, 201},
    ITEMPLATE_END
};

static const struct itemplate instrux_KSHIFTRW[] = {
    {I_KSHIFTRW, 3, {KREG,KREG,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+12500, 201},
    ITEMPLATE_END
};

static const struct itemplate instrux_KUNPCKBW[] = {
    {I_KUNPCKBW, 3, {KREG,KREG,KREG,0,0}, NO_DECORATOR, nasm_bytecodes+21372, 201},
    ITEMPLATE_END
};

static const struct itemplate instrux_KXNORW[] = {
    {I_KXNORW, 3, {KREG,KREG,KREG,0,0}, NO_DECORATOR, nasm_bytecodes+21379, 201},
    ITEMPLATE_END
};

static const struct itemplate instrux_KXORW[] = {
    {I_KXORW, 3, {KREG,KREG,KREG,0,0}, NO_DECORATOR, nasm_bytecodes+21386, 201},
    ITEMPLATE_END
};

static const struct itemplate instrux_LAHF[] = {
    {I_LAHF, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27814, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_LAR[] = {
    {I_LAR, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21847, 60},
    {I_LAR, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21847, 61},
    {I_LAR, 2, {REG_GPR|BITS16,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21847, 62},
    {I_LAR, 2, {REG_GPR|BITS16,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12930, 63},
    {I_LAR, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21853, 64},
    {I_LAR, 2, {REG_GPR|BITS32,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21853, 62},
    {I_LAR, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21853, 62},
    {I_LAR, 2, {REG_GPR|BITS32,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12937, 63},
    {I_LAR, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21859, 65},
    {I_LAR, 2, {REG_GPR|BITS64,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21859, 63},
    {I_LAR, 2, {REG_GPR|BITS64,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21859, 63},
    {I_LAR, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21859, 63},
    ITEMPLATE_END
};

static const struct itemplate instrux_LDDQU[] = {
    {I_LDDQU, 2, {XMM_L16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+23635, 146},
    ITEMPLATE_END
};

static const struct itemplate instrux_LDMXCSR[] = {
    {I_LDMXCSR, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22687, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_LDS[] = {
    {I_LDS, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25798, 1},
    {I_LDS, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25803, 19},
    ITEMPLATE_END
};

static const struct itemplate instrux_LEA[] = {
    {I_LEA, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25808, 0},
    {I_LEA, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25813, 5},
    {I_LEA, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25818, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_LEAVE[] = {
    {I_LEAVE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26065, 38},
    ITEMPLATE_END
};

static const struct itemplate instrux_LES[] = {
    {I_LES, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25823, 1},
    {I_LES, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25828, 19},
    ITEMPLATE_END
};

static const struct itemplate instrux_LFENCE[] = {
    {I_LFENCE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21865, 58},
    {I_LFENCE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21865, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_LFS[] = {
    {I_LFS, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21871, 5},
    {I_LFS, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21877, 5},
    {I_LFS, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21883, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_LGDT[] = {
    {I_LGDT, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25833, 29},
    ITEMPLATE_END
};

static const struct itemplate instrux_LGS[] = {
    {I_LGS, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21889, 5},
    {I_LGS, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21895, 5},
    {I_LGS, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21901, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_LIDT[] = {
    {I_LIDT, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25838, 29},
    ITEMPLATE_END
};

static const struct itemplate instrux_LLDT[] = {
    {I_LLDT, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25843, 66},
    {I_LLDT, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25843, 66},
    {I_LLDT, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25843, 66},
    ITEMPLATE_END
};

static const struct itemplate instrux_LLWPCB[] = {
    {I_LLWPCB, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18726, 184},
    {I_LLWPCB, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18733, 185},
    ITEMPLATE_END
};

static const struct itemplate instrux_LMSW[] = {
    {I_LMSW, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25848, 29},
    {I_LMSW, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25848, 29},
    {I_LMSW, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25848, 29},
    ITEMPLATE_END
};

static const struct itemplate instrux_LOADALL[] = {
    {I_LOADALL, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27419, 49},
    ITEMPLATE_END
};

static const struct itemplate instrux_LOADALL286[] = {
    {I_LOADALL286, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27423, 67},
    ITEMPLATE_END
};

static const struct itemplate instrux_LODSB[] = {
    {I_LODSB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27817, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_LODSD[] = {
    {I_LODSD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27427, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_LODSQ[] = {
    {I_LODSQ, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27431, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_LODSW[] = {
    {I_LODSW, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27435, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_LOOP[] = {
    {I_LOOP, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25853, 0},
    {I_LOOP, 2, {IMMEDIATE,REG_CX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25858, 1},
    {I_LOOP, 2, {IMMEDIATE,REG_ECX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25863, 5},
    {I_LOOP, 2, {IMMEDIATE,REG_RCX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25868, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_LOOPE[] = {
    {I_LOOPE, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25873, 0},
    {I_LOOPE, 2, {IMMEDIATE,REG_CX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25878, 1},
    {I_LOOPE, 2, {IMMEDIATE,REG_ECX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25883, 5},
    {I_LOOPE, 2, {IMMEDIATE,REG_RCX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25888, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_LOOPNE[] = {
    {I_LOOPNE, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25893, 0},
    {I_LOOPNE, 2, {IMMEDIATE,REG_CX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25898, 1},
    {I_LOOPNE, 2, {IMMEDIATE,REG_ECX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25903, 5},
    {I_LOOPNE, 2, {IMMEDIATE,REG_RCX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25908, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_LOOPNZ[] = {
    {I_LOOPNZ, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25893, 0},
    {I_LOOPNZ, 2, {IMMEDIATE,REG_CX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25898, 1},
    {I_LOOPNZ, 2, {IMMEDIATE,REG_ECX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25903, 5},
    {I_LOOPNZ, 2, {IMMEDIATE,REG_RCX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25908, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_LOOPZ[] = {
    {I_LOOPZ, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25873, 0},
    {I_LOOPZ, 2, {IMMEDIATE,REG_CX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25878, 1},
    {I_LOOPZ, 2, {IMMEDIATE,REG_ECX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25883, 5},
    {I_LOOPZ, 2, {IMMEDIATE,REG_RCX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25888, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_LSL[] = {
    {I_LSL, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21907, 60},
    {I_LSL, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21907, 61},
    {I_LSL, 2, {REG_GPR|BITS16,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21907, 62},
    {I_LSL, 2, {REG_GPR|BITS16,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12944, 63},
    {I_LSL, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21913, 64},
    {I_LSL, 2, {REG_GPR|BITS32,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21913, 62},
    {I_LSL, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21913, 62},
    {I_LSL, 2, {REG_GPR|BITS32,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12951, 63},
    {I_LSL, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21919, 65},
    {I_LSL, 2, {REG_GPR|BITS64,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21919, 63},
    {I_LSL, 2, {REG_GPR|BITS64,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21919, 63},
    {I_LSL, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21919, 63},
    ITEMPLATE_END
};

static const struct itemplate instrux_LSS[] = {
    {I_LSS, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21925, 5},
    {I_LSS, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21931, 5},
    {I_LSS, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+21937, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_LTR[] = {
    {I_LTR, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25913, 66},
    {I_LTR, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25913, 66},
    {I_LTR, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25913, 66},
    ITEMPLATE_END
};

static const struct itemplate instrux_LWPINS[] = {
    {I_LWPINS, 3, {REG_GPR|BITS32,RM_GPR|BITS32,IMMEDIATE|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+7724, 184},
    {I_LWPINS, 3, {REG_GPR|BITS64,RM_GPR|BITS32,IMMEDIATE|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+7732, 185},
    ITEMPLATE_END
};

static const struct itemplate instrux_LWPVAL[] = {
    {I_LWPVAL, 3, {REG_GPR|BITS32,RM_GPR|BITS32,IMMEDIATE|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+7708, 184},
    {I_LWPVAL, 3, {REG_GPR|BITS64,RM_GPR|BITS32,IMMEDIATE|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+7716, 185},
    ITEMPLATE_END
};

static const struct itemplate instrux_LZCNT[] = {
    {I_LZCNT, 2, {REG_GPR|BITS16,RM_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14274, 103},
    {I_LZCNT, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+14281, 103},
    {I_LZCNT, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+14288, 58},
    ITEMPLATE_END
};

static const struct itemplate instrux_MASKMOVDQU[] = {
    {I_MASKMOVDQU, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22897, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_MASKMOVQ[] = {
    {I_MASKMOVQ, 2, {MMXREG,MMXREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+22879, 127},
    ITEMPLATE_END
};

static const struct itemplate instrux_MAXPD[] = {
    {I_MAXPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23443, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_MAXPS[] = {
    {I_MAXPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22693, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MAXSD[] = {
    {I_MAXSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23449, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_MAXSS[] = {
    {I_MAXSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22699, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MFENCE[] = {
    {I_MFENCE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21943, 58},
    {I_MFENCE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+21943, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_MINPD[] = {
    {I_MINPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23455, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_MINPS[] = {
    {I_MINPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22705, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MINSD[] = {
    {I_MINSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23461, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_MINSS[] = {
    {I_MINSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22711, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MONITOR[] = {
    {I_MONITOR, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+25918, 68},
    {I_MONITOR, 3, {REG_EAX,REG_ECX,REG_EDX,0,0}, NO_DECORATOR, nasm_bytecodes+25918, 69},
    {I_MONITOR, 3, {REG_RAX,REG_ECX,REG_EDX,0,0}, NO_DECORATOR, nasm_bytecodes+25918, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_MONTMUL[] = {
    {I_MONTMUL, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23785, 17},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOV[] = {
    {I_MOV, 2, {MEMORY,REG_SREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25939, 70},
    {I_MOV, 2, {REG_GPR|BITS16,REG_SREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25923, 0},
    {I_MOV, 2, {REG_GPR|BITS32,REG_SREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25928, 5},
    {I_MOV, 2, {REG_GPR|BITS64,REG_SREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25933, 71},
    {I_MOV, 2, {RM_GPR|BITS64,REG_SREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25938, 7},
    {I_MOV, 2, {REG_SREG,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+25959, 70},
    {I_MOV, 2, {REG_SREG,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+25959, 72},
    {I_MOV, 2, {REG_SREG,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+25959, 73},
    {I_MOV, 2, {REG_SREG,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+25943, 71},
    {I_MOV, 2, {REG_SREG,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+25948, 0},
    {I_MOV, 2, {REG_SREG,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+25953, 5},
    {I_MOV, 2, {REG_SREG,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+25958, 7},
    {I_MOV, 2, {REG_AL,MEM_OFFS,0,0,0}, NO_DECORATOR, nasm_bytecodes+27439, 8},
    {I_MOV, 2, {REG_AX,MEM_OFFS,0,0,0}, NO_DECORATOR, nasm_bytecodes+25963, 8},
    {I_MOV, 2, {REG_EAX,MEM_OFFS,0,0,0}, NO_DECORATOR, nasm_bytecodes+25968, 9},
    {I_MOV, 2, {REG_RAX,MEM_OFFS,0,0,0}, NO_DECORATOR, nasm_bytecodes+25973, 10},
    {I_MOV, 2, {MEM_OFFS,REG_AL,0,0,0}, NO_DECORATOR, nasm_bytecodes+27443, 74},
    {I_MOV, 2, {MEM_OFFS,REG_AX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25978, 74},
    {I_MOV, 2, {MEM_OFFS,REG_EAX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25983, 75},
    {I_MOV, 2, {MEM_OFFS,REG_RAX,0,0,0}, NO_DECORATOR, nasm_bytecodes+25988, 76},
    {I_MOV, 2, {REG_GPR|BITS32,REG_CREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+21949, 77},
    {I_MOV, 2, {REG_GPR|BITS64,REG_CREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+21955, 78},
    {I_MOV, 2, {REG_CREG,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21961, 77},
    {I_MOV, 2, {REG_CREG,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21967, 78},
    {I_MOV, 2, {REG_GPR|BITS32,REG_DREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+21974, 77},
    {I_MOV, 2, {REG_GPR|BITS64,REG_DREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+21973, 78},
    {I_MOV, 2, {REG_DREG,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21980, 77},
    {I_MOV, 2, {REG_DREG,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21979, 78},
    {I_MOV, 2, {REG_GPR|BITS32,REG_TREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+25993, 19},
    {I_MOV, 2, {REG_TREG,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+25998, 19},
    {I_MOV, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26003, 8},
    {I_MOV, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26004, 0},
    {I_MOV, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21985, 8},
    {I_MOV, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21986, 0},
    {I_MOV, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21991, 9},
    {I_MOV, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21992, 5},
    {I_MOV, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21997, 10},
    {I_MOV, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21998, 7},
    {I_MOV, 2, {REG_GPR|BITS8,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+27447, 8},
    {I_MOV, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+27447, 0},
    {I_MOV, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26008, 8},
    {I_MOV, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+26008, 0},
    {I_MOV, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26013, 9},
    {I_MOV, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+26013, 5},
    {I_MOV, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26018, 10},
    {I_MOV, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+26018, 7},
    {I_MOV, 2, {REG_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+27451, 8},
    {I_MOV, 2, {REG_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26023, 8},
    {I_MOV, 2, {REG_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26028, 9},
    {I_MOV, 2, {REG_GPR|BITS64,UDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+26033, 79},
    {I_MOV, 2, {REG_GPR|BITS64,SDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12973, 79},
    {I_MOV, 2, {REG_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26038, 10},
    {I_MOV, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+22003, 8},
    {I_MOV, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12958, 8},
    {I_MOV, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12965, 9},
    {I_MOV, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+12972, 10},
    {I_MOV, 2, {RM_GPR|BITS64,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12972, 7},
    {I_MOV, 2, {MEMORY,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22003, 8},
    {I_MOV, 2, {MEMORY,IMMEDIATE|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12958, 8},
    {I_MOV, 2, {MEMORY,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+12965, 9},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVAPD[] = {
    {I_MOVAPD, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23467, 131},
    {I_MOVAPD, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23473, 131},
    {I_MOVAPD, 2, {MEMORY,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23473, 132},
    {I_MOVAPD, 2, {XMM_L16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+23467, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVAPS[] = {
    {I_MOVAPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22717, 111},
    {I_MOVAPS, 2, {RM_XMM_L16|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22723, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVBE[] = {
    {I_MOVBE, 2, {REG_GPR|BITS16,MEMORY|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6708, 172},
    {I_MOVBE, 2, {REG_GPR|BITS32,MEMORY|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+6716, 172},
    {I_MOVBE, 2, {REG_GPR|BITS64,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+6724, 172},
    {I_MOVBE, 2, {MEMORY|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+6732, 172},
    {I_MOVBE, 2, {MEMORY|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+6740, 172},
    {I_MOVBE, 2, {MEMORY|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+6748, 172},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVD[] = {
    {I_MOVD, 2, {MMXREG,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22009, 80},
    {I_MOVD, 2, {RM_GPR|BITS32,MMXREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+22015, 80},
    {I_MOVD, 2, {MMXREG,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12979, 81},
    {I_MOVD, 2, {RM_GPR|BITS64,MMXREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+12986, 81},
    {I_MOVD, 2, {MEMORY,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13833, 135},
    {I_MOVD, 2, {XMM_L16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+13840, 135},
    {I_MOVD, 2, {XMM_L16,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13840, 131},
    {I_MOVD, 2, {RM_GPR|BITS32,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13833, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVDDUP[] = {
    {I_MOVDDUP, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23641, 147},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVDQ2Q[] = {
    {I_MOVDQ2Q, 2, {MMXREG,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22945, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVDQA[] = {
    {I_MOVDQA, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22921, 131},
    {I_MOVDQA, 2, {MEMORY,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22927, 132},
    {I_MOVDQA, 2, {XMM_L16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+22921, 132},
    {I_MOVDQA, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22927, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVDQU[] = {
    {I_MOVDQU, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22933, 131},
    {I_MOVDQU, 2, {MEMORY,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22939, 132},
    {I_MOVDQU, 2, {XMM_L16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+22933, 132},
    {I_MOVDQU, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22939, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVHLPS[] = {
    {I_MOVHLPS, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22525, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVHPD[] = {
    {I_MOVHPD, 2, {MEMORY,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23479, 131},
    {I_MOVHPD, 2, {XMM_L16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+23485, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVHPS[] = {
    {I_MOVHPS, 2, {XMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22729, 111},
    {I_MOVHPS, 2, {MEMORY|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22735, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVLHPS[] = {
    {I_MOVLHPS, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22729, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVLPD[] = {
    {I_MOVLPD, 2, {MEMORY|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23491, 131},
    {I_MOVLPD, 2, {XMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+23497, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVLPS[] = {
    {I_MOVLPS, 2, {XMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22525, 111},
    {I_MOVLPS, 2, {MEMORY|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22741, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVMSKPD[] = {
    {I_MOVMSKPD, 2, {REG_GPR|BITS32,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23503, 131},
    {I_MOVMSKPD, 2, {REG_GPR|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14036, 137},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVMSKPS[] = {
    {I_MOVMSKPS, 2, {REG_GPR|BITS32,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22747, 111},
    {I_MOVMSKPS, 2, {REG_GPR|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13707, 118},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVNTDQ[] = {
    {I_MOVNTDQ, 2, {MEMORY,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22909, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVNTDQA[] = {
    {I_MOVNTDQA, 2, {XMM_L16,MEMORY|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14309, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVNTI[] = {
    {I_MOVNTI, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13827, 133},
    {I_MOVNTI, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+13826, 134},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVNTPD[] = {
    {I_MOVNTPD, 2, {MEMORY,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22915, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVNTPS[] = {
    {I_MOVNTPS, 2, {MEMORY|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22753, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVNTQ[] = {
    {I_MOVNTQ, 2, {MEMORY,MMXREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+22885, 128},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVNTSD[] = {
    {I_MOVNTSD, 2, {MEMORY,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23695, 157},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVNTSS[] = {
    {I_MOVNTSS, 2, {MEMORY,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23701, 158},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVQ[] = {
    {I_MOVQ, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+22021, 82},
    {I_MOVQ, 2, {RM_MMX,MMXREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+22027, 82},
    {I_MOVQ, 2, {MMXREG,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+12979, 83},
    {I_MOVQ, 2, {RM_GPR|BITS64,MMXREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+12986, 83},
    {I_MOVQ, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22951, 131},
    {I_MOVQ, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22957, 131},
    {I_MOVQ, 2, {MEMORY,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22957, 136},
    {I_MOVQ, 2, {XMM_L16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+22951, 136},
    {I_MOVQ, 2, {XMM_L16,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+13847, 137},
    {I_MOVQ, 2, {RM_GPR|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13854, 137},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVQ2DQ[] = {
    {I_MOVQ2DQ, 2, {XMM_L16,MMXREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+22963, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVSB[] = {
    {I_MOVSB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+6097, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVSD[] = {
    {I_MOVSD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27455, 5},
    {I_MOVSD, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23509, 131},
    {I_MOVSD, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23515, 131},
    {I_MOVSD, 2, {MEMORY|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23515, 131},
    {I_MOVSD, 2, {XMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+23509, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVSHDUP[] = {
    {I_MOVSHDUP, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23647, 147},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVSLDUP[] = {
    {I_MOVSLDUP, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23653, 147},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVSQ[] = {
    {I_MOVSQ, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27459, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVSS[] = {
    {I_MOVSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22759, 111},
    {I_MOVSS, 2, {MEMORY|BITS32,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22765, 111},
    {I_MOVSS, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22759, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVSW[] = {
    {I_MOVSW, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27463, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVSX[] = {
    {I_MOVSX, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+22033, 21},
    {I_MOVSX, 2, {REG_GPR|BITS16,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22033, 5},
    {I_MOVSX, 2, {REG_GPR|BITS32,RM_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22039, 5},
    {I_MOVSX, 2, {REG_GPR|BITS32,RM_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22045, 5},
    {I_MOVSX, 2, {REG_GPR|BITS64,RM_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22051, 7},
    {I_MOVSX, 2, {REG_GPR|BITS64,RM_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22057, 7},
    {I_MOVSX, 2, {REG_GPR|BITS64,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+26043, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVSXD[] = {
    {I_MOVSXD, 2, {REG_GPR|BITS64,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+26043, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVUPD[] = {
    {I_MOVUPD, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23521, 131},
    {I_MOVUPD, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23527, 131},
    {I_MOVUPD, 2, {MEMORY,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23527, 132},
    {I_MOVUPD, 2, {XMM_L16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+23521, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVUPS[] = {
    {I_MOVUPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22771, 111},
    {I_MOVUPS, 2, {RM_XMM_L16|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22777, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MOVZX[] = {
    {I_MOVZX, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+22063, 21},
    {I_MOVZX, 2, {REG_GPR|BITS16,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22063, 5},
    {I_MOVZX, 2, {REG_GPR|BITS32,RM_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22069, 5},
    {I_MOVZX, 2, {REG_GPR|BITS32,RM_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22075, 5},
    {I_MOVZX, 2, {REG_GPR|BITS64,RM_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22081, 7},
    {I_MOVZX, 2, {REG_GPR|BITS64,RM_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22087, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_MPSADBW[] = {
    {I_MPSADBW, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6580, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_MUL[] = {
    {I_MUL, 1, {RM_GPR|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27467, 0},
    {I_MUL, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26048, 0},
    {I_MUL, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26053, 5},
    {I_MUL, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26058, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_MULPD[] = {
    {I_MULPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23533, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_MULPS[] = {
    {I_MULPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22783, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MULSD[] = {
    {I_MULSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23539, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_MULSS[] = {
    {I_MULSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22789, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_MULX[] = {
    {I_MULX, 3, {REG_GPR|BITS32,REG_GPR|BITS32,RM_GPR|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+21176, 196},
    {I_MULX, 3, {REG_GPR|BITS64,REG_GPR|BITS64,RM_GPR|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+21183, 197},
    ITEMPLATE_END
};

static const struct itemplate instrux_MWAIT[] = {
    {I_MWAIT, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26063, 68},
    {I_MWAIT, 2, {REG_EAX,REG_ECX,0,0,0}, NO_DECORATOR, nasm_bytecodes+26063, 68},
    ITEMPLATE_END
};

static const struct itemplate instrux_NEG[] = {
    {I_NEG, 1, {RM_GPR|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26068, 11},
    {I_NEG, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22093, 11},
    {I_NEG, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22099, 12},
    {I_NEG, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22105, 13},
    ITEMPLATE_END
};

static const struct itemplate instrux_NOP[] = {
    {I_NOP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26073, 0},
    {I_NOP, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22111, 84},
    {I_NOP, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22117, 84},
    {I_NOP, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22123, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_NOT[] = {
    {I_NOT, 1, {RM_GPR|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26078, 11},
    {I_NOT, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22129, 11},
    {I_NOT, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22135, 12},
    {I_NOT, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22141, 13},
    ITEMPLATE_END
};

static const struct itemplate instrux_OR[] = {
    {I_OR, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26083, 3},
    {I_OR, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26084, 0},
    {I_OR, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22147, 3},
    {I_OR, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22148, 0},
    {I_OR, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22153, 4},
    {I_OR, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22154, 5},
    {I_OR, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22159, 6},
    {I_OR, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22160, 7},
    {I_OR, 2, {REG_GPR|BITS8,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+20290, 8},
    {I_OR, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+20290, 0},
    {I_OR, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26088, 8},
    {I_OR, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+26088, 0},
    {I_OR, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26093, 9},
    {I_OR, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+26093, 5},
    {I_OR, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26098, 10},
    {I_OR, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+26098, 7},
    {I_OR, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+12993, 11},
    {I_OR, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+13000, 12},
    {I_OR, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+13007, 13},
    {I_OR, 2, {REG_AL,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+27471, 8},
    {I_OR, 2, {REG_AX,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12994, 8},
    {I_OR, 2, {REG_AX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26103, 8},
    {I_OR, 2, {REG_EAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13001, 9},
    {I_OR, 2, {REG_EAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26108, 9},
    {I_OR, 2, {REG_RAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13008, 10},
    {I_OR, 2, {REG_RAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26113, 10},
    {I_OR, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+22165, 3},
    {I_OR, 2, {RM_GPR|BITS16,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+12993, 3},
    {I_OR, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13014, 3},
    {I_OR, 2, {RM_GPR|BITS32,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13000, 4},
    {I_OR, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13021, 4},
    {I_OR, 2, {RM_GPR|BITS64,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13007, 6},
    {I_OR, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13028, 6},
    {I_OR, 2, {MEMORY,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22165, 3},
    {I_OR, 2, {MEMORY,SBYTEWORD|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+12993, 3},
    {I_OR, 2, {MEMORY,IMMEDIATE|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13014, 3},
    {I_OR, 2, {MEMORY,SBYTEDWORD|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13000, 4},
    {I_OR, 2, {MEMORY,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13021, 4},
    {I_OR, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+22171, 14},
    ITEMPLATE_END
};

static const struct itemplate instrux_ORPD[] = {
    {I_ORPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23545, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_ORPS[] = {
    {I_ORPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22795, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_OUT[] = {
    {I_OUT, 2, {IMMEDIATE,REG_AL,0,0,0}, NO_DECORATOR, nasm_bytecodes+27475, 52},
    {I_OUT, 2, {IMMEDIATE,REG_AX,0,0,0}, NO_DECORATOR, nasm_bytecodes+26118, 52},
    {I_OUT, 2, {IMMEDIATE,REG_EAX,0,0,0}, NO_DECORATOR, nasm_bytecodes+26123, 21},
    {I_OUT, 2, {REG_DX,REG_AL,0,0,0}, NO_DECORATOR, nasm_bytecodes+27820, 0},
    {I_OUT, 2, {REG_DX,REG_AX,0,0,0}, NO_DECORATOR, nasm_bytecodes+27479, 0},
    {I_OUT, 2, {REG_DX,REG_EAX,0,0,0}, NO_DECORATOR, nasm_bytecodes+27483, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_OUTSB[] = {
    {I_OUTSB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27823, 38},
    ITEMPLATE_END
};

static const struct itemplate instrux_OUTSD[] = {
    {I_OUTSD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27487, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_OUTSW[] = {
    {I_OUTSW, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27491, 38},
    ITEMPLATE_END
};

static const struct itemplate instrux_PABSB[] = {
    {I_PABSB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14064, 154},
    {I_PABSB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14071, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PABSD[] = {
    {I_PABSD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14092, 154},
    {I_PABSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14099, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PABSW[] = {
    {I_PABSW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14078, 154},
    {I_PABSW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14085, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PACKSSDW[] = {
    {I_PACKSSDW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13035, 82},
    {I_PACKSSDW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22975, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PACKSSWB[] = {
    {I_PACKSSWB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13042, 82},
    {I_PACKSSWB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22969, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PACKUSDW[] = {
    {I_PACKUSDW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14316, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PACKUSWB[] = {
    {I_PACKUSWB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13049, 82},
    {I_PACKUSWB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22981, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PADDB[] = {
    {I_PADDB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13056, 82},
    {I_PADDB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22987, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PADDD[] = {
    {I_PADDD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13063, 82},
    {I_PADDD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22999, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PADDQ[] = {
    {I_PADDQ, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+23005, 138},
    {I_PADDQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23011, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PADDSB[] = {
    {I_PADDSB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13070, 82},
    {I_PADDSB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23017, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PADDSIW[] = {
    {I_PADDSIW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+22177, 85},
    ITEMPLATE_END
};

static const struct itemplate instrux_PADDSW[] = {
    {I_PADDSW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13077, 82},
    {I_PADDSW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23023, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PADDUSB[] = {
    {I_PADDUSB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13084, 82},
    {I_PADDUSB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23029, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PADDUSW[] = {
    {I_PADDUSW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13091, 82},
    {I_PADDUSW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23035, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PADDW[] = {
    {I_PADDW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13098, 82},
    {I_PADDW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22993, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PALIGNR[] = {
    {I_PALIGNR, 3, {MMXREG,RM_MMX,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6508, 154},
    {I_PALIGNR, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6516, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PAND[] = {
    {I_PAND, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13105, 82},
    {I_PAND, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23041, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PANDN[] = {
    {I_PANDN, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13112, 82},
    {I_PANDN, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23047, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PAUSE[] = {
    {I_PAUSE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27495, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_PAVEB[] = {
    {I_PAVEB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+22183, 85},
    ITEMPLATE_END
};

static const struct itemplate instrux_PAVGB[] = {
    {I_PAVGB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13756, 128},
    {I_PAVGB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23053, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PAVGUSB[] = {
    {I_PAVGUSB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6036, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PAVGW[] = {
    {I_PAVGW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13763, 128},
    {I_PAVGW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23059, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PBLENDVB[] = {
    {I_PBLENDVB, 3, {XMM_L16,RM_XMM_L16,XMM0,0,0}, NO_DECORATOR, nasm_bytecodes+14323, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PBLENDW[] = {
    {I_PBLENDW, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6588, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCLMULHQHQDQ[] = {
    {I_PCLMULHQHQDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+5055, 173},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCLMULHQLQDQ[] = {
    {I_PCLMULHQLQDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+5037, 173},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCLMULLQHQDQ[] = {
    {I_PCLMULLQHQDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+5046, 173},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCLMULLQLQDQ[] = {
    {I_PCLMULLQLQDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+5028, 173},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCLMULQDQ[] = {
    {I_PCLMULQDQ, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7636, 173},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCMPEQB[] = {
    {I_PCMPEQB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13119, 82},
    {I_PCMPEQB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23065, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCMPEQD[] = {
    {I_PCMPEQD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13126, 82},
    {I_PCMPEQD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23077, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCMPEQQ[] = {
    {I_PCMPEQQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14330, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCMPEQW[] = {
    {I_PCMPEQW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13133, 82},
    {I_PCMPEQW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23071, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCMPESTRI[] = {
    {I_PCMPESTRI, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6660, 166},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCMPESTRM[] = {
    {I_PCMPESTRM, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6668, 166},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCMPGTB[] = {
    {I_PCMPGTB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13140, 82},
    {I_PCMPGTB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23083, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCMPGTD[] = {
    {I_PCMPGTD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13147, 82},
    {I_PCMPGTD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23095, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCMPGTQ[] = {
    {I_PCMPGTQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14505, 166},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCMPGTW[] = {
    {I_PCMPGTW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13154, 82},
    {I_PCMPGTW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23089, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCMPISTRI[] = {
    {I_PCMPISTRI, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6676, 166},
    ITEMPLATE_END
};

static const struct itemplate instrux_PCMPISTRM[] = {
    {I_PCMPISTRM, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6684, 166},
    ITEMPLATE_END
};

static const struct itemplate instrux_PDEP[] = {
    {I_PDEP, 3, {REG_GPR|BITS32,REG_GPR|BITS32,RM_GPR|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+21190, 196},
    {I_PDEP, 3, {REG_GPR|BITS64,REG_GPR|BITS64,RM_GPR|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+21197, 197},
    ITEMPLATE_END
};

static const struct itemplate instrux_PDISTIB[] = {
    {I_PDISTIB, 2, {MMXREG,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+23342, 87},
    ITEMPLATE_END
};

static const struct itemplate instrux_PEXT[] = {
    {I_PEXT, 3, {REG_GPR|BITS32,REG_GPR|BITS32,RM_GPR|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+21204, 196},
    {I_PEXT, 3, {REG_GPR|BITS64,REG_GPR|BITS64,RM_GPR|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+21211, 197},
    ITEMPLATE_END
};

static const struct itemplate instrux_PEXTRB[] = {
    {I_PEXTRB, 3, {REG_GPR|BITS32,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1510, 159},
    {I_PEXTRB, 3, {MEMORY|BITS8,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1510, 159},
    {I_PEXTRB, 3, {REG_GPR|BITS64,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1509, 160},
    ITEMPLATE_END
};

static const struct itemplate instrux_PEXTRD[] = {
    {I_PEXTRD, 3, {RM_GPR|BITS32,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1518, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PEXTRQ[] = {
    {I_PEXTRQ, 3, {RM_GPR|BITS64,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1527, 160},
    ITEMPLATE_END
};

static const struct itemplate instrux_PEXTRW[] = {
    {I_PEXTRW, 3, {REG_GPR|BITS32,MMXREG,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13770, 129},
    {I_PEXTRW, 3, {REG_GPR|BITS32,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13861, 139},
    {I_PEXTRW, 3, {REG_GPR|BITS32,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1537, 159},
    {I_PEXTRW, 3, {MEMORY|BITS16,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1537, 159},
    {I_PEXTRW, 3, {REG_GPR|BITS64,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1536, 160},
    ITEMPLATE_END
};

static const struct itemplate instrux_PF2ID[] = {
    {I_PF2ID, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6044, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PF2IW[] = {
    {I_PF2IW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6324, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFACC[] = {
    {I_PFACC, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6052, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFADD[] = {
    {I_PFADD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6060, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFCMPEQ[] = {
    {I_PFCMPEQ, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6068, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFCMPGE[] = {
    {I_PFCMPGE, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6076, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFCMPGT[] = {
    {I_PFCMPGT, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6084, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFMAX[] = {
    {I_PFMAX, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6092, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFMIN[] = {
    {I_PFMIN, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6100, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFMUL[] = {
    {I_PFMUL, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6108, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFNACC[] = {
    {I_PFNACC, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6332, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFPNACC[] = {
    {I_PFPNACC, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6340, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFRCP[] = {
    {I_PFRCP, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6116, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFRCPIT1[] = {
    {I_PFRCPIT1, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6124, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFRCPIT2[] = {
    {I_PFRCPIT2, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6132, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFRCPV[] = {
    {I_PFRCPV, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6692, 171},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFRSQIT1[] = {
    {I_PFRSQIT1, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6140, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFRSQRT[] = {
    {I_PFRSQRT, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6148, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFRSQRTV[] = {
    {I_PFRSQRTV, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6700, 171},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFSUB[] = {
    {I_PFSUB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6156, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PFSUBR[] = {
    {I_PFSUBR, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6164, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PHADDD[] = {
    {I_PHADDD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14120, 154},
    {I_PHADDD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14127, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PHADDSW[] = {
    {I_PHADDSW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14134, 154},
    {I_PHADDSW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14141, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PHADDW[] = {
    {I_PHADDW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14106, 154},
    {I_PHADDW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14113, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PHMINPOSUW[] = {
    {I_PHMINPOSUW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14337, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PHSUBD[] = {
    {I_PHSUBD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14162, 154},
    {I_PHSUBD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14169, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PHSUBSW[] = {
    {I_PHSUBSW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14176, 154},
    {I_PHSUBSW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14183, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PHSUBW[] = {
    {I_PHSUBW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14148, 154},
    {I_PHSUBW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14155, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PI2FD[] = {
    {I_PI2FD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6172, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PI2FW[] = {
    {I_PI2FW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6348, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PINSRB[] = {
    {I_PINSRB, 3, {XMM_L16,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1546, 162},
    {I_PINSRB, 3, {XMM_L16,RM_GPR|BITS8,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1545, 162},
    {I_PINSRB, 3, {XMM_L16,REG_GPR|BITS32,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1546, 162},
    ITEMPLATE_END
};

static const struct itemplate instrux_PINSRD[] = {
    {I_PINSRD, 3, {XMM_L16,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1554, 162},
    {I_PINSRD, 3, {XMM_L16,RM_GPR|BITS32,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1554, 162},
    ITEMPLATE_END
};

static const struct itemplate instrux_PINSRQ[] = {
    {I_PINSRQ, 3, {XMM_L16,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1563, 163},
    {I_PINSRQ, 3, {XMM_L16,RM_GPR|BITS64,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+1563, 163},
    ITEMPLATE_END
};

static const struct itemplate instrux_PINSRW[] = {
    {I_PINSRW, 3, {MMXREG,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13777, 129},
    {I_PINSRW, 3, {MMXREG,RM_GPR|BITS16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13777, 129},
    {I_PINSRW, 3, {MMXREG,REG_GPR|BITS32,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13777, 129},
    {I_PINSRW, 3, {XMM_L16,REG_GPR|BITS16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13868, 139},
    {I_PINSRW, 3, {XMM_L16,REG_GPR|BITS32,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13868, 139},
    {I_PINSRW, 3, {XMM_L16,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13868, 139},
    {I_PINSRW, 3, {XMM_L16,MEMORY|BITS16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13868, 139},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMACHRIW[] = {
    {I_PMACHRIW, 2, {MMXREG,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+23438, 87},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMADDUBSW[] = {
    {I_PMADDUBSW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14190, 154},
    {I_PMADDUBSW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14197, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMADDWD[] = {
    {I_PMADDWD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13161, 82},
    {I_PMADDWD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23101, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMAGW[] = {
    {I_PMAGW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+22189, 85},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMAXSB[] = {
    {I_PMAXSB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14344, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMAXSD[] = {
    {I_PMAXSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14351, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMAXSW[] = {
    {I_PMAXSW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13784, 128},
    {I_PMAXSW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23107, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMAXUB[] = {
    {I_PMAXUB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13791, 128},
    {I_PMAXUB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23113, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMAXUD[] = {
    {I_PMAXUD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14358, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMAXUW[] = {
    {I_PMAXUW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14365, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMINSB[] = {
    {I_PMINSB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14372, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMINSD[] = {
    {I_PMINSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14379, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMINSW[] = {
    {I_PMINSW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13798, 128},
    {I_PMINSW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23119, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMINUB[] = {
    {I_PMINUB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13805, 128},
    {I_PMINUB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23125, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMINUD[] = {
    {I_PMINUD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14386, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMINUW[] = {
    {I_PMINUW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14393, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMOVMSKB[] = {
    {I_PMOVMSKB, 2, {REG_GPR|BITS32,MMXREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+22891, 127},
    {I_PMOVMSKB, 2, {REG_GPR|BITS32,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23131, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMOVSXBD[] = {
    {I_PMOVSXBD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14407, 161},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMOVSXBQ[] = {
    {I_PMOVSXBQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14414, 165},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMOVSXBW[] = {
    {I_PMOVSXBW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14400, 164},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMOVSXDQ[] = {
    {I_PMOVSXDQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14435, 164},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMOVSXWD[] = {
    {I_PMOVSXWD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14421, 164},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMOVSXWQ[] = {
    {I_PMOVSXWQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14428, 161},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMOVZXBD[] = {
    {I_PMOVZXBD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14449, 161},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMOVZXBQ[] = {
    {I_PMOVZXBQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14456, 165},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMOVZXBW[] = {
    {I_PMOVZXBW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14442, 164},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMOVZXDQ[] = {
    {I_PMOVZXDQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14477, 164},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMOVZXWD[] = {
    {I_PMOVZXWD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14463, 164},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMOVZXWQ[] = {
    {I_PMOVZXWQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14470, 161},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMULDQ[] = {
    {I_PMULDQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14484, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMULHRIW[] = {
    {I_PMULHRIW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+22195, 85},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMULHRSW[] = {
    {I_PMULHRSW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14204, 154},
    {I_PMULHRSW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14211, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMULHRWA[] = {
    {I_PMULHRWA, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6180, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMULHRWC[] = {
    {I_PMULHRWC, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+22201, 85},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMULHUW[] = {
    {I_PMULHUW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13812, 128},
    {I_PMULHUW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23137, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMULHW[] = {
    {I_PMULHW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13168, 82},
    {I_PMULHW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23143, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMULLD[] = {
    {I_PMULLD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14491, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMULLW[] = {
    {I_PMULLW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13175, 82},
    {I_PMULLW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23149, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMULUDQ[] = {
    {I_PMULUDQ, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13875, 132},
    {I_PMULUDQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23155, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMVGEZB[] = {
    {I_PMVGEZB, 2, {MMXREG,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+23570, 85},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMVLZB[] = {
    {I_PMVLZB, 2, {MMXREG,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+23426, 85},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMVNZB[] = {
    {I_PMVNZB, 2, {MMXREG,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+23408, 85},
    ITEMPLATE_END
};

static const struct itemplate instrux_PMVZB[] = {
    {I_PMVZB, 2, {MMXREG,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+23330, 85},
    ITEMPLATE_END
};

static const struct itemplate instrux_POP[] = {
    {I_POP, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27499, 0},
    {I_POP, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27503, 19},
    {I_POP, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27507, 7},
    {I_POP, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26128, 0},
    {I_POP, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26133, 19},
    {I_POP, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26138, 7},
    {I_POP, 1, {REG_ES,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+6473, 1},
    {I_POP, 1, {REG_CS,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+4755, 88},
    {I_POP, 1, {REG_SS,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+4881, 1},
    {I_POP, 1, {REG_DS,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+5025, 1},
    {I_POP, 1, {REG_FS,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27511, 5},
    {I_POP, 1, {REG_GS,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27515, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_POPA[] = {
    {I_POPA, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27519, 18},
    ITEMPLATE_END
};

static const struct itemplate instrux_POPAD[] = {
    {I_POPAD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27523, 19},
    ITEMPLATE_END
};

static const struct itemplate instrux_POPAW[] = {
    {I_POPAW, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27527, 18},
    ITEMPLATE_END
};

static const struct itemplate instrux_POPCNT[] = {
    {I_POPCNT, 2, {REG_GPR|BITS16,RM_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14512, 168},
    {I_POPCNT, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+14519, 169},
    {I_POPCNT, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+14526, 170},
    ITEMPLATE_END
};

static const struct itemplate instrux_POPF[] = {
    {I_POPF, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27531, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_POPFD[] = {
    {I_POPFD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27535, 19},
    ITEMPLATE_END
};

static const struct itemplate instrux_POPFQ[] = {
    {I_POPFQ, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27535, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_POPFW[] = {
    {I_POPFW, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27539, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_POR[] = {
    {I_POR, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13182, 82},
    {I_POR, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23161, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PREFETCH[] = {
    {I_PREFETCH, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26143, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PREFETCHNTA[] = {
    {I_PREFETCHNTA, 1, {MEMORY|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23912, 126},
    ITEMPLATE_END
};

static const struct itemplate instrux_PREFETCHT0[] = {
    {I_PREFETCHT0, 1, {MEMORY|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23930, 126},
    ITEMPLATE_END
};

static const struct itemplate instrux_PREFETCHT1[] = {
    {I_PREFETCHT1, 1, {MEMORY|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23948, 126},
    ITEMPLATE_END
};

static const struct itemplate instrux_PREFETCHT2[] = {
    {I_PREFETCHT2, 1, {MEMORY|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23966, 126},
    ITEMPLATE_END
};

static const struct itemplate instrux_PREFETCHW[] = {
    {I_PREFETCHW, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26148, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PREFETCHWT1[] = {
    {I_PREFETCHWT1, 1, {MEMORY|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26778, 205},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSADBW[] = {
    {I_PSADBW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13819, 128},
    {I_PSADBW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23167, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSHUFB[] = {
    {I_PSHUFB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14218, 154},
    {I_PSHUFB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14225, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSHUFD[] = {
    {I_PSHUFD, 3, {XMM_L16,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13882, 139},
    {I_PSHUFD, 3, {XMM_L16,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13882, 140},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSHUFHW[] = {
    {I_PSHUFHW, 3, {XMM_L16,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13889, 139},
    {I_PSHUFHW, 3, {XMM_L16,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13889, 140},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSHUFLW[] = {
    {I_PSHUFLW, 3, {XMM_L16,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13896, 139},
    {I_PSHUFLW, 3, {XMM_L16,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13896, 140},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSHUFW[] = {
    {I_PSHUFW, 3, {MMXREG,RM_MMX,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6316, 130},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSIGNB[] = {
    {I_PSIGNB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14232, 154},
    {I_PSIGNB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14239, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSIGND[] = {
    {I_PSIGND, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14260, 154},
    {I_PSIGND, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14267, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSIGNW[] = {
    {I_PSIGNW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+14246, 154},
    {I_PSIGNW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14253, 155},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSLLD[] = {
    {I_PSLLD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13189, 82},
    {I_PSLLD, 2, {MMXREG,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13196, 37},
    {I_PSLLD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23179, 132},
    {I_PSLLD, 2, {XMM_L16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13917, 141},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSLLDQ[] = {
    {I_PSLLDQ, 2, {XMM_L16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13903, 141},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSLLQ[] = {
    {I_PSLLQ, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13203, 82},
    {I_PSLLQ, 2, {MMXREG,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13210, 37},
    {I_PSLLQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23185, 132},
    {I_PSLLQ, 2, {XMM_L16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13924, 141},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSLLW[] = {
    {I_PSLLW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13217, 82},
    {I_PSLLW, 2, {MMXREG,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13224, 37},
    {I_PSLLW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23173, 132},
    {I_PSLLW, 2, {XMM_L16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13910, 141},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSRAD[] = {
    {I_PSRAD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13231, 82},
    {I_PSRAD, 2, {MMXREG,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13238, 37},
    {I_PSRAD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23197, 132},
    {I_PSRAD, 2, {XMM_L16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13938, 141},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSRAW[] = {
    {I_PSRAW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13245, 82},
    {I_PSRAW, 2, {MMXREG,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13252, 37},
    {I_PSRAW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23191, 132},
    {I_PSRAW, 2, {XMM_L16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13931, 141},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSRLD[] = {
    {I_PSRLD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13259, 82},
    {I_PSRLD, 2, {MMXREG,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13266, 37},
    {I_PSRLD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23209, 132},
    {I_PSRLD, 2, {XMM_L16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13959, 141},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSRLDQ[] = {
    {I_PSRLDQ, 2, {XMM_L16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13945, 141},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSRLQ[] = {
    {I_PSRLQ, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13273, 82},
    {I_PSRLQ, 2, {MMXREG,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13280, 37},
    {I_PSRLQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23215, 132},
    {I_PSRLQ, 2, {XMM_L16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13966, 141},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSRLW[] = {
    {I_PSRLW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13287, 82},
    {I_PSRLW, 2, {MMXREG,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13294, 37},
    {I_PSRLW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23203, 132},
    {I_PSRLW, 2, {XMM_L16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13952, 141},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSUBB[] = {
    {I_PSUBB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13301, 82},
    {I_PSUBB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23221, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSUBD[] = {
    {I_PSUBD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13308, 82},
    {I_PSUBD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23233, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSUBQ[] = {
    {I_PSUBQ, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13973, 132},
    {I_PSUBQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23239, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSUBSB[] = {
    {I_PSUBSB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13315, 82},
    {I_PSUBSB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23245, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSUBSIW[] = {
    {I_PSUBSIW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+22207, 85},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSUBSW[] = {
    {I_PSUBSW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13322, 82},
    {I_PSUBSW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23251, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSUBUSB[] = {
    {I_PSUBUSB, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13329, 82},
    {I_PSUBUSB, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23257, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSUBUSW[] = {
    {I_PSUBUSW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13336, 82},
    {I_PSUBUSW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23263, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSUBW[] = {
    {I_PSUBW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13343, 82},
    {I_PSUBW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23227, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PSWAPD[] = {
    {I_PSWAPD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+6356, 86},
    ITEMPLATE_END
};

static const struct itemplate instrux_PTEST[] = {
    {I_PTEST, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14498, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUNPCKHBW[] = {
    {I_PUNPCKHBW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13350, 82},
    {I_PUNPCKHBW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23269, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUNPCKHDQ[] = {
    {I_PUNPCKHDQ, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13357, 82},
    {I_PUNPCKHDQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23281, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUNPCKHQDQ[] = {
    {I_PUNPCKHQDQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23287, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUNPCKHWD[] = {
    {I_PUNPCKHWD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13364, 82},
    {I_PUNPCKHWD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23275, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUNPCKLBW[] = {
    {I_PUNPCKLBW, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13371, 82},
    {I_PUNPCKLBW, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23293, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUNPCKLDQ[] = {
    {I_PUNPCKLDQ, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13378, 82},
    {I_PUNPCKLDQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23305, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUNPCKLQDQ[] = {
    {I_PUNPCKLQDQ, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23311, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUNPCKLWD[] = {
    {I_PUNPCKLWD, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13385, 82},
    {I_PUNPCKLWD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23299, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUSH[] = {
    {I_PUSH, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27543, 0},
    {I_PUSH, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27547, 19},
    {I_PUSH, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27551, 7},
    {I_PUSH, 1, {RM_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26153, 0},
    {I_PUSH, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26158, 19},
    {I_PUSH, 1, {RM_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26163, 7},
    {I_PUSH, 1, {REG_ES,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+6441, 1},
    {I_PUSH, 1, {REG_CS,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+4737, 1},
    {I_PUSH, 1, {REG_SS,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+4863, 1},
    {I_PUSH, 1, {REG_DS,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+5007, 1},
    {I_PUSH, 1, {REG_FS,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27555, 5},
    {I_PUSH, 1, {REG_GS,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27559, 5},
    {I_PUSH, 1, {IMMEDIATE|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26189, 38},
    {I_PUSH, 1, {SBYTEWORD|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26168, 89},
    {I_PUSH, 1, {IMMEDIATE|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26173, 89},
    {I_PUSH, 1, {SBYTEDWORD|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26178, 90},
    {I_PUSH, 1, {IMMEDIATE|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26183, 90},
    {I_PUSH, 1, {SBYTEDWORD|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26178, 91},
    {I_PUSH, 1, {IMMEDIATE|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26183, 91},
    {I_PUSH, 1, {SBYTEDWORD|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26188, 92},
    {I_PUSH, 1, {IMMEDIATE|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26193, 92},
    {I_PUSH, 1, {SBYTEDWORD|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26188, 92},
    {I_PUSH, 1, {IMMEDIATE|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26193, 92},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUSHA[] = {
    {I_PUSHA, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27563, 18},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUSHAD[] = {
    {I_PUSHAD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27567, 19},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUSHAW[] = {
    {I_PUSHAW, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27571, 18},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUSHF[] = {
    {I_PUSHF, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27575, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUSHFD[] = {
    {I_PUSHFD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27579, 19},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUSHFQ[] = {
    {I_PUSHFQ, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27579, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_PUSHFW[] = {
    {I_PUSHFW, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27583, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_PXOR[] = {
    {I_PXOR, 2, {MMXREG,RM_MMX,0,0,0}, NO_DECORATOR, nasm_bytecodes+13392, 82},
    {I_PXOR, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23317, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_RCL[] = {
    {I_RCL, 2, {RM_GPR|BITS8,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+27587, 0},
    {I_RCL, 2, {RM_GPR|BITS8,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+27591, 0},
    {I_RCL, 2, {RM_GPR|BITS8,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26198, 38},
    {I_RCL, 2, {RM_GPR|BITS16,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26203, 0},
    {I_RCL, 2, {RM_GPR|BITS16,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26208, 0},
    {I_RCL, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22213, 38},
    {I_RCL, 2, {RM_GPR|BITS32,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26213, 5},
    {I_RCL, 2, {RM_GPR|BITS32,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26218, 5},
    {I_RCL, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22219, 5},
    {I_RCL, 2, {RM_GPR|BITS64,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26223, 7},
    {I_RCL, 2, {RM_GPR|BITS64,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26228, 7},
    {I_RCL, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22225, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_RCPPS[] = {
    {I_RCPPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22801, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_RCPSS[] = {
    {I_RCPSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22807, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_RCR[] = {
    {I_RCR, 2, {RM_GPR|BITS8,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+27595, 0},
    {I_RCR, 2, {RM_GPR|BITS8,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+27599, 0},
    {I_RCR, 2, {RM_GPR|BITS8,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26233, 38},
    {I_RCR, 2, {RM_GPR|BITS16,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26238, 0},
    {I_RCR, 2, {RM_GPR|BITS16,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26243, 0},
    {I_RCR, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22231, 38},
    {I_RCR, 2, {RM_GPR|BITS32,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26248, 5},
    {I_RCR, 2, {RM_GPR|BITS32,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26253, 5},
    {I_RCR, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22237, 5},
    {I_RCR, 2, {RM_GPR|BITS64,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26258, 7},
    {I_RCR, 2, {RM_GPR|BITS64,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26263, 7},
    {I_RCR, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22243, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_RDFSBASE[] = {
    {I_RDFSBASE, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18656, 125},
    {I_RDFSBASE, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18663, 125},
    ITEMPLATE_END
};

static const struct itemplate instrux_RDGSBASE[] = {
    {I_RDGSBASE, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18670, 125},
    {I_RDGSBASE, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18677, 125},
    ITEMPLATE_END
};

static const struct itemplate instrux_RDM[] = {
    {I_RDM, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26815, 36},
    ITEMPLATE_END
};

static const struct itemplate instrux_RDMSR[] = {
    {I_RDMSR, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27603, 94},
    ITEMPLATE_END
};

static const struct itemplate instrux_RDPMC[] = {
    {I_RDPMC, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27607, 84},
    ITEMPLATE_END
};

static const struct itemplate instrux_RDRAND[] = {
    {I_RDRAND, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23719, 124},
    {I_RDRAND, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23725, 124},
    {I_RDRAND, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23731, 125},
    ITEMPLATE_END
};

static const struct itemplate instrux_RDSEED[] = {
    {I_RDSEED, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23737, 124},
    {I_RDSEED, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23743, 124},
    {I_RDSEED, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23749, 125},
    ITEMPLATE_END
};

static const struct itemplate instrux_RDSHR[] = {
    {I_RDSHR, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22249, 93},
    ITEMPLATE_END
};

static const struct itemplate instrux_RDTSC[] = {
    {I_RDTSC, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27611, 32},
    ITEMPLATE_END
};

static const struct itemplate instrux_RDTSCP[] = {
    {I_RDTSCP, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26268, 95},
    ITEMPLATE_END
};

static const struct itemplate instrux_RESB[] = {
    {I_RESB, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26925, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_RESD[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_RESO[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_RESQ[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_REST[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_RESW[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_RESY[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_RESZ[] = {
    ITEMPLATE_END
};

static const struct itemplate instrux_RET[] = {
    {I_RET, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26730, 25},
    {I_RET, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27615, 96},
    ITEMPLATE_END
};

static const struct itemplate instrux_RETF[] = {
    {I_RETF, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26755, 0},
    {I_RETF, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27619, 70},
    ITEMPLATE_END
};

static const struct itemplate instrux_RETN[] = {
    {I_RETN, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26730, 25},
    {I_RETN, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27615, 96},
    ITEMPLATE_END
};

static const struct itemplate instrux_ROL[] = {
    {I_ROL, 2, {RM_GPR|BITS8,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+27623, 0},
    {I_ROL, 2, {RM_GPR|BITS8,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+27627, 0},
    {I_ROL, 2, {RM_GPR|BITS8,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26273, 38},
    {I_ROL, 2, {RM_GPR|BITS16,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26278, 0},
    {I_ROL, 2, {RM_GPR|BITS16,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26283, 0},
    {I_ROL, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22255, 38},
    {I_ROL, 2, {RM_GPR|BITS32,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26288, 5},
    {I_ROL, 2, {RM_GPR|BITS32,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26293, 5},
    {I_ROL, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22261, 5},
    {I_ROL, 2, {RM_GPR|BITS64,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26298, 7},
    {I_ROL, 2, {RM_GPR|BITS64,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26303, 7},
    {I_ROL, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22267, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_ROR[] = {
    {I_ROR, 2, {RM_GPR|BITS8,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+27631, 0},
    {I_ROR, 2, {RM_GPR|BITS8,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+27635, 0},
    {I_ROR, 2, {RM_GPR|BITS8,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26308, 38},
    {I_ROR, 2, {RM_GPR|BITS16,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26313, 0},
    {I_ROR, 2, {RM_GPR|BITS16,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26318, 0},
    {I_ROR, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22273, 38},
    {I_ROR, 2, {RM_GPR|BITS32,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26323, 5},
    {I_ROR, 2, {RM_GPR|BITS32,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26328, 5},
    {I_ROR, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22279, 5},
    {I_ROR, 2, {RM_GPR|BITS64,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26333, 7},
    {I_ROR, 2, {RM_GPR|BITS64,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26338, 7},
    {I_ROR, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22285, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_RORX[] = {
    {I_RORX, 3, {REG_GPR|BITS32,RM_GPR|BITS32,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9716, 196},
    {I_RORX, 3, {REG_GPR|BITS64,RM_GPR|BITS64,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9724, 197},
    ITEMPLATE_END
};

static const struct itemplate instrux_ROUNDPD[] = {
    {I_ROUNDPD, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6596, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_ROUNDPS[] = {
    {I_ROUNDPS, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6604, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_ROUNDSD[] = {
    {I_ROUNDSD, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6612, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_ROUNDSS[] = {
    {I_ROUNDSS, 3, {XMM_L16,RM_XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+6620, 159},
    ITEMPLATE_END
};

static const struct itemplate instrux_RSDC[] = {
    {I_RSDC, 2, {REG_SREG,MEMORY|BITS80,0,0,0}, NO_DECORATOR, nasm_bytecodes+23690, 97},
    ITEMPLATE_END
};

static const struct itemplate instrux_RSLDT[] = {
    {I_RSLDT, 1, {MEMORY|BITS80,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26343, 97},
    ITEMPLATE_END
};

static const struct itemplate instrux_RSM[] = {
    {I_RSM, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27639, 98},
    ITEMPLATE_END
};

static const struct itemplate instrux_RSQRTPS[] = {
    {I_RSQRTPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22813, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_RSQRTSS[] = {
    {I_RSQRTSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22819, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_RSTS[] = {
    {I_RSTS, 1, {MEMORY|BITS80,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26348, 97},
    ITEMPLATE_END
};

static const struct itemplate instrux_SAHF[] = {
    {I_SAHF, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+6065, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_SAL[] = {
    {I_SAL, 2, {RM_GPR|BITS8,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+27643, 0},
    {I_SAL, 2, {RM_GPR|BITS8,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+27647, 0},
    {I_SAL, 2, {RM_GPR|BITS8,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26353, 38},
    {I_SAL, 2, {RM_GPR|BITS16,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26358, 0},
    {I_SAL, 2, {RM_GPR|BITS16,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26363, 0},
    {I_SAL, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22291, 38},
    {I_SAL, 2, {RM_GPR|BITS32,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26368, 5},
    {I_SAL, 2, {RM_GPR|BITS32,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26373, 5},
    {I_SAL, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22297, 5},
    {I_SAL, 2, {RM_GPR|BITS64,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26378, 7},
    {I_SAL, 2, {RM_GPR|BITS64,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26383, 7},
    {I_SAL, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22303, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_SALC[] = {
    {I_SALC, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26775, 88},
    ITEMPLATE_END
};

static const struct itemplate instrux_SAR[] = {
    {I_SAR, 2, {RM_GPR|BITS8,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+27651, 0},
    {I_SAR, 2, {RM_GPR|BITS8,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+27655, 0},
    {I_SAR, 2, {RM_GPR|BITS8,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26388, 38},
    {I_SAR, 2, {RM_GPR|BITS16,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26393, 0},
    {I_SAR, 2, {RM_GPR|BITS16,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26398, 0},
    {I_SAR, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22309, 38},
    {I_SAR, 2, {RM_GPR|BITS32,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26403, 5},
    {I_SAR, 2, {RM_GPR|BITS32,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26408, 5},
    {I_SAR, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22315, 5},
    {I_SAR, 2, {RM_GPR|BITS64,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26413, 7},
    {I_SAR, 2, {RM_GPR|BITS64,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26418, 7},
    {I_SAR, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22321, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_SARX[] = {
    {I_SARX, 3, {REG_GPR|BITS32,RM_GPR|BITS32,REG_GPR|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+21218, 196},
    {I_SARX, 3, {REG_GPR|BITS64,RM_GPR|BITS64,REG_GPR|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+21225, 197},
    ITEMPLATE_END
};

static const struct itemplate instrux_SBB[] = {
    {I_SBB, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26423, 3},
    {I_SBB, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26424, 0},
    {I_SBB, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22327, 3},
    {I_SBB, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22328, 0},
    {I_SBB, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22333, 4},
    {I_SBB, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22334, 5},
    {I_SBB, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22339, 6},
    {I_SBB, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22340, 7},
    {I_SBB, 2, {REG_GPR|BITS8,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+14907, 8},
    {I_SBB, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+14907, 0},
    {I_SBB, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26428, 8},
    {I_SBB, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+26428, 0},
    {I_SBB, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26433, 9},
    {I_SBB, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+26433, 5},
    {I_SBB, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26438, 10},
    {I_SBB, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+26438, 7},
    {I_SBB, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+13399, 11},
    {I_SBB, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+13406, 12},
    {I_SBB, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+13413, 13},
    {I_SBB, 2, {REG_AL,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+27659, 8},
    {I_SBB, 2, {REG_AX,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13400, 8},
    {I_SBB, 2, {REG_AX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26443, 8},
    {I_SBB, 2, {REG_EAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13407, 9},
    {I_SBB, 2, {REG_EAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26448, 9},
    {I_SBB, 2, {REG_RAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13414, 10},
    {I_SBB, 2, {REG_RAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26453, 10},
    {I_SBB, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+22345, 3},
    {I_SBB, 2, {RM_GPR|BITS16,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13399, 3},
    {I_SBB, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13420, 3},
    {I_SBB, 2, {RM_GPR|BITS32,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13406, 4},
    {I_SBB, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13427, 4},
    {I_SBB, 2, {RM_GPR|BITS64,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13413, 6},
    {I_SBB, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13434, 6},
    {I_SBB, 2, {MEMORY,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22345, 3},
    {I_SBB, 2, {MEMORY,SBYTEWORD|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13399, 3},
    {I_SBB, 2, {MEMORY,IMMEDIATE|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13420, 3},
    {I_SBB, 2, {MEMORY,SBYTEDWORD|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13406, 4},
    {I_SBB, 2, {MEMORY,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13427, 4},
    {I_SBB, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+22351, 14},
    ITEMPLATE_END
};

static const struct itemplate instrux_SCASB[] = {
    {I_SCASB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27663, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_SCASD[] = {
    {I_SCASD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26458, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_SCASQ[] = {
    {I_SCASQ, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26463, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_SCASW[] = {
    {I_SCASW, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26468, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_SFENCE[] = {
    {I_SFENCE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22357, 58},
    {I_SFENCE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22357, 126},
    ITEMPLATE_END
};

static const struct itemplate instrux_SGDT[] = {
    {I_SGDT, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26473, 99},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHA1MSG1[] = {
    {I_SHA1MSG1, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+23869, 212},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHA1MSG2[] = {
    {I_SHA1MSG2, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+23875, 212},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHA1NEXTE[] = {
    {I_SHA1NEXTE, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+23863, 212},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHA1RNDS4[] = {
    {I_SHA1RNDS4, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+21414, 212},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHA256MSG1[] = {
    {I_SHA256MSG1, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+23887, 212},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHA256MSG2[] = {
    {I_SHA256MSG2, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+23893, 212},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHA256RNDS2[] = {
    {I_SHA256RNDS2, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM0,0,0}, NO_DECORATOR, nasm_bytecodes+23881, 212},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHL[] = {
    {I_SHL, 2, {RM_GPR|BITS8,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+27643, 0},
    {I_SHL, 2, {RM_GPR|BITS8,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+27647, 0},
    {I_SHL, 2, {RM_GPR|BITS8,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26353, 38},
    {I_SHL, 2, {RM_GPR|BITS16,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26358, 0},
    {I_SHL, 2, {RM_GPR|BITS16,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26363, 0},
    {I_SHL, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22291, 38},
    {I_SHL, 2, {RM_GPR|BITS32,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26368, 5},
    {I_SHL, 2, {RM_GPR|BITS32,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26373, 5},
    {I_SHL, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22297, 5},
    {I_SHL, 2, {RM_GPR|BITS64,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26378, 7},
    {I_SHL, 2, {RM_GPR|BITS64,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26383, 7},
    {I_SHL, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22303, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHLD[] = {
    {I_SHLD, 3, {MEMORY,REG_GPR|BITS16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13441, 100},
    {I_SHLD, 3, {REG_GPR|BITS16,REG_GPR|BITS16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13441, 100},
    {I_SHLD, 3, {MEMORY,REG_GPR|BITS32,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13448, 100},
    {I_SHLD, 3, {REG_GPR|BITS32,REG_GPR|BITS32,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13448, 100},
    {I_SHLD, 3, {MEMORY,REG_GPR|BITS64,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13455, 101},
    {I_SHLD, 3, {REG_GPR|BITS64,REG_GPR|BITS64,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13455, 101},
    {I_SHLD, 3, {MEMORY,REG_GPR|BITS16,REG_CL,0,0}, NO_DECORATOR, nasm_bytecodes+22363, 9},
    {I_SHLD, 3, {REG_GPR|BITS16,REG_GPR|BITS16,REG_CL,0,0}, NO_DECORATOR, nasm_bytecodes+22363, 5},
    {I_SHLD, 3, {MEMORY,REG_GPR|BITS32,REG_CL,0,0}, NO_DECORATOR, nasm_bytecodes+22369, 9},
    {I_SHLD, 3, {REG_GPR|BITS32,REG_GPR|BITS32,REG_CL,0,0}, NO_DECORATOR, nasm_bytecodes+22369, 5},
    {I_SHLD, 3, {MEMORY,REG_GPR|BITS64,REG_CL,0,0}, NO_DECORATOR, nasm_bytecodes+22375, 10},
    {I_SHLD, 3, {REG_GPR|BITS64,REG_GPR|BITS64,REG_CL,0,0}, NO_DECORATOR, nasm_bytecodes+22375, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHLX[] = {
    {I_SHLX, 3, {REG_GPR|BITS32,RM_GPR|BITS32,REG_GPR|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+21232, 196},
    {I_SHLX, 3, {REG_GPR|BITS64,RM_GPR|BITS64,REG_GPR|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+21239, 197},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHR[] = {
    {I_SHR, 2, {RM_GPR|BITS8,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+27667, 0},
    {I_SHR, 2, {RM_GPR|BITS8,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+27671, 0},
    {I_SHR, 2, {RM_GPR|BITS8,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26478, 38},
    {I_SHR, 2, {RM_GPR|BITS16,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26483, 0},
    {I_SHR, 2, {RM_GPR|BITS16,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26488, 0},
    {I_SHR, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22381, 38},
    {I_SHR, 2, {RM_GPR|BITS32,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26493, 5},
    {I_SHR, 2, {RM_GPR|BITS32,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26498, 5},
    {I_SHR, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22387, 5},
    {I_SHR, 2, {RM_GPR|BITS64,UNITY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26503, 7},
    {I_SHR, 2, {RM_GPR|BITS64,REG_CL,0,0,0}, NO_DECORATOR, nasm_bytecodes+26508, 7},
    {I_SHR, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22393, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHRD[] = {
    {I_SHRD, 3, {MEMORY,REG_GPR|BITS16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13462, 100},
    {I_SHRD, 3, {REG_GPR|BITS16,REG_GPR|BITS16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13462, 100},
    {I_SHRD, 3, {MEMORY,REG_GPR|BITS32,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13469, 100},
    {I_SHRD, 3, {REG_GPR|BITS32,REG_GPR|BITS32,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13469, 100},
    {I_SHRD, 3, {MEMORY,REG_GPR|BITS64,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13476, 101},
    {I_SHRD, 3, {REG_GPR|BITS64,REG_GPR|BITS64,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+13476, 101},
    {I_SHRD, 3, {MEMORY,REG_GPR|BITS16,REG_CL,0,0}, NO_DECORATOR, nasm_bytecodes+22399, 9},
    {I_SHRD, 3, {REG_GPR|BITS16,REG_GPR|BITS16,REG_CL,0,0}, NO_DECORATOR, nasm_bytecodes+22399, 5},
    {I_SHRD, 3, {MEMORY,REG_GPR|BITS32,REG_CL,0,0}, NO_DECORATOR, nasm_bytecodes+22405, 9},
    {I_SHRD, 3, {REG_GPR|BITS32,REG_GPR|BITS32,REG_CL,0,0}, NO_DECORATOR, nasm_bytecodes+22405, 5},
    {I_SHRD, 3, {MEMORY,REG_GPR|BITS64,REG_CL,0,0}, NO_DECORATOR, nasm_bytecodes+22411, 10},
    {I_SHRD, 3, {REG_GPR|BITS64,REG_GPR|BITS64,REG_CL,0,0}, NO_DECORATOR, nasm_bytecodes+22411, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHRX[] = {
    {I_SHRX, 3, {REG_GPR|BITS32,RM_GPR|BITS32,REG_GPR|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+21246, 196},
    {I_SHRX, 3, {REG_GPR|BITS64,RM_GPR|BITS64,REG_GPR|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+21253, 197},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHUFPD[] = {
    {I_SHUFPD, 3, {XMM_L16,XMM_L16,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+14043, 139},
    {I_SHUFPD, 3, {XMM_L16,MEMORY,IMMEDIATE,0,0}, NO_DECORATOR, nasm_bytecodes+14043, 145},
    ITEMPLATE_END
};

static const struct itemplate instrux_SHUFPS[] = {
    {I_SHUFPS, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+13714, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_SIDT[] = {
    {I_SIDT, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26513, 99},
    ITEMPLATE_END
};

static const struct itemplate instrux_SKINIT[] = {
    {I_SKINIT, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26518, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_SLDT[] = {
    {I_SLDT, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22436, 99},
    {I_SLDT, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22436, 99},
    {I_SLDT, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22417, 99},
    {I_SLDT, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22423, 5},
    {I_SLDT, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22429, 7},
    {I_SLDT, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22435, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_SLWPCB[] = {
    {I_SLWPCB, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18740, 184},
    {I_SLWPCB, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18747, 185},
    ITEMPLATE_END
};

static const struct itemplate instrux_SMI[] = {
    {I_SMI, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27799, 49},
    ITEMPLATE_END
};

static const struct itemplate instrux_SMINT[] = {
    {I_SMINT, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27675, 36},
    ITEMPLATE_END
};

static const struct itemplate instrux_SMINTOLD[] = {
    {I_SMINTOLD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27679, 102},
    ITEMPLATE_END
};

static const struct itemplate instrux_SMSW[] = {
    {I_SMSW, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22448, 99},
    {I_SMSW, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22448, 99},
    {I_SMSW, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22441, 99},
    {I_SMSW, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22447, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_SQRTPD[] = {
    {I_SQRTPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23551, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_SQRTPS[] = {
    {I_SQRTPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22825, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_SQRTSD[] = {
    {I_SQRTSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23557, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_SQRTSS[] = {
    {I_SQRTSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22831, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_STAC[] = {
    {I_STAC, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26753, 183},
    ITEMPLATE_END
};

static const struct itemplate instrux_STC[] = {
    {I_STC, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26270, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_STD[] = {
    {I_STD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27826, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_STGI[] = {
    {I_STGI, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26698, 148},
    ITEMPLATE_END
};

static const struct itemplate instrux_STI[] = {
    {I_STI, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27829, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_STMXCSR[] = {
    {I_STMXCSR, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22837, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_STOSB[] = {
    {I_STOSB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+6169, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_STOSD[] = {
    {I_STOSD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27683, 5},
    ITEMPLATE_END
};

static const struct itemplate instrux_STOSQ[] = {
    {I_STOSQ, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27687, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_STOSW[] = {
    {I_STOSW, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27691, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_STR[] = {
    {I_STR, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22466, 61},
    {I_STR, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22466, 61},
    {I_STR, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22453, 61},
    {I_STR, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22459, 62},
    {I_STR, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22465, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_SUB[] = {
    {I_SUB, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26523, 3},
    {I_SUB, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26524, 0},
    {I_SUB, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22471, 3},
    {I_SUB, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22472, 0},
    {I_SUB, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22477, 4},
    {I_SUB, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22478, 5},
    {I_SUB, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22483, 6},
    {I_SUB, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22484, 7},
    {I_SUB, 2, {REG_GPR|BITS8,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+20647, 8},
    {I_SUB, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+20647, 0},
    {I_SUB, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26528, 8},
    {I_SUB, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+26528, 0},
    {I_SUB, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26533, 9},
    {I_SUB, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+26533, 5},
    {I_SUB, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26538, 10},
    {I_SUB, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+26538, 7},
    {I_SUB, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+13483, 11},
    {I_SUB, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+13490, 12},
    {I_SUB, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+13497, 13},
    {I_SUB, 2, {REG_AL,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+27695, 8},
    {I_SUB, 2, {REG_AX,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13484, 8},
    {I_SUB, 2, {REG_AX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26543, 8},
    {I_SUB, 2, {REG_EAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13491, 9},
    {I_SUB, 2, {REG_EAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26548, 9},
    {I_SUB, 2, {REG_RAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13498, 10},
    {I_SUB, 2, {REG_RAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26553, 10},
    {I_SUB, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+22489, 3},
    {I_SUB, 2, {RM_GPR|BITS16,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13483, 3},
    {I_SUB, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13504, 3},
    {I_SUB, 2, {RM_GPR|BITS32,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13490, 4},
    {I_SUB, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13511, 4},
    {I_SUB, 2, {RM_GPR|BITS64,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13497, 6},
    {I_SUB, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13518, 6},
    {I_SUB, 2, {MEMORY,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22489, 3},
    {I_SUB, 2, {MEMORY,SBYTEWORD|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13483, 3},
    {I_SUB, 2, {MEMORY,IMMEDIATE|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13504, 3},
    {I_SUB, 2, {MEMORY,SBYTEDWORD|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13490, 4},
    {I_SUB, 2, {MEMORY,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13511, 4},
    {I_SUB, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+22495, 14},
    ITEMPLATE_END
};

static const struct itemplate instrux_SUBPD[] = {
    {I_SUBPD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23563, 132},
    ITEMPLATE_END
};

static const struct itemplate instrux_SUBPS[] = {
    {I_SUBPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22843, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_SUBSD[] = {
    {I_SUBSD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23569, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_SUBSS[] = {
    {I_SUBSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22849, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_SVDC[] = {
    {I_SVDC, 2, {MEMORY|BITS80,REG_SREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+14052, 97},
    ITEMPLATE_END
};

static const struct itemplate instrux_SVLDT[] = {
    {I_SVLDT, 1, {MEMORY|BITS80,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26558, 97},
    ITEMPLATE_END
};

static const struct itemplate instrux_SVTS[] = {
    {I_SVTS, 1, {MEMORY|BITS80,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26563, 97},
    ITEMPLATE_END
};

static const struct itemplate instrux_SWAPGS[] = {
    {I_SWAPGS, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26568, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_SYSCALL[] = {
    {I_SYSCALL, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27423, 103},
    ITEMPLATE_END
};

static const struct itemplate instrux_SYSENTER[] = {
    {I_SYSENTER, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27699, 84},
    ITEMPLATE_END
};

static const struct itemplate instrux_SYSEXIT[] = {
    {I_SYSEXIT, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27703, 104},
    ITEMPLATE_END
};

static const struct itemplate instrux_SYSRET[] = {
    {I_SYSRET, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27419, 105},
    ITEMPLATE_END
};

static const struct itemplate instrux_T1MSKC[] = {
    {I_T1MSKC, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21295, 194},
    {I_T1MSKC, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21302, 195},
    ITEMPLATE_END
};

static const struct itemplate instrux_TEST[] = {
    {I_TEST, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+27707, 8},
    {I_TEST, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+27707, 0},
    {I_TEST, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+26573, 8},
    {I_TEST, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+26573, 0},
    {I_TEST, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+26578, 9},
    {I_TEST, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+26578, 5},
    {I_TEST, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+26583, 10},
    {I_TEST, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+26583, 7},
    {I_TEST, 2, {REG_GPR|BITS8,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+27711, 8},
    {I_TEST, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26588, 8},
    {I_TEST, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26593, 9},
    {I_TEST, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26598, 10},
    {I_TEST, 2, {REG_AL,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+27715, 8},
    {I_TEST, 2, {REG_AX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26603, 8},
    {I_TEST, 2, {REG_EAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26608, 9},
    {I_TEST, 2, {REG_RAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26613, 10},
    {I_TEST, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26618, 8},
    {I_TEST, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+22501, 8},
    {I_TEST, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+22507, 9},
    {I_TEST, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+22513, 10},
    {I_TEST, 2, {MEMORY,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26618, 8},
    {I_TEST, 2, {MEMORY,IMMEDIATE|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22501, 8},
    {I_TEST, 2, {MEMORY,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22507, 9},
    ITEMPLATE_END
};

static const struct itemplate instrux_TZCNT[] = {
    {I_TZCNT, 2, {REG_GPR|BITS16,RM_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+21260, 198},
    {I_TZCNT, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21267, 198},
    {I_TZCNT, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21274, 199},
    ITEMPLATE_END
};

static const struct itemplate instrux_TZMSK[] = {
    {I_TZMSK, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+21281, 194},
    {I_TZMSK, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+21288, 195},
    ITEMPLATE_END
};

static const struct itemplate instrux_UCOMISD[] = {
    {I_UCOMISD, 2, {XMM_L16,RM_XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+23575, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_UCOMISS[] = {
    {I_UCOMISS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22855, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_UD0[] = {
    {I_UD0, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27719, 106},
    ITEMPLATE_END
};

static const struct itemplate instrux_UD1[] = {
    {I_UD1, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27723, 106},
    ITEMPLATE_END
};

static const struct itemplate instrux_UD2[] = {
    {I_UD2, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27727, 38},
    ITEMPLATE_END
};

static const struct itemplate instrux_UD2A[] = {
    {I_UD2A, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27727, 38},
    ITEMPLATE_END
};

static const struct itemplate instrux_UD2B[] = {
    {I_UD2B, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27723, 106},
    ITEMPLATE_END
};

static const struct itemplate instrux_UMOV[] = {
    {I_UMOV, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22519, 107},
    {I_UMOV, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22519, 49},
    {I_UMOV, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13525, 107},
    {I_UMOV, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13525, 49},
    {I_UMOV, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13532, 107},
    {I_UMOV, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13532, 49},
    {I_UMOV, 2, {REG_GPR|BITS8,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+22525, 107},
    {I_UMOV, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22525, 49},
    {I_UMOV, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+13539, 107},
    {I_UMOV, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13539, 49},
    {I_UMOV, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+13546, 107},
    {I_UMOV, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13546, 49},
    ITEMPLATE_END
};

static const struct itemplate instrux_UNPCKHPD[] = {
    {I_UNPCKHPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+23581, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_UNPCKHPS[] = {
    {I_UNPCKHPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22861, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_UNPCKLPD[] = {
    {I_UNPCKLPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+23587, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_UNPCKLPS[] = {
    {I_UNPCKLPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22867, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_VADDPD[] = {
    {I_VADDPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+14631, 174},
    {I_VADDPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14638, 174},
    {I_VADDPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+14645, 174},
    {I_VADDPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+14652, 174},
    {I_VADDPD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+9732, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VADDPS[] = {
    {I_VADDPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+14659, 174},
    {I_VADDPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14666, 174},
    {I_VADDPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+14673, 174},
    {I_VADDPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+14680, 174},
    {I_VADDPS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+9740, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VADDSD[] = {
    {I_VADDSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+14687, 174},
    {I_VADDSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+14694, 174},
    {I_VADDSD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+9748, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VADDSS[] = {
    {I_VADDSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+14701, 174},
    {I_VADDSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+14708, 174},
    {I_VADDSS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+9756, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VADDSUBPD[] = {
    {I_VADDSUBPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+14715, 174},
    {I_VADDSUBPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14722, 174},
    {I_VADDSUBPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+14729, 174},
    {I_VADDSUBPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+14736, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VADDSUBPS[] = {
    {I_VADDSUBPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+14743, 174},
    {I_VADDSUBPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14750, 174},
    {I_VADDSUBPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+14757, 174},
    {I_VADDSUBPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+14764, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VAESDEC[] = {
    {I_VAESDEC, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+14596, 174},
    {I_VAESDEC, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14603, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VAESDECLAST[] = {
    {I_VAESDECLAST, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+14610, 174},
    {I_VAESDECLAST, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14617, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VAESENC[] = {
    {I_VAESENC, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+14568, 174},
    {I_VAESENC, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14575, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VAESENCLAST[] = {
    {I_VAESENCLAST, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+14582, 174},
    {I_VAESENCLAST, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14589, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VAESIMC[] = {
    {I_VAESIMC, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14624, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VAESKEYGENASSIST[] = {
    {I_VAESKEYGENASSIST, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+6764, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VALIGND[] = {
    {I_VALIGND, 4, {ZMMREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+5136, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VALIGNQ[] = {
    {I_VALIGNQ, 4, {ZMMREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+5145, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VANDNPD[] = {
    {I_VANDNPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+14827, 174},
    {I_VANDNPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14834, 174},
    {I_VANDNPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+14841, 174},
    {I_VANDNPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+14848, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VANDNPS[] = {
    {I_VANDNPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+14855, 174},
    {I_VANDNPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14862, 174},
    {I_VANDNPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+14869, 174},
    {I_VANDNPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+14876, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VANDPD[] = {
    {I_VANDPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+14771, 174},
    {I_VANDPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14778, 174},
    {I_VANDPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+14785, 174},
    {I_VANDPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+14792, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VANDPS[] = {
    {I_VANDPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+14799, 174},
    {I_VANDPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14806, 174},
    {I_VANDPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+14813, 174},
    {I_VANDPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+14820, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBLENDMPD[] = {
    {I_VBLENDMPD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+9764, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBLENDMPS[] = {
    {I_VBLENDMPS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+9772, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBLENDPD[] = {
    {I_VBLENDPD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+6772, 174},
    {I_VBLENDPD, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+6780, 174},
    {I_VBLENDPD, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+6788, 174},
    {I_VBLENDPD, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+6796, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBLENDPS[] = {
    {I_VBLENDPS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+6804, 174},
    {I_VBLENDPS, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+6812, 174},
    {I_VBLENDPS, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+6820, 174},
    {I_VBLENDPS, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+6828, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBLENDVPD[] = {
    {I_VBLENDVPD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+6836, 174},
    {I_VBLENDVPD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+6844, 174},
    {I_VBLENDVPD, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+6852, 174},
    {I_VBLENDVPD, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+6860, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBLENDVPS[] = {
    {I_VBLENDVPS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+6868, 174},
    {I_VBLENDVPS, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+6876, 174},
    {I_VBLENDVPS, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+6884, 174},
    {I_VBLENDVPS, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+6892, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBROADCASTF128[] = {
    {I_VBROADCASTF128, 2, {YMM_L16,MEMORY|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14904, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBROADCASTF32X4[] = {
    {I_VBROADCASTF32X4, 2, {ZMMREG,MEMORY|BITS128,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+9780, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBROADCASTF64X4[] = {
    {I_VBROADCASTF64X4, 2, {ZMMREG,MEMORY|BITS256,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+9788, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBROADCASTI128[] = {
    {I_VBROADCASTI128, 2, {YMM_L16,MEMORY|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20651, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBROADCASTI32X4[] = {
    {I_VBROADCASTI32X4, 2, {ZMMREG,MEMORY|BITS128,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+9796, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBROADCASTI64X4[] = {
    {I_VBROADCASTI64X4, 2, {ZMMREG,MEMORY|BITS256,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+9804, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBROADCASTSD[] = {
    {I_VBROADCASTSD, 2, {YMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+14897, 174},
    {I_VBROADCASTSD, 2, {YMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14897, 187},
    {I_VBROADCASTSD, 2, {ZMMREG,MEMORY|BITS64,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+9812, 200},
    {I_VBROADCASTSD, 2, {ZMMREG,XMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+9820, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VBROADCASTSS[] = {
    {I_VBROADCASTSS, 2, {XMM_L16,MEMORY|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+14883, 174},
    {I_VBROADCASTSS, 2, {YMM_L16,MEMORY|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+14890, 174},
    {I_VBROADCASTSS, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14883, 187},
    {I_VBROADCASTSS, 2, {YMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14890, 187},
    {I_VBROADCASTSS, 2, {ZMMREG,XMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+9828, 200},
    {I_VBROADCASTSS, 2, {ZMMREG,MEMORY|BITS32,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+9836, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQPD[] = {
    {I_VCMPEQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1608, 174},
    {I_VCMPEQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1617, 174},
    {I_VCMPEQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1626, 174},
    {I_VCMPEQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1635, 174},
    {I_VCMPEQPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+0, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQPS[] = {
    {I_VCMPEQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2760, 174},
    {I_VCMPEQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2769, 174},
    {I_VCMPEQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2778, 174},
    {I_VCMPEQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2787, 174},
    {I_VCMPEQPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+320, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQSD[] = {
    {I_VCMPEQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+3894, 174},
    {I_VCMPEQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+3903, 174},
    {I_VCMPEQSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+640, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQSS[] = {
    {I_VCMPEQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4470, 174},
    {I_VCMPEQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4479, 174},
    {I_VCMPEQSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+960, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQ_OSPD[] = {
    {I_VCMPEQ_OSPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1572, 174},
    {I_VCMPEQ_OSPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1581, 174},
    {I_VCMPEQ_OSPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1590, 174},
    {I_VCMPEQ_OSPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1599, 174},
    {I_VCMPEQ_OSPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1572, 174},
    {I_VCMPEQ_OSPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1581, 174},
    {I_VCMPEQ_OSPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1590, 174},
    {I_VCMPEQ_OSPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1599, 174},
    {I_VCMPEQ_OSPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+160, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQ_OSPS[] = {
    {I_VCMPEQ_OSPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2724, 174},
    {I_VCMPEQ_OSPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2733, 174},
    {I_VCMPEQ_OSPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2742, 174},
    {I_VCMPEQ_OSPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2751, 174},
    {I_VCMPEQ_OSPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2724, 174},
    {I_VCMPEQ_OSPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2733, 174},
    {I_VCMPEQ_OSPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2742, 174},
    {I_VCMPEQ_OSPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2751, 174},
    {I_VCMPEQ_OSPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+480, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQ_OSSD[] = {
    {I_VCMPEQ_OSSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+3876, 174},
    {I_VCMPEQ_OSSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+3885, 174},
    {I_VCMPEQ_OSSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+3876, 174},
    {I_VCMPEQ_OSSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+3885, 174},
    {I_VCMPEQ_OSSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+800, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQ_OSSS[] = {
    {I_VCMPEQ_OSSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4452, 174},
    {I_VCMPEQ_OSSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4461, 174},
    {I_VCMPEQ_OSSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4452, 174},
    {I_VCMPEQ_OSSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4461, 174},
    {I_VCMPEQ_OSSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1120, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQ_UQPD[] = {
    {I_VCMPEQ_UQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1896, 174},
    {I_VCMPEQ_UQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1905, 174},
    {I_VCMPEQ_UQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1914, 174},
    {I_VCMPEQ_UQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1923, 174},
    {I_VCMPEQ_UQPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+80, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQ_UQPS[] = {
    {I_VCMPEQ_UQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3048, 174},
    {I_VCMPEQ_UQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3057, 174},
    {I_VCMPEQ_UQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3066, 174},
    {I_VCMPEQ_UQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3075, 174},
    {I_VCMPEQ_UQPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+400, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQ_UQSD[] = {
    {I_VCMPEQ_UQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4038, 174},
    {I_VCMPEQ_UQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4047, 174},
    {I_VCMPEQ_UQSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+720, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQ_UQSS[] = {
    {I_VCMPEQ_UQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4614, 174},
    {I_VCMPEQ_UQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4623, 174},
    {I_VCMPEQ_UQSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1040, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQ_USPD[] = {
    {I_VCMPEQ_USPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2436, 174},
    {I_VCMPEQ_USPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2445, 174},
    {I_VCMPEQ_USPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2454, 174},
    {I_VCMPEQ_USPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2463, 174},
    {I_VCMPEQ_USPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+240, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQ_USPS[] = {
    {I_VCMPEQ_USPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3588, 174},
    {I_VCMPEQ_USPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3597, 174},
    {I_VCMPEQ_USPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3606, 174},
    {I_VCMPEQ_USPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3615, 174},
    {I_VCMPEQ_USPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+560, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQ_USSD[] = {
    {I_VCMPEQ_USSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4308, 174},
    {I_VCMPEQ_USSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4317, 174},
    {I_VCMPEQ_USSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+880, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPEQ_USSS[] = {
    {I_VCMPEQ_USSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4884, 174},
    {I_VCMPEQ_USSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4893, 174},
    {I_VCMPEQ_USSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1200, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPFALSEPD[] = {
    {I_VCMPFALSEPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2004, 174},
    {I_VCMPFALSEPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2013, 174},
    {I_VCMPFALSEPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2022, 174},
    {I_VCMPFALSEPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2031, 174},
    {I_VCMPFALSEPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+110, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPFALSEPS[] = {
    {I_VCMPFALSEPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3156, 174},
    {I_VCMPFALSEPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3165, 174},
    {I_VCMPFALSEPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3174, 174},
    {I_VCMPFALSEPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3183, 174},
    {I_VCMPFALSEPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+430, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPFALSESD[] = {
    {I_VCMPFALSESD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4092, 174},
    {I_VCMPFALSESD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4101, 174},
    {I_VCMPFALSESD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+750, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPFALSESS[] = {
    {I_VCMPFALSESS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4668, 174},
    {I_VCMPFALSESS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4677, 174},
    {I_VCMPFALSESS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1070, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPFALSE_OQPD[] = {
    {I_VCMPFALSE_OQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2004, 174},
    {I_VCMPFALSE_OQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2013, 174},
    {I_VCMPFALSE_OQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2022, 174},
    {I_VCMPFALSE_OQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2031, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPFALSE_OQPS[] = {
    {I_VCMPFALSE_OQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3156, 174},
    {I_VCMPFALSE_OQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3165, 174},
    {I_VCMPFALSE_OQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3174, 174},
    {I_VCMPFALSE_OQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3183, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPFALSE_OQSD[] = {
    {I_VCMPFALSE_OQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4092, 174},
    {I_VCMPFALSE_OQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4101, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPFALSE_OQSS[] = {
    {I_VCMPFALSE_OQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4668, 174},
    {I_VCMPFALSE_OQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4677, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPFALSE_OSPD[] = {
    {I_VCMPFALSE_OSPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2544, 174},
    {I_VCMPFALSE_OSPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2553, 174},
    {I_VCMPFALSE_OSPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2562, 174},
    {I_VCMPFALSE_OSPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2571, 174},
    {I_VCMPFALSE_OSPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+270, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPFALSE_OSPS[] = {
    {I_VCMPFALSE_OSPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3696, 174},
    {I_VCMPFALSE_OSPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3705, 174},
    {I_VCMPFALSE_OSPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3714, 174},
    {I_VCMPFALSE_OSPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3723, 174},
    {I_VCMPFALSE_OSPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+590, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPFALSE_OSSD[] = {
    {I_VCMPFALSE_OSSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4362, 174},
    {I_VCMPFALSE_OSSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4371, 174},
    {I_VCMPFALSE_OSSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+910, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPFALSE_OSSS[] = {
    {I_VCMPFALSE_OSSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4938, 174},
    {I_VCMPFALSE_OSSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4947, 174},
    {I_VCMPFALSE_OSSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1230, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGEPD[] = {
    {I_VCMPGEPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2076, 174},
    {I_VCMPGEPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2085, 174},
    {I_VCMPGEPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2094, 174},
    {I_VCMPGEPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2103, 174},
    {I_VCMPGEPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+130, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGEPS[] = {
    {I_VCMPGEPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3228, 174},
    {I_VCMPGEPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3237, 174},
    {I_VCMPGEPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3246, 174},
    {I_VCMPGEPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3255, 174},
    {I_VCMPGEPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+450, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGESD[] = {
    {I_VCMPGESD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4128, 174},
    {I_VCMPGESD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4137, 174},
    {I_VCMPGESD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+770, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGESS[] = {
    {I_VCMPGESS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4704, 174},
    {I_VCMPGESS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4713, 174},
    {I_VCMPGESS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1090, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGE_OQPD[] = {
    {I_VCMPGE_OQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2616, 174},
    {I_VCMPGE_OQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2625, 174},
    {I_VCMPGE_OQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2634, 174},
    {I_VCMPGE_OQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2643, 174},
    {I_VCMPGE_OQPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+290, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGE_OQPS[] = {
    {I_VCMPGE_OQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3768, 174},
    {I_VCMPGE_OQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3777, 174},
    {I_VCMPGE_OQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3786, 174},
    {I_VCMPGE_OQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3795, 174},
    {I_VCMPGE_OQPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+610, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGE_OQSD[] = {
    {I_VCMPGE_OQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4398, 174},
    {I_VCMPGE_OQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4407, 174},
    {I_VCMPGE_OQSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+930, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGE_OQSS[] = {
    {I_VCMPGE_OQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4974, 174},
    {I_VCMPGE_OQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4983, 174},
    {I_VCMPGE_OQSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1250, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGE_OSPD[] = {
    {I_VCMPGE_OSPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2076, 174},
    {I_VCMPGE_OSPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2085, 174},
    {I_VCMPGE_OSPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2094, 174},
    {I_VCMPGE_OSPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2103, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGE_OSPS[] = {
    {I_VCMPGE_OSPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3228, 174},
    {I_VCMPGE_OSPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3237, 174},
    {I_VCMPGE_OSPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3246, 174},
    {I_VCMPGE_OSPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3255, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGE_OSSD[] = {
    {I_VCMPGE_OSSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4128, 174},
    {I_VCMPGE_OSSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4137, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGE_OSSS[] = {
    {I_VCMPGE_OSSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4704, 174},
    {I_VCMPGE_OSSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4713, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGTPD[] = {
    {I_VCMPGTPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2112, 174},
    {I_VCMPGTPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2121, 174},
    {I_VCMPGTPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2130, 174},
    {I_VCMPGTPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2139, 174},
    {I_VCMPGTPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+140, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGTPS[] = {
    {I_VCMPGTPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3264, 174},
    {I_VCMPGTPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3273, 174},
    {I_VCMPGTPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3282, 174},
    {I_VCMPGTPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3291, 174},
    {I_VCMPGTPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+460, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGTSD[] = {
    {I_VCMPGTSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4146, 174},
    {I_VCMPGTSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4155, 174},
    {I_VCMPGTSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+780, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGTSS[] = {
    {I_VCMPGTSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4722, 174},
    {I_VCMPGTSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4731, 174},
    {I_VCMPGTSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1100, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGT_OQPD[] = {
    {I_VCMPGT_OQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2652, 174},
    {I_VCMPGT_OQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2661, 174},
    {I_VCMPGT_OQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2670, 174},
    {I_VCMPGT_OQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2679, 174},
    {I_VCMPGT_OQPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+300, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGT_OQPS[] = {
    {I_VCMPGT_OQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3804, 174},
    {I_VCMPGT_OQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3813, 174},
    {I_VCMPGT_OQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3822, 174},
    {I_VCMPGT_OQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3831, 174},
    {I_VCMPGT_OQPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+620, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGT_OQSD[] = {
    {I_VCMPGT_OQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4416, 174},
    {I_VCMPGT_OQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4425, 174},
    {I_VCMPGT_OQSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+940, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGT_OQSS[] = {
    {I_VCMPGT_OQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4992, 174},
    {I_VCMPGT_OQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+5001, 174},
    {I_VCMPGT_OQSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1260, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGT_OSPD[] = {
    {I_VCMPGT_OSPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2112, 174},
    {I_VCMPGT_OSPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2121, 174},
    {I_VCMPGT_OSPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2130, 174},
    {I_VCMPGT_OSPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2139, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGT_OSPS[] = {
    {I_VCMPGT_OSPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3264, 174},
    {I_VCMPGT_OSPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3273, 174},
    {I_VCMPGT_OSPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3282, 174},
    {I_VCMPGT_OSPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3291, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGT_OSSD[] = {
    {I_VCMPGT_OSSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4146, 174},
    {I_VCMPGT_OSSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4155, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPGT_OSSS[] = {
    {I_VCMPGT_OSSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4722, 174},
    {I_VCMPGT_OSSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4731, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLEPD[] = {
    {I_VCMPLEPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1680, 174},
    {I_VCMPLEPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1689, 174},
    {I_VCMPLEPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1698, 174},
    {I_VCMPLEPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1707, 174},
    {I_VCMPLEPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+20, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLEPS[] = {
    {I_VCMPLEPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2832, 174},
    {I_VCMPLEPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2841, 174},
    {I_VCMPLEPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2850, 174},
    {I_VCMPLEPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2859, 174},
    {I_VCMPLEPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+340, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLESD[] = {
    {I_VCMPLESD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+3930, 174},
    {I_VCMPLESD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+3939, 174},
    {I_VCMPLESD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+660, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLESS[] = {
    {I_VCMPLESS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4506, 174},
    {I_VCMPLESS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4515, 174},
    {I_VCMPLESS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+980, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLE_OQPD[] = {
    {I_VCMPLE_OQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2220, 174},
    {I_VCMPLE_OQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2229, 174},
    {I_VCMPLE_OQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2238, 174},
    {I_VCMPLE_OQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2247, 174},
    {I_VCMPLE_OQPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+180, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLE_OQPS[] = {
    {I_VCMPLE_OQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3372, 174},
    {I_VCMPLE_OQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3381, 174},
    {I_VCMPLE_OQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3390, 174},
    {I_VCMPLE_OQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3399, 174},
    {I_VCMPLE_OQPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+500, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLE_OQSD[] = {
    {I_VCMPLE_OQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4200, 174},
    {I_VCMPLE_OQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4209, 174},
    {I_VCMPLE_OQSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+820, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLE_OQSS[] = {
    {I_VCMPLE_OQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4776, 174},
    {I_VCMPLE_OQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4785, 174},
    {I_VCMPLE_OQSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1140, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLE_OSPD[] = {
    {I_VCMPLE_OSPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1680, 174},
    {I_VCMPLE_OSPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1689, 174},
    {I_VCMPLE_OSPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1698, 174},
    {I_VCMPLE_OSPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1707, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLE_OSPS[] = {
    {I_VCMPLE_OSPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2832, 174},
    {I_VCMPLE_OSPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2841, 174},
    {I_VCMPLE_OSPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2850, 174},
    {I_VCMPLE_OSPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2859, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLE_OSSD[] = {
    {I_VCMPLE_OSSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+3930, 174},
    {I_VCMPLE_OSSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+3939, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLE_OSSS[] = {
    {I_VCMPLE_OSSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4506, 174},
    {I_VCMPLE_OSSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4515, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLTPD[] = {
    {I_VCMPLTPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1644, 174},
    {I_VCMPLTPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1653, 174},
    {I_VCMPLTPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1662, 174},
    {I_VCMPLTPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1671, 174},
    {I_VCMPLTPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+10, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLTPS[] = {
    {I_VCMPLTPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2796, 174},
    {I_VCMPLTPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2805, 174},
    {I_VCMPLTPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2814, 174},
    {I_VCMPLTPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2823, 174},
    {I_VCMPLTPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+330, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLTSD[] = {
    {I_VCMPLTSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+3912, 174},
    {I_VCMPLTSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+3921, 174},
    {I_VCMPLTSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+650, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLTSS[] = {
    {I_VCMPLTSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4488, 174},
    {I_VCMPLTSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4497, 174},
    {I_VCMPLTSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+970, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLT_OQPD[] = {
    {I_VCMPLT_OQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2184, 174},
    {I_VCMPLT_OQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2193, 174},
    {I_VCMPLT_OQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2202, 174},
    {I_VCMPLT_OQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2211, 174},
    {I_VCMPLT_OQPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+170, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLT_OQPS[] = {
    {I_VCMPLT_OQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3336, 174},
    {I_VCMPLT_OQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3345, 174},
    {I_VCMPLT_OQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3354, 174},
    {I_VCMPLT_OQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3363, 174},
    {I_VCMPLT_OQPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+490, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLT_OQSD[] = {
    {I_VCMPLT_OQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4182, 174},
    {I_VCMPLT_OQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4191, 174},
    {I_VCMPLT_OQSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+810, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLT_OQSS[] = {
    {I_VCMPLT_OQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4758, 174},
    {I_VCMPLT_OQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4767, 174},
    {I_VCMPLT_OQSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1130, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLT_OSPD[] = {
    {I_VCMPLT_OSPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1644, 174},
    {I_VCMPLT_OSPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1653, 174},
    {I_VCMPLT_OSPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1662, 174},
    {I_VCMPLT_OSPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1671, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLT_OSPS[] = {
    {I_VCMPLT_OSPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2796, 174},
    {I_VCMPLT_OSPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2805, 174},
    {I_VCMPLT_OSPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2814, 174},
    {I_VCMPLT_OSPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2823, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLT_OSSD[] = {
    {I_VCMPLT_OSSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+3912, 174},
    {I_VCMPLT_OSSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+3921, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPLT_OSSS[] = {
    {I_VCMPLT_OSSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4488, 174},
    {I_VCMPLT_OSSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4497, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQPD[] = {
    {I_VCMPNEQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1752, 174},
    {I_VCMPNEQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1761, 174},
    {I_VCMPNEQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1770, 174},
    {I_VCMPNEQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1779, 174},
    {I_VCMPNEQPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+40, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQPS[] = {
    {I_VCMPNEQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2904, 174},
    {I_VCMPNEQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2913, 174},
    {I_VCMPNEQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2922, 174},
    {I_VCMPNEQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2931, 174},
    {I_VCMPNEQPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+360, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQSD[] = {
    {I_VCMPNEQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+3966, 174},
    {I_VCMPNEQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+3975, 174},
    {I_VCMPNEQSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+680, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQSS[] = {
    {I_VCMPNEQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4542, 174},
    {I_VCMPNEQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4551, 174},
    {I_VCMPNEQSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1000, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_OQPD[] = {
    {I_VCMPNEQ_OQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2040, 174},
    {I_VCMPNEQ_OQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2049, 174},
    {I_VCMPNEQ_OQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2058, 174},
    {I_VCMPNEQ_OQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2067, 174},
    {I_VCMPNEQ_OQPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+120, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_OQPS[] = {
    {I_VCMPNEQ_OQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3192, 174},
    {I_VCMPNEQ_OQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3201, 174},
    {I_VCMPNEQ_OQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3210, 174},
    {I_VCMPNEQ_OQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3219, 174},
    {I_VCMPNEQ_OQPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+440, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_OQSD[] = {
    {I_VCMPNEQ_OQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4110, 174},
    {I_VCMPNEQ_OQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4119, 174},
    {I_VCMPNEQ_OQSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+760, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_OQSS[] = {
    {I_VCMPNEQ_OQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4686, 174},
    {I_VCMPNEQ_OQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4695, 174},
    {I_VCMPNEQ_OQSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1080, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_OSPD[] = {
    {I_VCMPNEQ_OSPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2580, 174},
    {I_VCMPNEQ_OSPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2589, 174},
    {I_VCMPNEQ_OSPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2598, 174},
    {I_VCMPNEQ_OSPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2607, 174},
    {I_VCMPNEQ_OSPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+280, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_OSPS[] = {
    {I_VCMPNEQ_OSPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3732, 174},
    {I_VCMPNEQ_OSPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3741, 174},
    {I_VCMPNEQ_OSPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3750, 174},
    {I_VCMPNEQ_OSPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3759, 174},
    {I_VCMPNEQ_OSPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+600, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_OSSD[] = {
    {I_VCMPNEQ_OSSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4380, 174},
    {I_VCMPNEQ_OSSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4389, 174},
    {I_VCMPNEQ_OSSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+920, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_OSSS[] = {
    {I_VCMPNEQ_OSSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4956, 174},
    {I_VCMPNEQ_OSSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4965, 174},
    {I_VCMPNEQ_OSSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1240, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_UQPD[] = {
    {I_VCMPNEQ_UQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1752, 174},
    {I_VCMPNEQ_UQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1761, 174},
    {I_VCMPNEQ_UQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1770, 174},
    {I_VCMPNEQ_UQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1779, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_UQPS[] = {
    {I_VCMPNEQ_UQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2904, 174},
    {I_VCMPNEQ_UQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2913, 174},
    {I_VCMPNEQ_UQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2922, 174},
    {I_VCMPNEQ_UQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2931, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_UQSD[] = {
    {I_VCMPNEQ_UQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+3966, 174},
    {I_VCMPNEQ_UQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+3975, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_UQSS[] = {
    {I_VCMPNEQ_UQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4542, 174},
    {I_VCMPNEQ_UQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4551, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_USPD[] = {
    {I_VCMPNEQ_USPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2292, 174},
    {I_VCMPNEQ_USPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2301, 174},
    {I_VCMPNEQ_USPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2310, 174},
    {I_VCMPNEQ_USPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2319, 174},
    {I_VCMPNEQ_USPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+200, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_USPS[] = {
    {I_VCMPNEQ_USPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3444, 174},
    {I_VCMPNEQ_USPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3453, 174},
    {I_VCMPNEQ_USPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3462, 174},
    {I_VCMPNEQ_USPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3471, 174},
    {I_VCMPNEQ_USPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+520, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_USSD[] = {
    {I_VCMPNEQ_USSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4236, 174},
    {I_VCMPNEQ_USSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4245, 174},
    {I_VCMPNEQ_USSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+840, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNEQ_USSS[] = {
    {I_VCMPNEQ_USSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4812, 174},
    {I_VCMPNEQ_USSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4821, 174},
    {I_VCMPNEQ_USSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1160, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGEPD[] = {
    {I_VCMPNGEPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1932, 174},
    {I_VCMPNGEPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1941, 174},
    {I_VCMPNGEPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1950, 174},
    {I_VCMPNGEPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1959, 174},
    {I_VCMPNGEPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+90, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGEPS[] = {
    {I_VCMPNGEPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3084, 174},
    {I_VCMPNGEPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3093, 174},
    {I_VCMPNGEPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3102, 174},
    {I_VCMPNGEPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3111, 174},
    {I_VCMPNGEPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+410, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGESD[] = {
    {I_VCMPNGESD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4056, 174},
    {I_VCMPNGESD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4065, 174},
    {I_VCMPNGESD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+730, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGESS[] = {
    {I_VCMPNGESS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4632, 174},
    {I_VCMPNGESS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4641, 174},
    {I_VCMPNGESS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1050, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGE_UQPD[] = {
    {I_VCMPNGE_UQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2472, 174},
    {I_VCMPNGE_UQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2481, 174},
    {I_VCMPNGE_UQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2490, 174},
    {I_VCMPNGE_UQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2499, 174},
    {I_VCMPNGE_UQPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+250, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGE_UQPS[] = {
    {I_VCMPNGE_UQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3624, 174},
    {I_VCMPNGE_UQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3633, 174},
    {I_VCMPNGE_UQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3642, 174},
    {I_VCMPNGE_UQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3651, 174},
    {I_VCMPNGE_UQPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+570, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGE_UQSD[] = {
    {I_VCMPNGE_UQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4326, 174},
    {I_VCMPNGE_UQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4335, 174},
    {I_VCMPNGE_UQSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+890, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGE_UQSS[] = {
    {I_VCMPNGE_UQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4902, 174},
    {I_VCMPNGE_UQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4911, 174},
    {I_VCMPNGE_UQSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1210, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGE_USPD[] = {
    {I_VCMPNGE_USPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1932, 174},
    {I_VCMPNGE_USPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1941, 174},
    {I_VCMPNGE_USPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1950, 174},
    {I_VCMPNGE_USPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1959, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGE_USPS[] = {
    {I_VCMPNGE_USPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3084, 174},
    {I_VCMPNGE_USPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3093, 174},
    {I_VCMPNGE_USPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3102, 174},
    {I_VCMPNGE_USPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3111, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGE_USSD[] = {
    {I_VCMPNGE_USSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4056, 174},
    {I_VCMPNGE_USSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4065, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGE_USSS[] = {
    {I_VCMPNGE_USSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4632, 174},
    {I_VCMPNGE_USSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4641, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGTPD[] = {
    {I_VCMPNGTPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1968, 174},
    {I_VCMPNGTPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1977, 174},
    {I_VCMPNGTPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1986, 174},
    {I_VCMPNGTPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1995, 174},
    {I_VCMPNGTPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+100, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGTPS[] = {
    {I_VCMPNGTPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3120, 174},
    {I_VCMPNGTPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3129, 174},
    {I_VCMPNGTPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3138, 174},
    {I_VCMPNGTPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3147, 174},
    {I_VCMPNGTPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+420, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGTSD[] = {
    {I_VCMPNGTSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4074, 174},
    {I_VCMPNGTSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4083, 174},
    {I_VCMPNGTSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+740, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGTSS[] = {
    {I_VCMPNGTSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4650, 174},
    {I_VCMPNGTSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4659, 174},
    {I_VCMPNGTSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1060, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGT_UQPD[] = {
    {I_VCMPNGT_UQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2508, 174},
    {I_VCMPNGT_UQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2517, 174},
    {I_VCMPNGT_UQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2526, 174},
    {I_VCMPNGT_UQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2535, 174},
    {I_VCMPNGT_UQPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+260, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGT_UQPS[] = {
    {I_VCMPNGT_UQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3660, 174},
    {I_VCMPNGT_UQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3669, 174},
    {I_VCMPNGT_UQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3678, 174},
    {I_VCMPNGT_UQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3687, 174},
    {I_VCMPNGT_UQPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+580, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGT_UQSD[] = {
    {I_VCMPNGT_UQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4344, 174},
    {I_VCMPNGT_UQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4353, 174},
    {I_VCMPNGT_UQSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+900, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGT_UQSS[] = {
    {I_VCMPNGT_UQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4920, 174},
    {I_VCMPNGT_UQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4929, 174},
    {I_VCMPNGT_UQSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1220, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGT_USPD[] = {
    {I_VCMPNGT_USPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1968, 174},
    {I_VCMPNGT_USPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1977, 174},
    {I_VCMPNGT_USPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1986, 174},
    {I_VCMPNGT_USPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1995, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGT_USPS[] = {
    {I_VCMPNGT_USPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3120, 174},
    {I_VCMPNGT_USPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3129, 174},
    {I_VCMPNGT_USPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3138, 174},
    {I_VCMPNGT_USPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3147, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGT_USSD[] = {
    {I_VCMPNGT_USSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4074, 174},
    {I_VCMPNGT_USSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4083, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNGT_USSS[] = {
    {I_VCMPNGT_USSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4650, 174},
    {I_VCMPNGT_USSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4659, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLEPD[] = {
    {I_VCMPNLEPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1824, 174},
    {I_VCMPNLEPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1833, 174},
    {I_VCMPNLEPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1842, 174},
    {I_VCMPNLEPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1851, 174},
    {I_VCMPNLEPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+60, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLEPS[] = {
    {I_VCMPNLEPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2976, 174},
    {I_VCMPNLEPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2985, 174},
    {I_VCMPNLEPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2994, 174},
    {I_VCMPNLEPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3003, 174},
    {I_VCMPNLEPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+380, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLESD[] = {
    {I_VCMPNLESD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4002, 174},
    {I_VCMPNLESD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4011, 174},
    {I_VCMPNLESD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+700, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLESS[] = {
    {I_VCMPNLESS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4578, 174},
    {I_VCMPNLESS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4587, 174},
    {I_VCMPNLESS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1020, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLE_UQPD[] = {
    {I_VCMPNLE_UQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2364, 174},
    {I_VCMPNLE_UQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2373, 174},
    {I_VCMPNLE_UQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2382, 174},
    {I_VCMPNLE_UQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2391, 174},
    {I_VCMPNLE_UQPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+220, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLE_UQPS[] = {
    {I_VCMPNLE_UQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3516, 174},
    {I_VCMPNLE_UQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3525, 174},
    {I_VCMPNLE_UQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3534, 174},
    {I_VCMPNLE_UQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3543, 174},
    {I_VCMPNLE_UQPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+540, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLE_UQSD[] = {
    {I_VCMPNLE_UQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4272, 174},
    {I_VCMPNLE_UQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4281, 174},
    {I_VCMPNLE_UQSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+860, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLE_UQSS[] = {
    {I_VCMPNLE_UQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4848, 174},
    {I_VCMPNLE_UQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4857, 174},
    {I_VCMPNLE_UQSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1180, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLE_USPD[] = {
    {I_VCMPNLE_USPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1824, 174},
    {I_VCMPNLE_USPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1833, 174},
    {I_VCMPNLE_USPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1842, 174},
    {I_VCMPNLE_USPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1851, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLE_USPS[] = {
    {I_VCMPNLE_USPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2976, 174},
    {I_VCMPNLE_USPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2985, 174},
    {I_VCMPNLE_USPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2994, 174},
    {I_VCMPNLE_USPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3003, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLE_USSD[] = {
    {I_VCMPNLE_USSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4002, 174},
    {I_VCMPNLE_USSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4011, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLE_USSS[] = {
    {I_VCMPNLE_USSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4578, 174},
    {I_VCMPNLE_USSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4587, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLTPD[] = {
    {I_VCMPNLTPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1788, 174},
    {I_VCMPNLTPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1797, 174},
    {I_VCMPNLTPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1806, 174},
    {I_VCMPNLTPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1815, 174},
    {I_VCMPNLTPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+50, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLTPS[] = {
    {I_VCMPNLTPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2940, 174},
    {I_VCMPNLTPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2949, 174},
    {I_VCMPNLTPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2958, 174},
    {I_VCMPNLTPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2967, 174},
    {I_VCMPNLTPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+370, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLTSD[] = {
    {I_VCMPNLTSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+3984, 174},
    {I_VCMPNLTSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+3993, 174},
    {I_VCMPNLTSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+690, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLTSS[] = {
    {I_VCMPNLTSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4560, 174},
    {I_VCMPNLTSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4569, 174},
    {I_VCMPNLTSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1010, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLT_UQPD[] = {
    {I_VCMPNLT_UQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2328, 174},
    {I_VCMPNLT_UQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2337, 174},
    {I_VCMPNLT_UQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2346, 174},
    {I_VCMPNLT_UQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2355, 174},
    {I_VCMPNLT_UQPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+210, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLT_UQPS[] = {
    {I_VCMPNLT_UQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3480, 174},
    {I_VCMPNLT_UQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3489, 174},
    {I_VCMPNLT_UQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3498, 174},
    {I_VCMPNLT_UQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3507, 174},
    {I_VCMPNLT_UQPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+530, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLT_UQSD[] = {
    {I_VCMPNLT_UQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4254, 174},
    {I_VCMPNLT_UQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4263, 174},
    {I_VCMPNLT_UQSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+850, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLT_UQSS[] = {
    {I_VCMPNLT_UQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4830, 174},
    {I_VCMPNLT_UQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4839, 174},
    {I_VCMPNLT_UQSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1170, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLT_USPD[] = {
    {I_VCMPNLT_USPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1788, 174},
    {I_VCMPNLT_USPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1797, 174},
    {I_VCMPNLT_USPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1806, 174},
    {I_VCMPNLT_USPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1815, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLT_USPS[] = {
    {I_VCMPNLT_USPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2940, 174},
    {I_VCMPNLT_USPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2949, 174},
    {I_VCMPNLT_USPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2958, 174},
    {I_VCMPNLT_USPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2967, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLT_USSD[] = {
    {I_VCMPNLT_USSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+3984, 174},
    {I_VCMPNLT_USSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+3993, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPNLT_USSS[] = {
    {I_VCMPNLT_USSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4560, 174},
    {I_VCMPNLT_USSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4569, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPORDPD[] = {
    {I_VCMPORDPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1860, 174},
    {I_VCMPORDPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1869, 174},
    {I_VCMPORDPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1878, 174},
    {I_VCMPORDPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1887, 174},
    {I_VCMPORDPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+70, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPORDPS[] = {
    {I_VCMPORDPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3012, 174},
    {I_VCMPORDPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3021, 174},
    {I_VCMPORDPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3030, 174},
    {I_VCMPORDPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3039, 174},
    {I_VCMPORDPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+390, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPORDSD[] = {
    {I_VCMPORDSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4020, 174},
    {I_VCMPORDSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4029, 174},
    {I_VCMPORDSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+710, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPORDSS[] = {
    {I_VCMPORDSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4596, 174},
    {I_VCMPORDSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4605, 174},
    {I_VCMPORDSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1030, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPORD_QPD[] = {
    {I_VCMPORD_QPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1860, 174},
    {I_VCMPORD_QPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1869, 174},
    {I_VCMPORD_QPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1878, 174},
    {I_VCMPORD_QPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1887, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPORD_QPS[] = {
    {I_VCMPORD_QPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3012, 174},
    {I_VCMPORD_QPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3021, 174},
    {I_VCMPORD_QPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3030, 174},
    {I_VCMPORD_QPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3039, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPORD_QSD[] = {
    {I_VCMPORD_QSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4020, 174},
    {I_VCMPORD_QSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4029, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPORD_QSS[] = {
    {I_VCMPORD_QSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4596, 174},
    {I_VCMPORD_QSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4605, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPORD_SPD[] = {
    {I_VCMPORD_SPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2400, 174},
    {I_VCMPORD_SPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2409, 174},
    {I_VCMPORD_SPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2418, 174},
    {I_VCMPORD_SPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2427, 174},
    {I_VCMPORD_SPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+230, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPORD_SPS[] = {
    {I_VCMPORD_SPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3552, 174},
    {I_VCMPORD_SPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3561, 174},
    {I_VCMPORD_SPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3570, 174},
    {I_VCMPORD_SPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3579, 174},
    {I_VCMPORD_SPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+550, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPORD_SSD[] = {
    {I_VCMPORD_SSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4290, 174},
    {I_VCMPORD_SSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4299, 174},
    {I_VCMPORD_SSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+870, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPORD_SSS[] = {
    {I_VCMPORD_SSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4866, 174},
    {I_VCMPORD_SSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4875, 174},
    {I_VCMPORD_SSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1190, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPPD[] = {
    {I_VCMPPD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+6900, 174},
    {I_VCMPPD, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+6908, 174},
    {I_VCMPPD, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+6916, 174},
    {I_VCMPPD, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+6924, 174},
    {I_VCMPPD, 4, {KREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+5154, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPPS[] = {
    {I_VCMPPS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+6932, 174},
    {I_VCMPPS, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+6940, 174},
    {I_VCMPPS, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+6948, 174},
    {I_VCMPPS, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+6956, 174},
    {I_VCMPPS, 4, {KREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+5163, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPSD[] = {
    {I_VCMPSD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+6964, 174},
    {I_VCMPSD, 3, {XMM_L16,RM_XMM_L16|BITS64,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+6972, 174},
    {I_VCMPSD, 4, {KREG,XMMREG,RM_XMM|BITS64,IMMEDIATE|BITS8,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+5172, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPSS[] = {
    {I_VCMPSS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+6980, 174},
    {I_VCMPSS, 3, {XMM_L16,RM_XMM_L16|BITS64,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+6988, 174},
    {I_VCMPSS, 4, {KREG,XMMREG,RM_XMM|BITS32,IMMEDIATE|BITS8,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+5181, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPTRUEPD[] = {
    {I_VCMPTRUEPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2148, 174},
    {I_VCMPTRUEPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2157, 174},
    {I_VCMPTRUEPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2166, 174},
    {I_VCMPTRUEPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2175, 174},
    {I_VCMPTRUEPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+150, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPTRUEPS[] = {
    {I_VCMPTRUEPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3300, 174},
    {I_VCMPTRUEPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3309, 174},
    {I_VCMPTRUEPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3318, 174},
    {I_VCMPTRUEPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3327, 174},
    {I_VCMPTRUEPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+470, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPTRUESD[] = {
    {I_VCMPTRUESD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4164, 174},
    {I_VCMPTRUESD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4173, 174},
    {I_VCMPTRUESD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+790, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPTRUESS[] = {
    {I_VCMPTRUESS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4740, 174},
    {I_VCMPTRUESS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4749, 174},
    {I_VCMPTRUESS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1110, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPTRUE_UQPD[] = {
    {I_VCMPTRUE_UQPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2148, 174},
    {I_VCMPTRUE_UQPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2157, 174},
    {I_VCMPTRUE_UQPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2166, 174},
    {I_VCMPTRUE_UQPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2175, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPTRUE_UQPS[] = {
    {I_VCMPTRUE_UQPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3300, 174},
    {I_VCMPTRUE_UQPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3309, 174},
    {I_VCMPTRUE_UQPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3318, 174},
    {I_VCMPTRUE_UQPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3327, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPTRUE_UQSD[] = {
    {I_VCMPTRUE_UQSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4164, 174},
    {I_VCMPTRUE_UQSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4173, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPTRUE_UQSS[] = {
    {I_VCMPTRUE_UQSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4740, 174},
    {I_VCMPTRUE_UQSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4749, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPTRUE_USPD[] = {
    {I_VCMPTRUE_USPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2688, 174},
    {I_VCMPTRUE_USPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2697, 174},
    {I_VCMPTRUE_USPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2706, 174},
    {I_VCMPTRUE_USPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2715, 174},
    {I_VCMPTRUE_USPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+310, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPTRUE_USPS[] = {
    {I_VCMPTRUE_USPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3840, 174},
    {I_VCMPTRUE_USPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3849, 174},
    {I_VCMPTRUE_USPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3858, 174},
    {I_VCMPTRUE_USPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3867, 174},
    {I_VCMPTRUE_USPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+630, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPTRUE_USSD[] = {
    {I_VCMPTRUE_USSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4434, 174},
    {I_VCMPTRUE_USSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4443, 174},
    {I_VCMPTRUE_USSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+950, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPTRUE_USSS[] = {
    {I_VCMPTRUE_USSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+5010, 174},
    {I_VCMPTRUE_USSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+5019, 174},
    {I_VCMPTRUE_USSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1270, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPUNORDPD[] = {
    {I_VCMPUNORDPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1716, 174},
    {I_VCMPUNORDPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1725, 174},
    {I_VCMPUNORDPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1734, 174},
    {I_VCMPUNORDPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1743, 174},
    {I_VCMPUNORDPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+30, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPUNORDPS[] = {
    {I_VCMPUNORDPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2868, 174},
    {I_VCMPUNORDPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2877, 174},
    {I_VCMPUNORDPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2886, 174},
    {I_VCMPUNORDPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2895, 174},
    {I_VCMPUNORDPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+350, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPUNORDSD[] = {
    {I_VCMPUNORDSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+3948, 174},
    {I_VCMPUNORDSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+3957, 174},
    {I_VCMPUNORDSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+670, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPUNORDSS[] = {
    {I_VCMPUNORDSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4524, 174},
    {I_VCMPUNORDSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4533, 174},
    {I_VCMPUNORDSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+990, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPUNORD_QPD[] = {
    {I_VCMPUNORD_QPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+1716, 174},
    {I_VCMPUNORD_QPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+1725, 174},
    {I_VCMPUNORD_QPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+1734, 174},
    {I_VCMPUNORD_QPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+1743, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPUNORD_QPS[] = {
    {I_VCMPUNORD_QPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2868, 174},
    {I_VCMPUNORD_QPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2877, 174},
    {I_VCMPUNORD_QPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2886, 174},
    {I_VCMPUNORD_QPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2895, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPUNORD_QSD[] = {
    {I_VCMPUNORD_QSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+3948, 174},
    {I_VCMPUNORD_QSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+3957, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPUNORD_QSS[] = {
    {I_VCMPUNORD_QSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4524, 174},
    {I_VCMPUNORD_QSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4533, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPUNORD_SPD[] = {
    {I_VCMPUNORD_SPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+2256, 174},
    {I_VCMPUNORD_SPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+2265, 174},
    {I_VCMPUNORD_SPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+2274, 174},
    {I_VCMPUNORD_SPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+2283, 174},
    {I_VCMPUNORD_SPD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64|SAE,0,0}, nasm_bytecodes+190, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPUNORD_SPS[] = {
    {I_VCMPUNORD_SPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+3408, 174},
    {I_VCMPUNORD_SPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+3417, 174},
    {I_VCMPUNORD_SPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+3426, 174},
    {I_VCMPUNORD_SPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+3435, 174},
    {I_VCMPUNORD_SPS, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32|SAE,0,0}, nasm_bytecodes+510, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPUNORD_SSD[] = {
    {I_VCMPUNORD_SSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4218, 174},
    {I_VCMPUNORD_SSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4227, 174},
    {I_VCMPUNORD_SSD, 3, {KREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+830, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCMPUNORD_SSS[] = {
    {I_VCMPUNORD_SSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+4794, 174},
    {I_VCMPUNORD_SSS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+4803, 174},
    {I_VCMPUNORD_SSS, 3, {KREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK,0,SAE,0,0}, nasm_bytecodes+1150, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCOMISD[] = {
    {I_VCOMISD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+14911, 174},
    {I_VCOMISD, 2, {XMMREG,RM_XMM|BITS64,0,0,0}, {0,SAE,0,0,0}, nasm_bytecodes+9844, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCOMISS[] = {
    {I_VCOMISS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+14918, 174},
    {I_VCOMISS, 2, {XMMREG,RM_XMM|BITS32,0,0,0}, {0,SAE,0,0,0}, nasm_bytecodes+9852, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCOMPRESSPD[] = {
    {I_VCOMPRESSPD, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+9860, 200},
    {I_VCOMPRESSPD, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+9868, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCOMPRESSPS[] = {
    {I_VCOMPRESSPS, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+9876, 200},
    {I_VCOMPRESSPS, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+9884, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTDQ2PD[] = {
    {I_VCVTDQ2PD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+14925, 174},
    {I_VCVTDQ2PD, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14932, 174},
    {I_VCVTDQ2PD, 2, {ZMMREG,RM_YMM|BITS256,0,0,0}, {MASK|Z,B32|ER,0,0,0}, nasm_bytecodes+9892, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTDQ2PS[] = {
    {I_VCVTDQ2PS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14939, 174},
    {I_VCVTDQ2PS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+14946, 174},
    {I_VCVTDQ2PS, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32|ER,0,0,0}, nasm_bytecodes+9900, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTPD2DQ[] = {
    {I_VCVTPD2DQ, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14953, 174},
    {I_VCVTPD2DQ, 2, {XMM_L16,MEMORY|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14953, 175},
    {I_VCVTPD2DQ, 2, {XMM_L16,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14960, 174},
    {I_VCVTPD2DQ, 2, {XMM_L16,MEMORY|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+14960, 176},
    {I_VCVTPD2DQ, 2, {YMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64|ER,0,0,0}, nasm_bytecodes+9908, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTPD2PS[] = {
    {I_VCVTPD2PS, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14967, 174},
    {I_VCVTPD2PS, 2, {XMM_L16,MEMORY|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14967, 175},
    {I_VCVTPD2PS, 2, {XMM_L16,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+14974, 174},
    {I_VCVTPD2PS, 2, {XMM_L16,MEMORY|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+14974, 176},
    {I_VCVTPD2PS, 2, {YMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64|ER,0,0,0}, nasm_bytecodes+9916, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTPD2UDQ[] = {
    {I_VCVTPD2UDQ, 2, {YMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64|ER,0,0,0}, nasm_bytecodes+9924, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTPH2PS[] = {
    {I_VCVTPH2PS, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18712, 182},
    {I_VCVTPH2PS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+18719, 182},
    {I_VCVTPH2PS, 2, {ZMMREG,RM_YMM|BITS256,0,0,0}, {MASK|Z,SAE,0,0,0}, nasm_bytecodes+9932, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTPS2DQ[] = {
    {I_VCVTPS2DQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+14981, 174},
    {I_VCVTPS2DQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+14988, 174},
    {I_VCVTPS2DQ, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32|ER,0,0,0}, nasm_bytecodes+9940, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTPS2PD[] = {
    {I_VCVTPS2PD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+14995, 174},
    {I_VCVTPS2PD, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15002, 174},
    {I_VCVTPS2PD, 2, {ZMMREG,RM_YMM|BITS256,0,0,0}, {MASK|Z,B32|SAE,0,0,0}, nasm_bytecodes+9948, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTPS2PH[] = {
    {I_VCVTPS2PH, 3, {RM_XMM_L16|BITS128,YMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7660, 182},
    {I_VCVTPS2PH, 3, {RM_XMM_L16|BITS64,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7668, 182},
    {I_VCVTPS2PH, 3, {YMMREG,ZMMREG,IMMEDIATE|BITS8,0,0}, {MASK|Z,SAE,0,0,0}, nasm_bytecodes+5190, 200},
    {I_VCVTPS2PH, 3, {MEMORY|BITS256,ZMMREG,IMMEDIATE|BITS8,0,0}, {MASK,SAE,0,0,0}, nasm_bytecodes+5190, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTPS2UDQ[] = {
    {I_VCVTPS2UDQ, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32|ER,0,0,0}, nasm_bytecodes+9956, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTSD2SI[] = {
    {I_VCVTSD2SI, 2, {REG_GPR|BITS32,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15009, 174},
    {I_VCVTSD2SI, 2, {REG_GPR|BITS64,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15016, 177},
    {I_VCVTSD2SI, 2, {REG_GPR|BITS64,RM_XMM|BITS64,0,0,0}, {0,ER,0,0,0}, nasm_bytecodes+9964, 200},
    {I_VCVTSD2SI, 2, {REG_GPR|BITS32,RM_XMM|BITS64,0,0,0}, {0,ER,0,0,0}, nasm_bytecodes+9972, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTSD2SS[] = {
    {I_VCVTSD2SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+15023, 174},
    {I_VCVTSD2SS, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15030, 174},
    {I_VCVTSD2SS, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+9980, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTSD2USI[] = {
    {I_VCVTSD2USI, 2, {REG_GPR|BITS64,RM_XMM|BITS64,0,0,0}, {0,ER,0,0,0}, nasm_bytecodes+9988, 200},
    {I_VCVTSD2USI, 2, {REG_GPR|BITS32,RM_XMM|BITS64,0,0,0}, {0,ER,0,0,0}, nasm_bytecodes+9996, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTSI2SD[] = {
    {I_VCVTSI2SD, 3, {XMM_L16,XMM_L16,RM_GPR|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+15037, 178},
    {I_VCVTSI2SD, 2, {XMM_L16,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+15044, 178},
    {I_VCVTSI2SD, 3, {XMM_L16,XMM_L16,MEMORY|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+15037, 178},
    {I_VCVTSI2SD, 2, {XMM_L16,MEMORY|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+15044, 178},
    {I_VCVTSI2SD, 3, {XMM_L16,XMM_L16,RM_GPR|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+15051, 179},
    {I_VCVTSI2SD, 2, {XMM_L16,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15058, 179},
    {I_VCVTSI2SD, 3, {XMMREG,XMMREG,RM_GPR|BITS64,0,0}, {0,ER,0,0,0}, nasm_bytecodes+10004, 200},
    {I_VCVTSI2SD, 3, {XMMREG,XMMREG,RM_GPR|BITS32,0,0}, {0,ER,0,0,0}, nasm_bytecodes+10012, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTSI2SS[] = {
    {I_VCVTSI2SS, 3, {XMM_L16,XMM_L16,RM_GPR|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+15065, 178},
    {I_VCVTSI2SS, 2, {XMM_L16,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+15072, 178},
    {I_VCVTSI2SS, 3, {XMM_L16,XMM_L16,MEMORY|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+15065, 178},
    {I_VCVTSI2SS, 2, {XMM_L16,MEMORY|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+15072, 178},
    {I_VCVTSI2SS, 3, {XMM_L16,XMM_L16,RM_GPR|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+15079, 179},
    {I_VCVTSI2SS, 2, {XMM_L16,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15086, 179},
    {I_VCVTSI2SS, 3, {XMMREG,XMMREG,RM_GPR|BITS32,0,0}, {0,ER,0,0,0}, nasm_bytecodes+10020, 200},
    {I_VCVTSI2SS, 3, {XMMREG,XMMREG,RM_GPR|BITS64,0,0}, {0,ER,0,0,0}, nasm_bytecodes+10028, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTSS2SD[] = {
    {I_VCVTSS2SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+15093, 174},
    {I_VCVTSS2SD, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+15100, 174},
    {I_VCVTSS2SD, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+10036, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTSS2SI[] = {
    {I_VCVTSS2SI, 2, {REG_GPR|BITS32,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+15107, 174},
    {I_VCVTSS2SI, 2, {REG_GPR|BITS64,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+15114, 177},
    {I_VCVTSS2SI, 2, {REG_GPR|BITS32,RM_XMM|BITS32,0,0,0}, {0,ER,0,0,0}, nasm_bytecodes+10044, 200},
    {I_VCVTSS2SI, 2, {REG_GPR|BITS64,RM_XMM|BITS32,0,0,0}, {0,ER,0,0,0}, nasm_bytecodes+10052, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTSS2USI[] = {
    {I_VCVTSS2USI, 2, {REG_GPR|BITS32,RM_XMM|BITS32,0,0,0}, {0,ER,0,0,0}, nasm_bytecodes+10060, 200},
    {I_VCVTSS2USI, 2, {REG_GPR|BITS64,RM_XMM|BITS32,0,0,0}, {0,ER,0,0,0}, nasm_bytecodes+10068, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTTPD2DQ[] = {
    {I_VCVTTPD2DQ, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15121, 174},
    {I_VCVTTPD2DQ, 2, {XMM_L16,MEMORY|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15121, 175},
    {I_VCVTTPD2DQ, 2, {XMM_L16,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15128, 174},
    {I_VCVTTPD2DQ, 2, {XMM_L16,MEMORY|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15128, 176},
    {I_VCVTTPD2DQ, 2, {YMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64|SAE,0,0,0}, nasm_bytecodes+10076, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTTPD2UDQ[] = {
    {I_VCVTTPD2UDQ, 2, {YMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64|SAE,0,0,0}, nasm_bytecodes+10084, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTTPS2DQ[] = {
    {I_VCVTTPS2DQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15135, 174},
    {I_VCVTTPS2DQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15142, 174},
    {I_VCVTTPS2DQ, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32|SAE,0,0,0}, nasm_bytecodes+10092, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTTPS2UDQ[] = {
    {I_VCVTTPS2UDQ, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32|SAE,0,0,0}, nasm_bytecodes+10100, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTTSD2SI[] = {
    {I_VCVTTSD2SI, 2, {REG_GPR|BITS32,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15149, 174},
    {I_VCVTTSD2SI, 2, {REG_GPR|BITS64,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15156, 177},
    {I_VCVTTSD2SI, 2, {REG_GPR|BITS64,RM_XMM|BITS64,0,0,0}, {0,SAE,0,0,0}, nasm_bytecodes+10108, 200},
    {I_VCVTTSD2SI, 2, {REG_GPR|BITS32,RM_XMM|BITS64,0,0,0}, {0,SAE,0,0,0}, nasm_bytecodes+10116, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTTSD2USI[] = {
    {I_VCVTTSD2USI, 2, {REG_GPR|BITS32,RM_XMM|BITS64,0,0,0}, {0,SAE,0,0,0}, nasm_bytecodes+10124, 200},
    {I_VCVTTSD2USI, 2, {REG_GPR|BITS64,RM_XMM|BITS64,0,0,0}, {0,SAE,0,0,0}, nasm_bytecodes+10132, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTTSS2SI[] = {
    {I_VCVTTSS2SI, 2, {REG_GPR|BITS32,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+15163, 174},
    {I_VCVTTSS2SI, 2, {REG_GPR|BITS64,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+15170, 177},
    {I_VCVTTSS2SI, 2, {REG_GPR|BITS64,RM_XMM|BITS32,0,0,0}, {0,SAE,0,0,0}, nasm_bytecodes+10140, 200},
    {I_VCVTTSS2SI, 2, {REG_GPR|BITS32,RM_XMM|BITS32,0,0,0}, {0,SAE,0,0,0}, nasm_bytecodes+10148, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTTSS2USI[] = {
    {I_VCVTTSS2USI, 2, {REG_GPR|BITS32,RM_XMM|BITS32,0,0,0}, {0,SAE,0,0,0}, nasm_bytecodes+10156, 200},
    {I_VCVTTSS2USI, 2, {REG_GPR|BITS64,RM_XMM|BITS32,0,0,0}, {0,SAE,0,0,0}, nasm_bytecodes+10164, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTUDQ2PD[] = {
    {I_VCVTUDQ2PD, 2, {ZMMREG,RM_YMM|BITS256,0,0,0}, {MASK|Z,B32|ER,0,0,0}, nasm_bytecodes+10172, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTUDQ2PS[] = {
    {I_VCVTUDQ2PS, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32|ER,0,0,0}, nasm_bytecodes+10180, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTUSI2SD[] = {
    {I_VCVTUSI2SD, 3, {XMMREG,XMMREG,RM_GPR|BITS32,0,0}, {0,ER,0,0,0}, nasm_bytecodes+10188, 200},
    {I_VCVTUSI2SD, 3, {XMMREG,XMMREG,RM_GPR|BITS64,0,0}, {0,ER,0,0,0}, nasm_bytecodes+10196, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VCVTUSI2SS[] = {
    {I_VCVTUSI2SS, 3, {XMMREG,XMMREG,RM_GPR|BITS64,0,0}, {0,ER,0,0,0}, nasm_bytecodes+10204, 200},
    {I_VCVTUSI2SS, 3, {XMMREG,XMMREG,RM_GPR|BITS32,0,0}, {0,ER,0,0,0}, nasm_bytecodes+10212, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VDIVPD[] = {
    {I_VDIVPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+15177, 174},
    {I_VDIVPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15184, 174},
    {I_VDIVPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+15191, 174},
    {I_VDIVPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15198, 174},
    {I_VDIVPD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10220, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VDIVPS[] = {
    {I_VDIVPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+15205, 174},
    {I_VDIVPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15212, 174},
    {I_VDIVPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+15219, 174},
    {I_VDIVPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15226, 174},
    {I_VDIVPS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10228, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VDIVSD[] = {
    {I_VDIVSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+15233, 174},
    {I_VDIVSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15240, 174},
    {I_VDIVSD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10236, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VDIVSS[] = {
    {I_VDIVSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+15247, 174},
    {I_VDIVSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+15254, 174},
    {I_VDIVSS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10244, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VDPPD[] = {
    {I_VDPPD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+6996, 174},
    {I_VDPPD, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7004, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VDPPS[] = {
    {I_VDPPS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7012, 174},
    {I_VDPPS, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7020, 174},
    {I_VDPPS, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7028, 174},
    {I_VDPPS, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7036, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VERR[] = {
    {I_VERR, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26623, 61},
    {I_VERR, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26623, 61},
    {I_VERR, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26623, 61},
    ITEMPLATE_END
};

static const struct itemplate instrux_VERW[] = {
    {I_VERW, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26628, 61},
    {I_VERW, 1, {MEMORY|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26628, 61},
    {I_VERW, 1, {REG_GPR|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26628, 61},
    ITEMPLATE_END
};

static const struct itemplate instrux_VEXP2PD[] = {
    {I_VEXP2PD, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64|SAE,0,0,0}, nasm_bytecodes+12556, 203},
    ITEMPLATE_END
};

static const struct itemplate instrux_VEXP2PS[] = {
    {I_VEXP2PS, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32|SAE,0,0,0}, nasm_bytecodes+12564, 203},
    ITEMPLATE_END
};

static const struct itemplate instrux_VEXPANDPD[] = {
    {I_VEXPANDPD, 2, {ZMMREG,MEMORY|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10252, 200},
    {I_VEXPANDPD, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10252, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VEXPANDPS[] = {
    {I_VEXPANDPS, 2, {ZMMREG,MEMORY|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10260, 200},
    {I_VEXPANDPS, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10260, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VEXTRACTF128[] = {
    {I_VEXTRACTF128, 3, {RM_XMM_L16|BITS128,YMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7044, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VEXTRACTF32X4[] = {
    {I_VEXTRACTF32X4, 3, {MEMORY|BITS128,ZMMREG,IMMEDIATE|BITS8,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5199, 200},
    {I_VEXTRACTF32X4, 3, {XMMREG,ZMMREG,IMMEDIATE|BITS8,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+5199, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VEXTRACTF64X4[] = {
    {I_VEXTRACTF64X4, 3, {MEMORY|BITS256,ZMMREG,IMMEDIATE|BITS8,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5208, 200},
    {I_VEXTRACTF64X4, 3, {YMMREG,ZMMREG,IMMEDIATE|BITS8,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+5217, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VEXTRACTI128[] = {
    {I_VEXTRACTI128, 3, {RM_XMM_L16|BITS128,YMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9548, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VEXTRACTI32X4[] = {
    {I_VEXTRACTI32X4, 3, {MEMORY|BITS128,ZMMREG,IMMEDIATE|BITS8,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5226, 200},
    {I_VEXTRACTI32X4, 3, {XMMREG,ZMMREG,IMMEDIATE|BITS8,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+5235, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VEXTRACTI64X4[] = {
    {I_VEXTRACTI64X4, 3, {YMMREG,ZMMREG,IMMEDIATE|BITS8,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+5244, 200},
    {I_VEXTRACTI64X4, 3, {MEMORY|BITS256,ZMMREG,IMMEDIATE|BITS8,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5253, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VEXTRACTPS[] = {
    {I_VEXTRACTPS, 3, {RM_GPR|BITS32,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7052, 174},
    {I_VEXTRACTPS, 3, {RM_GPR|BITS64,XMMREG,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+5262, 200},
    {I_VEXTRACTPS, 3, {RM_GPR|BITS32,XMMREG,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+5271, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFIXUPIMMPD[] = {
    {I_VFIXUPIMMPD, 4, {ZMMREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK|Z,0,B64|SAE,0,0}, nasm_bytecodes+5280, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFIXUPIMMPS[] = {
    {I_VFIXUPIMMPS, 4, {ZMMREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK|Z,0,B32|SAE,0,0}, nasm_bytecodes+5289, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFIXUPIMMSD[] = {
    {I_VFIXUPIMMSD, 4, {XMMREG,XMMREG,RM_XMM|BITS64,IMMEDIATE|BITS8,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+5298, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFIXUPIMMSS[] = {
    {I_VFIXUPIMMSS, 4, {XMMREG,XMMREG,RM_XMM|BITS32,IMMEDIATE|BITS8,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+5307, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD123PD[] = {
    {I_VFMADD123PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18026, 181},
    {I_VFMADD123PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18033, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD123PS[] = {
    {I_VFMADD123PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18012, 181},
    {I_VFMADD123PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18019, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD123SD[] = {
    {I_VFMADD123SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18509, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD123SS[] = {
    {I_VFMADD123SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18502, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD132PD[] = {
    {I_VFMADD132PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17998, 181},
    {I_VFMADD132PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18005, 181},
    {I_VFMADD132PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10268, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD132PS[] = {
    {I_VFMADD132PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17984, 181},
    {I_VFMADD132PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+17991, 181},
    {I_VFMADD132PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10276, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD132SD[] = {
    {I_VFMADD132SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18495, 181},
    {I_VFMADD132SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10284, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD132SS[] = {
    {I_VFMADD132SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18488, 181},
    {I_VFMADD132SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10292, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD213PD[] = {
    {I_VFMADD213PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18026, 181},
    {I_VFMADD213PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18033, 181},
    {I_VFMADD213PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10300, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD213PS[] = {
    {I_VFMADD213PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18012, 181},
    {I_VFMADD213PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18019, 181},
    {I_VFMADD213PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10308, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD213SD[] = {
    {I_VFMADD213SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18509, 181},
    {I_VFMADD213SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10316, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD213SS[] = {
    {I_VFMADD213SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18502, 181},
    {I_VFMADD213SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10324, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD231PD[] = {
    {I_VFMADD231PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18054, 181},
    {I_VFMADD231PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18061, 181},
    {I_VFMADD231PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10332, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD231PS[] = {
    {I_VFMADD231PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18040, 181},
    {I_VFMADD231PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18047, 181},
    {I_VFMADD231PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10340, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD231SD[] = {
    {I_VFMADD231SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18523, 181},
    {I_VFMADD231SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10348, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD231SS[] = {
    {I_VFMADD231SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18516, 181},
    {I_VFMADD231SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10356, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD312PD[] = {
    {I_VFMADD312PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17998, 181},
    {I_VFMADD312PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18005, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD312PS[] = {
    {I_VFMADD312PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17984, 181},
    {I_VFMADD312PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+17991, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD312SD[] = {
    {I_VFMADD312SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18495, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD312SS[] = {
    {I_VFMADD312SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18488, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD321PD[] = {
    {I_VFMADD321PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18054, 181},
    {I_VFMADD321PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18061, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD321PS[] = {
    {I_VFMADD321PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18040, 181},
    {I_VFMADD321PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18047, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD321SD[] = {
    {I_VFMADD321SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18523, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADD321SS[] = {
    {I_VFMADD321SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18516, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDPD[] = {
    {I_VFMADDPD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+7740, 186},
    {I_VFMADDPD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+7748, 186},
    {I_VFMADDPD, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+7756, 186},
    {I_VFMADDPD, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+7764, 186},
    {I_VFMADDPD, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+7772, 186},
    {I_VFMADDPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+7780, 186},
    {I_VFMADDPD, 4, {YMM_L16,YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0}, NO_DECORATOR, nasm_bytecodes+7788, 186},
    {I_VFMADDPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+7796, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDPS[] = {
    {I_VFMADDPS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+7804, 186},
    {I_VFMADDPS, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+7812, 186},
    {I_VFMADDPS, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+7820, 186},
    {I_VFMADDPS, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+7828, 186},
    {I_VFMADDPS, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+7836, 186},
    {I_VFMADDPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+7844, 186},
    {I_VFMADDPS, 4, {YMM_L16,YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0}, NO_DECORATOR, nasm_bytecodes+7852, 186},
    {I_VFMADDPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+7860, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSD[] = {
    {I_VFMADDSD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+7868, 186},
    {I_VFMADDSD, 3, {XMM_L16,RM_XMM_L16|BITS64,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+7876, 186},
    {I_VFMADDSD, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0}, NO_DECORATOR, nasm_bytecodes+7884, 186},
    {I_VFMADDSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+7892, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSS[] = {
    {I_VFMADDSS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+7900, 186},
    {I_VFMADDSS, 3, {XMM_L16,RM_XMM_L16|BITS32,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+7908, 186},
    {I_VFMADDSS, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0}, NO_DECORATOR, nasm_bytecodes+7916, 186},
    {I_VFMADDSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+7924, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUB123PD[] = {
    {I_VFMADDSUB123PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18110, 181},
    {I_VFMADDSUB123PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18117, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUB123PS[] = {
    {I_VFMADDSUB123PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18096, 181},
    {I_VFMADDSUB123PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18103, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUB132PD[] = {
    {I_VFMADDSUB132PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18082, 181},
    {I_VFMADDSUB132PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18089, 181},
    {I_VFMADDSUB132PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10364, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUB132PS[] = {
    {I_VFMADDSUB132PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18068, 181},
    {I_VFMADDSUB132PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18075, 181},
    {I_VFMADDSUB132PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10372, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUB213PD[] = {
    {I_VFMADDSUB213PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18110, 181},
    {I_VFMADDSUB213PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18117, 181},
    {I_VFMADDSUB213PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10380, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUB213PS[] = {
    {I_VFMADDSUB213PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18096, 181},
    {I_VFMADDSUB213PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18103, 181},
    {I_VFMADDSUB213PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10388, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUB231PD[] = {
    {I_VFMADDSUB231PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18138, 181},
    {I_VFMADDSUB231PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18145, 181},
    {I_VFMADDSUB231PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10396, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUB231PS[] = {
    {I_VFMADDSUB231PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18124, 181},
    {I_VFMADDSUB231PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18131, 181},
    {I_VFMADDSUB231PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10404, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUB312PD[] = {
    {I_VFMADDSUB312PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18082, 181},
    {I_VFMADDSUB312PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18089, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUB312PS[] = {
    {I_VFMADDSUB312PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18068, 181},
    {I_VFMADDSUB312PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18075, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUB321PD[] = {
    {I_VFMADDSUB321PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18138, 181},
    {I_VFMADDSUB321PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18145, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUB321PS[] = {
    {I_VFMADDSUB321PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18124, 181},
    {I_VFMADDSUB321PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18131, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUBPD[] = {
    {I_VFMADDSUBPD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+7932, 186},
    {I_VFMADDSUBPD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+7940, 186},
    {I_VFMADDSUBPD, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+7948, 186},
    {I_VFMADDSUBPD, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+7956, 186},
    {I_VFMADDSUBPD, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+7964, 186},
    {I_VFMADDSUBPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+7972, 186},
    {I_VFMADDSUBPD, 4, {YMM_L16,YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0}, NO_DECORATOR, nasm_bytecodes+7980, 186},
    {I_VFMADDSUBPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+7988, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMADDSUBPS[] = {
    {I_VFMADDSUBPS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+7996, 186},
    {I_VFMADDSUBPS, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8004, 186},
    {I_VFMADDSUBPS, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8012, 186},
    {I_VFMADDSUBPS, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8020, 186},
    {I_VFMADDSUBPS, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+8028, 186},
    {I_VFMADDSUBPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+8036, 186},
    {I_VFMADDSUBPS, 4, {YMM_L16,YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0}, NO_DECORATOR, nasm_bytecodes+8044, 186},
    {I_VFMADDSUBPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+8052, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB123PD[] = {
    {I_VFMSUB123PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18194, 181},
    {I_VFMSUB123PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18201, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB123PS[] = {
    {I_VFMSUB123PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18180, 181},
    {I_VFMSUB123PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18187, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB123SD[] = {
    {I_VFMSUB123SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18551, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB123SS[] = {
    {I_VFMSUB123SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18544, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB132PD[] = {
    {I_VFMSUB132PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18166, 181},
    {I_VFMSUB132PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18173, 181},
    {I_VFMSUB132PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10412, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB132PS[] = {
    {I_VFMSUB132PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18152, 181},
    {I_VFMSUB132PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18159, 181},
    {I_VFMSUB132PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10420, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB132SD[] = {
    {I_VFMSUB132SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18537, 181},
    {I_VFMSUB132SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10428, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB132SS[] = {
    {I_VFMSUB132SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18530, 181},
    {I_VFMSUB132SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10436, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB213PD[] = {
    {I_VFMSUB213PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18194, 181},
    {I_VFMSUB213PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18201, 181},
    {I_VFMSUB213PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10444, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB213PS[] = {
    {I_VFMSUB213PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18180, 181},
    {I_VFMSUB213PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18187, 181},
    {I_VFMSUB213PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10452, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB213SD[] = {
    {I_VFMSUB213SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18551, 181},
    {I_VFMSUB213SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10460, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB213SS[] = {
    {I_VFMSUB213SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18544, 181},
    {I_VFMSUB213SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10468, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB231PD[] = {
    {I_VFMSUB231PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18222, 181},
    {I_VFMSUB231PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18229, 181},
    {I_VFMSUB231PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10476, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB231PS[] = {
    {I_VFMSUB231PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18208, 181},
    {I_VFMSUB231PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18215, 181},
    {I_VFMSUB231PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10484, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB231SD[] = {
    {I_VFMSUB231SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18565, 181},
    {I_VFMSUB231SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10492, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB231SS[] = {
    {I_VFMSUB231SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18558, 181},
    {I_VFMSUB231SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10500, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB312PD[] = {
    {I_VFMSUB312PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18166, 181},
    {I_VFMSUB312PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18173, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB312PS[] = {
    {I_VFMSUB312PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18152, 181},
    {I_VFMSUB312PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18159, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB312SD[] = {
    {I_VFMSUB312SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18537, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB312SS[] = {
    {I_VFMSUB312SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18530, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB321PD[] = {
    {I_VFMSUB321PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18222, 181},
    {I_VFMSUB321PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18229, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB321PS[] = {
    {I_VFMSUB321PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18208, 181},
    {I_VFMSUB321PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18215, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB321SD[] = {
    {I_VFMSUB321SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18565, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUB321SS[] = {
    {I_VFMSUB321SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18558, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADD123PD[] = {
    {I_VFMSUBADD123PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18278, 181},
    {I_VFMSUBADD123PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18285, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADD123PS[] = {
    {I_VFMSUBADD123PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18264, 181},
    {I_VFMSUBADD123PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18271, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADD132PD[] = {
    {I_VFMSUBADD132PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18250, 181},
    {I_VFMSUBADD132PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18257, 181},
    {I_VFMSUBADD132PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10508, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADD132PS[] = {
    {I_VFMSUBADD132PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18236, 181},
    {I_VFMSUBADD132PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18243, 181},
    {I_VFMSUBADD132PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10516, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADD213PD[] = {
    {I_VFMSUBADD213PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18278, 181},
    {I_VFMSUBADD213PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18285, 181},
    {I_VFMSUBADD213PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10524, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADD213PS[] = {
    {I_VFMSUBADD213PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18264, 181},
    {I_VFMSUBADD213PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18271, 181},
    {I_VFMSUBADD213PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10532, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADD231PD[] = {
    {I_VFMSUBADD231PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18306, 181},
    {I_VFMSUBADD231PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18313, 181},
    {I_VFMSUBADD231PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10540, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADD231PS[] = {
    {I_VFMSUBADD231PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18292, 181},
    {I_VFMSUBADD231PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18299, 181},
    {I_VFMSUBADD231PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10548, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADD312PD[] = {
    {I_VFMSUBADD312PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18250, 181},
    {I_VFMSUBADD312PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18257, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADD312PS[] = {
    {I_VFMSUBADD312PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18236, 181},
    {I_VFMSUBADD312PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18243, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADD321PD[] = {
    {I_VFMSUBADD321PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18306, 181},
    {I_VFMSUBADD321PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18313, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADD321PS[] = {
    {I_VFMSUBADD321PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18292, 181},
    {I_VFMSUBADD321PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18299, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADDPD[] = {
    {I_VFMSUBADDPD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8060, 186},
    {I_VFMSUBADDPD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8068, 186},
    {I_VFMSUBADDPD, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8076, 186},
    {I_VFMSUBADDPD, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8084, 186},
    {I_VFMSUBADDPD, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+8092, 186},
    {I_VFMSUBADDPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+8100, 186},
    {I_VFMSUBADDPD, 4, {YMM_L16,YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0}, NO_DECORATOR, nasm_bytecodes+8108, 186},
    {I_VFMSUBADDPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+8116, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBADDPS[] = {
    {I_VFMSUBADDPS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8124, 186},
    {I_VFMSUBADDPS, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8132, 186},
    {I_VFMSUBADDPS, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8140, 186},
    {I_VFMSUBADDPS, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8148, 186},
    {I_VFMSUBADDPS, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+8156, 186},
    {I_VFMSUBADDPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+8164, 186},
    {I_VFMSUBADDPS, 4, {YMM_L16,YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0}, NO_DECORATOR, nasm_bytecodes+8172, 186},
    {I_VFMSUBADDPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+8180, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBPD[] = {
    {I_VFMSUBPD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8188, 186},
    {I_VFMSUBPD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8196, 186},
    {I_VFMSUBPD, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8204, 186},
    {I_VFMSUBPD, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8212, 186},
    {I_VFMSUBPD, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+8220, 186},
    {I_VFMSUBPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+8228, 186},
    {I_VFMSUBPD, 4, {YMM_L16,YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0}, NO_DECORATOR, nasm_bytecodes+8236, 186},
    {I_VFMSUBPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+8244, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBPS[] = {
    {I_VFMSUBPS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8252, 186},
    {I_VFMSUBPS, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8260, 186},
    {I_VFMSUBPS, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8268, 186},
    {I_VFMSUBPS, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8276, 186},
    {I_VFMSUBPS, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+8284, 186},
    {I_VFMSUBPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+8292, 186},
    {I_VFMSUBPS, 4, {YMM_L16,YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0}, NO_DECORATOR, nasm_bytecodes+8300, 186},
    {I_VFMSUBPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+8308, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBSD[] = {
    {I_VFMSUBSD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8316, 186},
    {I_VFMSUBSD, 3, {XMM_L16,RM_XMM_L16|BITS64,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8324, 186},
    {I_VFMSUBSD, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0}, NO_DECORATOR, nasm_bytecodes+8332, 186},
    {I_VFMSUBSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+8340, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFMSUBSS[] = {
    {I_VFMSUBSS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8348, 186},
    {I_VFMSUBSS, 3, {XMM_L16,RM_XMM_L16|BITS32,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8356, 186},
    {I_VFMSUBSS, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0}, NO_DECORATOR, nasm_bytecodes+8364, 186},
    {I_VFMSUBSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+8372, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD123PD[] = {
    {I_VFNMADD123PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18362, 181},
    {I_VFNMADD123PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18369, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD123PS[] = {
    {I_VFNMADD123PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18348, 181},
    {I_VFNMADD123PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18355, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD123SD[] = {
    {I_VFNMADD123SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18593, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD123SS[] = {
    {I_VFNMADD123SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18586, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD132PD[] = {
    {I_VFNMADD132PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18334, 181},
    {I_VFNMADD132PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18341, 181},
    {I_VFNMADD132PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10556, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD132PS[] = {
    {I_VFNMADD132PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18320, 181},
    {I_VFNMADD132PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18327, 181},
    {I_VFNMADD132PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10564, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD132SD[] = {
    {I_VFNMADD132SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18579, 181},
    {I_VFNMADD132SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10572, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD132SS[] = {
    {I_VFNMADD132SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18572, 181},
    {I_VFNMADD132SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10580, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD213PD[] = {
    {I_VFNMADD213PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18362, 181},
    {I_VFNMADD213PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18369, 181},
    {I_VFNMADD213PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10588, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD213PS[] = {
    {I_VFNMADD213PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18348, 181},
    {I_VFNMADD213PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18355, 181},
    {I_VFNMADD213PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10596, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD213SD[] = {
    {I_VFNMADD213SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18593, 181},
    {I_VFNMADD213SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10604, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD213SS[] = {
    {I_VFNMADD213SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18586, 181},
    {I_VFNMADD213SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10612, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD231PD[] = {
    {I_VFNMADD231PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18390, 181},
    {I_VFNMADD231PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18397, 181},
    {I_VFNMADD231PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10620, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD231PS[] = {
    {I_VFNMADD231PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18376, 181},
    {I_VFNMADD231PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18383, 181},
    {I_VFNMADD231PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10628, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD231SD[] = {
    {I_VFNMADD231SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18607, 181},
    {I_VFNMADD231SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10636, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD231SS[] = {
    {I_VFNMADD231SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18600, 181},
    {I_VFNMADD231SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10644, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD312PD[] = {
    {I_VFNMADD312PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18334, 181},
    {I_VFNMADD312PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18341, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD312PS[] = {
    {I_VFNMADD312PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18320, 181},
    {I_VFNMADD312PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18327, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD312SD[] = {
    {I_VFNMADD312SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18579, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD312SS[] = {
    {I_VFNMADD312SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18572, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD321PD[] = {
    {I_VFNMADD321PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18390, 181},
    {I_VFNMADD321PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18397, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD321PS[] = {
    {I_VFNMADD321PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18376, 181},
    {I_VFNMADD321PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18383, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD321SD[] = {
    {I_VFNMADD321SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18607, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADD321SS[] = {
    {I_VFNMADD321SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18600, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADDPD[] = {
    {I_VFNMADDPD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8380, 186},
    {I_VFNMADDPD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8388, 186},
    {I_VFNMADDPD, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8396, 186},
    {I_VFNMADDPD, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8404, 186},
    {I_VFNMADDPD, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+8412, 186},
    {I_VFNMADDPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+8420, 186},
    {I_VFNMADDPD, 4, {YMM_L16,YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0}, NO_DECORATOR, nasm_bytecodes+8428, 186},
    {I_VFNMADDPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+8436, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADDPS[] = {
    {I_VFNMADDPS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8444, 186},
    {I_VFNMADDPS, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8452, 186},
    {I_VFNMADDPS, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8460, 186},
    {I_VFNMADDPS, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8468, 186},
    {I_VFNMADDPS, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+8476, 186},
    {I_VFNMADDPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+8484, 186},
    {I_VFNMADDPS, 4, {YMM_L16,YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0}, NO_DECORATOR, nasm_bytecodes+8492, 186},
    {I_VFNMADDPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+8500, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADDSD[] = {
    {I_VFNMADDSD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8508, 186},
    {I_VFNMADDSD, 3, {XMM_L16,RM_XMM_L16|BITS64,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8516, 186},
    {I_VFNMADDSD, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0}, NO_DECORATOR, nasm_bytecodes+8524, 186},
    {I_VFNMADDSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+8532, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMADDSS[] = {
    {I_VFNMADDSS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8540, 186},
    {I_VFNMADDSS, 3, {XMM_L16,RM_XMM_L16|BITS32,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8548, 186},
    {I_VFNMADDSS, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0}, NO_DECORATOR, nasm_bytecodes+8556, 186},
    {I_VFNMADDSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+8564, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB123PD[] = {
    {I_VFNMSUB123PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18446, 181},
    {I_VFNMSUB123PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18453, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB123PS[] = {
    {I_VFNMSUB123PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18432, 181},
    {I_VFNMSUB123PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18439, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB123SD[] = {
    {I_VFNMSUB123SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18635, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB123SS[] = {
    {I_VFNMSUB123SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18628, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB132PD[] = {
    {I_VFNMSUB132PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18418, 181},
    {I_VFNMSUB132PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18425, 181},
    {I_VFNMSUB132PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10652, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB132PS[] = {
    {I_VFNMSUB132PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18404, 181},
    {I_VFNMSUB132PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18411, 181},
    {I_VFNMSUB132PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10660, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB132SD[] = {
    {I_VFNMSUB132SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18621, 181},
    {I_VFNMSUB132SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10668, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB132SS[] = {
    {I_VFNMSUB132SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18614, 181},
    {I_VFNMSUB132SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10676, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB213PD[] = {
    {I_VFNMSUB213PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18446, 181},
    {I_VFNMSUB213PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18453, 181},
    {I_VFNMSUB213PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10684, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB213PS[] = {
    {I_VFNMSUB213PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18432, 181},
    {I_VFNMSUB213PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18439, 181},
    {I_VFNMSUB213PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10692, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB213SD[] = {
    {I_VFNMSUB213SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18635, 181},
    {I_VFNMSUB213SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10700, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB213SS[] = {
    {I_VFNMSUB213SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18628, 181},
    {I_VFNMSUB213SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10708, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB231PD[] = {
    {I_VFNMSUB231PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18474, 181},
    {I_VFNMSUB231PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18481, 181},
    {I_VFNMSUB231PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+10716, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB231PS[] = {
    {I_VFNMSUB231PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18460, 181},
    {I_VFNMSUB231PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18467, 181},
    {I_VFNMSUB231PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+10724, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB231SD[] = {
    {I_VFNMSUB231SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18649, 181},
    {I_VFNMSUB231SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10732, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB231SS[] = {
    {I_VFNMSUB231SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18642, 181},
    {I_VFNMSUB231SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+10740, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB312PD[] = {
    {I_VFNMSUB312PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18418, 181},
    {I_VFNMSUB312PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18425, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB312PS[] = {
    {I_VFNMSUB312PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18404, 181},
    {I_VFNMSUB312PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18411, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB312SD[] = {
    {I_VFNMSUB312SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18621, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB312SS[] = {
    {I_VFNMSUB312SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18614, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB321PD[] = {
    {I_VFNMSUB321PD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18474, 181},
    {I_VFNMSUB321PD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18481, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB321PS[] = {
    {I_VFNMSUB321PS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+18460, 181},
    {I_VFNMSUB321PS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+18467, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB321SD[] = {
    {I_VFNMSUB321SD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+18649, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUB321SS[] = {
    {I_VFNMSUB321SS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+18642, 181},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUBPD[] = {
    {I_VFNMSUBPD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8572, 186},
    {I_VFNMSUBPD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8580, 186},
    {I_VFNMSUBPD, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8588, 186},
    {I_VFNMSUBPD, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8596, 186},
    {I_VFNMSUBPD, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+8604, 186},
    {I_VFNMSUBPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+8612, 186},
    {I_VFNMSUBPD, 4, {YMM_L16,YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0}, NO_DECORATOR, nasm_bytecodes+8620, 186},
    {I_VFNMSUBPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+8628, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUBPS[] = {
    {I_VFNMSUBPS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8636, 186},
    {I_VFNMSUBPS, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8644, 186},
    {I_VFNMSUBPS, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8652, 186},
    {I_VFNMSUBPS, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8660, 186},
    {I_VFNMSUBPS, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+8668, 186},
    {I_VFNMSUBPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+8676, 186},
    {I_VFNMSUBPS, 4, {YMM_L16,YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0}, NO_DECORATOR, nasm_bytecodes+8684, 186},
    {I_VFNMSUBPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+8692, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUBSD[] = {
    {I_VFNMSUBSD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8700, 186},
    {I_VFNMSUBSD, 3, {XMM_L16,RM_XMM_L16|BITS64,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8708, 186},
    {I_VFNMSUBSD, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0}, NO_DECORATOR, nasm_bytecodes+8716, 186},
    {I_VFNMSUBSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+8724, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFNMSUBSS[] = {
    {I_VFNMSUBSS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8732, 186},
    {I_VFNMSUBSS, 3, {XMM_L16,RM_XMM_L16|BITS32,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8740, 186},
    {I_VFNMSUBSS, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0}, NO_DECORATOR, nasm_bytecodes+8748, 186},
    {I_VFNMSUBSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+8756, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFRCZPD[] = {
    {I_VFRCZPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18754, 186},
    {I_VFRCZPD, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18761, 186},
    {I_VFRCZPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+18768, 186},
    {I_VFRCZPD, 1, {YMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18775, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFRCZPS[] = {
    {I_VFRCZPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18782, 186},
    {I_VFRCZPS, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18789, 186},
    {I_VFRCZPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+18796, 186},
    {I_VFRCZPS, 1, {YMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18803, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFRCZSD[] = {
    {I_VFRCZSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+18810, 186},
    {I_VFRCZSD, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18817, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VFRCZSS[] = {
    {I_VFRCZSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+18824, 186},
    {I_VFRCZSS, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18831, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGATHERDPD[] = {
    {I_VGATHERDPD, 3, {XMM_L16,XMEM|BITS64,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9572, 187},
    {I_VGATHERDPD, 3, {YMM_L16,XMEM|BITS64,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9588, 187},
    {I_VGATHERDPD, 2, {ZMMREG,YMEM|BITS64,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5316, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGATHERDPS[] = {
    {I_VGATHERDPS, 3, {XMM_L16,XMEM|BITS32,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9604, 187},
    {I_VGATHERDPS, 3, {YMM_L16,YMEM|BITS32,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9620, 187},
    {I_VGATHERDPS, 2, {ZMMREG,ZMEM|BITS32,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5325, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGATHERPF0DPD[] = {
    {I_VGATHERPF0DPD, 1, {YMEM|BITS64,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5820, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGATHERPF0DPS[] = {
    {I_VGATHERPF0DPS, 1, {ZMEM|BITS32,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5829, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGATHERPF0QPD[] = {
    {I_VGATHERPF0QPD, 1, {ZMEM|BITS64,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5838, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGATHERPF0QPS[] = {
    {I_VGATHERPF0QPS, 1, {ZMEM|BITS32,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5847, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGATHERPF1DPD[] = {
    {I_VGATHERPF1DPD, 1, {YMEM|BITS64,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5856, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGATHERPF1DPS[] = {
    {I_VGATHERPF1DPS, 1, {ZMEM|BITS32,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5865, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGATHERPF1QPD[] = {
    {I_VGATHERPF1QPD, 1, {ZMEM|BITS64,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5874, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGATHERPF1QPS[] = {
    {I_VGATHERPF1QPS, 1, {ZMEM|BITS32,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5883, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGATHERQPD[] = {
    {I_VGATHERQPD, 3, {XMM_L16,XMEM|BITS64,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9580, 187},
    {I_VGATHERQPD, 3, {YMM_L16,YMEM|BITS64,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9596, 187},
    {I_VGATHERQPD, 2, {ZMMREG,ZMEM|BITS64,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5334, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGATHERQPS[] = {
    {I_VGATHERQPS, 3, {XMM_L16,XMEM|BITS32,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9612, 187},
    {I_VGATHERQPS, 3, {XMM_L16,YMEM|BITS32,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9628, 187},
    {I_VGATHERQPS, 2, {YMMREG,ZMEM|BITS32,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5343, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGETEXPPD[] = {
    {I_VGETEXPPD, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64|SAE,0,0,0}, nasm_bytecodes+10748, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGETEXPPS[] = {
    {I_VGETEXPPS, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32|SAE,0,0,0}, nasm_bytecodes+10756, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGETEXPSD[] = {
    {I_VGETEXPSD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+10764, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGETEXPSS[] = {
    {I_VGETEXPSS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+10772, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGETMANTPD[] = {
    {I_VGETMANTPD, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B64|SAE,0,0,0}, nasm_bytecodes+5352, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGETMANTPS[] = {
    {I_VGETMANTPS, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B32|SAE,0,0,0}, nasm_bytecodes+5361, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGETMANTSD[] = {
    {I_VGETMANTSD, 4, {XMMREG,XMMREG,RM_XMM|BITS64,IMMEDIATE|BITS8,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+5370, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VGETMANTSS[] = {
    {I_VGETMANTSS, 4, {XMMREG,XMMREG,RM_XMM|BITS32,IMMEDIATE|BITS8,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+5379, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VHADDPD[] = {
    {I_VHADDPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+15261, 174},
    {I_VHADDPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15268, 174},
    {I_VHADDPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+15275, 174},
    {I_VHADDPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15282, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VHADDPS[] = {
    {I_VHADDPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+15289, 174},
    {I_VHADDPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15296, 174},
    {I_VHADDPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+15303, 174},
    {I_VHADDPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15310, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VHSUBPD[] = {
    {I_VHSUBPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+15317, 174},
    {I_VHSUBPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15324, 174},
    {I_VHSUBPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+15331, 174},
    {I_VHSUBPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15338, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VHSUBPS[] = {
    {I_VHSUBPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+15345, 174},
    {I_VHSUBPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15352, 174},
    {I_VHSUBPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+15359, 174},
    {I_VHSUBPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15366, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VINSERTF128[] = {
    {I_VINSERTF128, 4, {YMM_L16,YMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7060, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VINSERTF32X4[] = {
    {I_VINSERTF32X4, 4, {ZMMREG,ZMMREG,RM_XMM|BITS128,IMMEDIATE|BITS8,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+5388, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VINSERTF64X4[] = {
    {I_VINSERTF64X4, 4, {ZMMREG,ZMMREG,RM_YMM|BITS256,IMMEDIATE|BITS8,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+5397, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VINSERTI128[] = {
    {I_VINSERTI128, 4, {YMM_L16,YMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+9556, 187},
    {I_VINSERTI128, 3, {YMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9564, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VINSERTI32X4[] = {
    {I_VINSERTI32X4, 4, {ZMMREG,ZMMREG,RM_XMM|BITS128,IMMEDIATE|BITS8,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+5406, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VINSERTI64X4[] = {
    {I_VINSERTI64X4, 4, {ZMMREG,ZMMREG,RM_YMM|BITS256,IMMEDIATE|BITS8,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+5415, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VINSERTPS[] = {
    {I_VINSERTPS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7068, 174},
    {I_VINSERTPS, 3, {XMM_L16,RM_XMM_L16|BITS32,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7076, 174},
    {I_VINSERTPS, 4, {XMMREG,XMMREG,RM_XMM|BITS32,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+5424, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VLDDQU[] = {
    {I_VLDDQU, 2, {XMM_L16,MEMORY|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15373, 174},
    {I_VLDDQU, 2, {YMM_L16,MEMORY|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15380, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VLDMXCSR[] = {
    {I_VLDMXCSR, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+15387, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VLDQQU[] = {
    {I_VLDQQU, 2, {YMM_L16,MEMORY|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15380, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMASKMOVDQU[] = {
    {I_VMASKMOVDQU, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15394, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMASKMOVPD[] = {
    {I_VMASKMOVPD, 3, {XMM_L16,XMM_L16,MEMORY|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+15429, 174},
    {I_VMASKMOVPD, 3, {YMM_L16,YMM_L16,MEMORY|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+15436, 174},
    {I_VMASKMOVPD, 3, {MEMORY|BITS128,XMM_L16,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+15443, 174},
    {I_VMASKMOVPD, 3, {MEMORY|BITS256,YMM_L16,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+15450, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMASKMOVPS[] = {
    {I_VMASKMOVPS, 3, {XMM_L16,XMM_L16,MEMORY|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+15401, 174},
    {I_VMASKMOVPS, 3, {YMM_L16,YMM_L16,MEMORY|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+15408, 174},
    {I_VMASKMOVPS, 3, {MEMORY|BITS128,XMM_L16,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+15415, 175},
    {I_VMASKMOVPS, 3, {MEMORY|BITS256,YMM_L16,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+15422, 176},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMAXPD[] = {
    {I_VMAXPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+15457, 174},
    {I_VMAXPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15464, 174},
    {I_VMAXPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+15471, 174},
    {I_VMAXPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15478, 174},
    {I_VMAXPD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|SAE,0,0}, nasm_bytecodes+10780, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMAXPS[] = {
    {I_VMAXPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+15485, 174},
    {I_VMAXPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15492, 174},
    {I_VMAXPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+15499, 174},
    {I_VMAXPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15506, 174},
    {I_VMAXPS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|SAE,0,0}, nasm_bytecodes+10788, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMAXSD[] = {
    {I_VMAXSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+15513, 174},
    {I_VMAXSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15520, 174},
    {I_VMAXSD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+10796, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMAXSS[] = {
    {I_VMAXSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+15527, 174},
    {I_VMAXSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+15534, 174},
    {I_VMAXSS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+10804, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMCALL[] = {
    {I_VMCALL, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26703, 149},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMCLEAR[] = {
    {I_VMCLEAR, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23659, 149},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMFUNC[] = {
    {I_VMFUNC, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26708, 149},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMINPD[] = {
    {I_VMINPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+15541, 174},
    {I_VMINPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15548, 174},
    {I_VMINPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+15555, 174},
    {I_VMINPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15562, 174},
    {I_VMINPD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|SAE,0,0}, nasm_bytecodes+10812, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMINPS[] = {
    {I_VMINPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+15569, 174},
    {I_VMINPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15576, 174},
    {I_VMINPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+15583, 174},
    {I_VMINPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15590, 174},
    {I_VMINPS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|SAE,0,0}, nasm_bytecodes+10820, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMINSD[] = {
    {I_VMINSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+15597, 174},
    {I_VMINSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15604, 174},
    {I_VMINSD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+10828, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMINSS[] = {
    {I_VMINSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+15611, 174},
    {I_VMINSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+15618, 174},
    {I_VMINSS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+10836, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMLAUNCH[] = {
    {I_VMLAUNCH, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26713, 149},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMLOAD[] = {
    {I_VMLOAD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26718, 148},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMMCALL[] = {
    {I_VMMCALL, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26723, 148},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVAPD[] = {
    {I_VMOVAPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15625, 174},
    {I_VMOVAPD, 2, {RM_XMM_L16|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15632, 174},
    {I_VMOVAPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15639, 174},
    {I_VMOVAPD, 2, {RM_YMM_L16|BITS256,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15646, 174},
    {I_VMOVAPD, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10844, 200},
    {I_VMOVAPD, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+10852, 200},
    {I_VMOVAPD, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10860, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVAPS[] = {
    {I_VMOVAPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15653, 174},
    {I_VMOVAPS, 2, {RM_XMM_L16|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15660, 174},
    {I_VMOVAPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15667, 174},
    {I_VMOVAPS, 2, {RM_YMM_L16|BITS256,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15674, 174},
    {I_VMOVAPS, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10868, 200},
    {I_VMOVAPS, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10876, 200},
    {I_VMOVAPS, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+10884, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVD[] = {
    {I_VMOVD, 2, {XMM_L16,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+15681, 174},
    {I_VMOVD, 2, {RM_GPR|BITS32,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15688, 174},
    {I_VMOVD, 2, {XMMREG,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+10892, 200},
    {I_VMOVD, 2, {RM_GPR|BITS32,XMMREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+10900, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVDDUP[] = {
    {I_VMOVDDUP, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15723, 174},
    {I_VMOVDDUP, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15730, 174},
    {I_VMOVDDUP, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10908, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVDQA[] = {
    {I_VMOVDQA, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15737, 174},
    {I_VMOVDQA, 2, {RM_XMM_L16|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15744, 174},
    {I_VMOVDQA, 2, {YMM_L16,RM_YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15751, 174},
    {I_VMOVDQA, 2, {RM_YMM_L16|BITS256,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15758, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVDQA32[] = {
    {I_VMOVDQA32, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10916, 200},
    {I_VMOVDQA32, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+10924, 200},
    {I_VMOVDQA32, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10932, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVDQA64[] = {
    {I_VMOVDQA64, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10940, 200},
    {I_VMOVDQA64, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10948, 200},
    {I_VMOVDQA64, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+10956, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVDQU[] = {
    {I_VMOVDQU, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15765, 174},
    {I_VMOVDQU, 2, {RM_XMM_L16|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15772, 174},
    {I_VMOVDQU, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15779, 174},
    {I_VMOVDQU, 2, {RM_YMM_L16|BITS256,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15786, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVDQU32[] = {
    {I_VMOVDQU32, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10964, 200},
    {I_VMOVDQU32, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+10972, 200},
    {I_VMOVDQU32, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10980, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVDQU64[] = {
    {I_VMOVDQU64, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+10988, 200},
    {I_VMOVDQU64, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+10996, 200},
    {I_VMOVDQU64, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11004, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVHLPS[] = {
    {I_VMOVHLPS, 3, {XMM_L16,XMM_L16,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+15793, 174},
    {I_VMOVHLPS, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15800, 174},
    {I_VMOVHLPS, 3, {XMMREG,XMMREG,XMMREG,0,0}, NO_DECORATOR, nasm_bytecodes+11012, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVHPD[] = {
    {I_VMOVHPD, 3, {XMM_L16,XMM_L16,MEMORY|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+15807, 174},
    {I_VMOVHPD, 2, {XMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15814, 174},
    {I_VMOVHPD, 2, {MEMORY|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15821, 174},
    {I_VMOVHPD, 3, {XMMREG,XMMREG,MEMORY|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+11020, 200},
    {I_VMOVHPD, 2, {MEMORY|BITS64,XMMREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+11028, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVHPS[] = {
    {I_VMOVHPS, 3, {XMM_L16,XMM_L16,MEMORY|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+15828, 174},
    {I_VMOVHPS, 2, {XMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15835, 174},
    {I_VMOVHPS, 2, {MEMORY|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15842, 174},
    {I_VMOVHPS, 3, {XMMREG,XMMREG,MEMORY|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+11036, 200},
    {I_VMOVHPS, 2, {MEMORY|BITS64,XMMREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+11044, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVLHPS[] = {
    {I_VMOVLHPS, 3, {XMM_L16,XMM_L16,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+15828, 174},
    {I_VMOVLHPS, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15835, 174},
    {I_VMOVLHPS, 3, {XMMREG,XMMREG,XMMREG,0,0}, NO_DECORATOR, nasm_bytecodes+11052, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVLPD[] = {
    {I_VMOVLPD, 3, {XMM_L16,XMM_L16,MEMORY|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+15849, 174},
    {I_VMOVLPD, 2, {XMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15856, 174},
    {I_VMOVLPD, 2, {MEMORY|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15863, 174},
    {I_VMOVLPD, 3, {XMMREG,XMMREG,MEMORY|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+11060, 200},
    {I_VMOVLPD, 2, {MEMORY|BITS64,XMMREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+11068, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVLPS[] = {
    {I_VMOVLPS, 3, {XMM_L16,XMM_L16,MEMORY|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+15793, 174},
    {I_VMOVLPS, 2, {XMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15800, 174},
    {I_VMOVLPS, 2, {MEMORY|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15870, 174},
    {I_VMOVLPS, 3, {XMMREG,XMMREG,MEMORY|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+11076, 200},
    {I_VMOVLPS, 2, {MEMORY|BITS64,XMMREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+11084, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVMSKPD[] = {
    {I_VMOVMSKPD, 2, {REG_GPR|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15877, 177},
    {I_VMOVMSKPD, 2, {REG_GPR|BITS32,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15877, 174},
    {I_VMOVMSKPD, 2, {REG_GPR|BITS64,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15884, 177},
    {I_VMOVMSKPD, 2, {REG_GPR|BITS32,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15884, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVMSKPS[] = {
    {I_VMOVMSKPS, 2, {REG_GPR|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15891, 177},
    {I_VMOVMSKPS, 2, {REG_GPR|BITS32,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15891, 174},
    {I_VMOVMSKPS, 2, {REG_GPR|BITS64,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15898, 177},
    {I_VMOVMSKPS, 2, {REG_GPR|BITS32,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15898, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVNTDQ[] = {
    {I_VMOVNTDQ, 2, {MEMORY|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15905, 174},
    {I_VMOVNTDQ, 2, {MEMORY|BITS256,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15912, 174},
    {I_VMOVNTDQ, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+11092, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVNTDQA[] = {
    {I_VMOVNTDQA, 2, {XMM_L16,MEMORY|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15919, 174},
    {I_VMOVNTDQA, 2, {YMM_L16,MEMORY|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20644, 187},
    {I_VMOVNTDQA, 2, {ZMMREG,MEMORY|BITS512,0,0,0}, NO_DECORATOR, nasm_bytecodes+11100, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVNTPD[] = {
    {I_VMOVNTPD, 2, {MEMORY|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15926, 174},
    {I_VMOVNTPD, 2, {MEMORY|BITS256,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15933, 174},
    {I_VMOVNTPD, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+11108, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVNTPS[] = {
    {I_VMOVNTPS, 2, {MEMORY|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15940, 174},
    {I_VMOVNTPS, 2, {MEMORY|BITS128,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15947, 174},
    {I_VMOVNTPS, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+11116, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVNTQQ[] = {
    {I_VMOVNTQQ, 2, {MEMORY|BITS256,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15912, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVQ[] = {
    {I_VMOVQ, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15695, 180},
    {I_VMOVQ, 2, {RM_XMM_L16|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15702, 180},
    {I_VMOVQ, 2, {XMM_L16,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15709, 179},
    {I_VMOVQ, 2, {RM_GPR|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15716, 179},
    {I_VMOVQ, 2, {XMMREG,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+11124, 200},
    {I_VMOVQ, 2, {RM_GPR|BITS64,XMMREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+11132, 200},
    {I_VMOVQ, 2, {XMMREG,RM_XMM|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+11140, 200},
    {I_VMOVQ, 2, {RM_XMM|BITS64,XMMREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+11148, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVQQA[] = {
    {I_VMOVQQA, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15751, 174},
    {I_VMOVQQA, 2, {RM_YMM_L16|BITS256,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15758, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVQQU[] = {
    {I_VMOVQQU, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+15779, 174},
    {I_VMOVQQU, 2, {RM_YMM_L16|BITS256,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15786, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVSD[] = {
    {I_VMOVSD, 3, {XMM_L16,XMM_L16,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+15954, 174},
    {I_VMOVSD, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15961, 174},
    {I_VMOVSD, 2, {XMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+15968, 174},
    {I_VMOVSD, 3, {XMM_L16,XMM_L16,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+15975, 174},
    {I_VMOVSD, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15982, 174},
    {I_VMOVSD, 2, {MEMORY|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+15989, 174},
    {I_VMOVSD, 3, {XMMREG,XMMREG,XMMREG,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11156, 200},
    {I_VMOVSD, 2, {XMMREG,MEMORY|BITS64,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11164, 200},
    {I_VMOVSD, 2, {MEMORY|BITS64,XMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11172, 200},
    {I_VMOVSD, 3, {XMMREG,XMMREG,XMMREG,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11180, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVSHDUP[] = {
    {I_VMOVSHDUP, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+15996, 174},
    {I_VMOVSHDUP, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+16003, 174},
    {I_VMOVSHDUP, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11188, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVSLDUP[] = {
    {I_VMOVSLDUP, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16010, 174},
    {I_VMOVSLDUP, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+16017, 174},
    {I_VMOVSLDUP, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11196, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVSS[] = {
    {I_VMOVSS, 3, {XMM_L16,XMM_L16,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+16024, 174},
    {I_VMOVSS, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+16031, 174},
    {I_VMOVSS, 2, {XMM_L16,MEMORY|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+16038, 174},
    {I_VMOVSS, 3, {XMM_L16,XMM_L16,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+16045, 174},
    {I_VMOVSS, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+16052, 174},
    {I_VMOVSS, 2, {MEMORY|BITS32,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+16059, 174},
    {I_VMOVSS, 2, {XMMREG,MEMORY|BITS32,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11204, 200},
    {I_VMOVSS, 3, {XMMREG,XMMREG,XMMREG,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11212, 200},
    {I_VMOVSS, 2, {MEMORY|BITS32,XMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11220, 200},
    {I_VMOVSS, 3, {XMMREG,XMMREG,XMMREG,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11228, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVUPD[] = {
    {I_VMOVUPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16066, 174},
    {I_VMOVUPD, 2, {RM_XMM_L16|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+16073, 174},
    {I_VMOVUPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+16080, 174},
    {I_VMOVUPD, 2, {RM_YMM_L16|BITS256,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+16087, 174},
    {I_VMOVUPD, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11236, 200},
    {I_VMOVUPD, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11244, 200},
    {I_VMOVUPD, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11252, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMOVUPS[] = {
    {I_VMOVUPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16094, 174},
    {I_VMOVUPS, 2, {RM_XMM_L16|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+16101, 174},
    {I_VMOVUPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+16108, 174},
    {I_VMOVUPS, 2, {RM_YMM_L16|BITS256,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+16115, 174},
    {I_VMOVUPS, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11260, 200},
    {I_VMOVUPS, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11268, 200},
    {I_VMOVUPS, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11276, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMPSADBW[] = {
    {I_VMPSADBW, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7084, 174},
    {I_VMPSADBW, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7092, 174},
    {I_VMPSADBW, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+9244, 187},
    {I_VMPSADBW, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9252, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMPTRLD[] = {
    {I_VMPTRLD, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23665, 149},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMPTRST[] = {
    {I_VMPTRST, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23671, 149},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMREAD[] = {
    {I_VMREAD, 2, {RM_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+14051, 150},
    {I_VMREAD, 2, {RM_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+14050, 151},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMRESUME[] = {
    {I_VMRESUME, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26728, 149},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMRUN[] = {
    {I_VMRUN, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26733, 148},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMSAVE[] = {
    {I_VMSAVE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26738, 148},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMULPD[] = {
    {I_VMULPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16122, 174},
    {I_VMULPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16129, 174},
    {I_VMULPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+16136, 174},
    {I_VMULPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+16143, 174},
    {I_VMULPD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+11284, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMULPS[] = {
    {I_VMULPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16150, 174},
    {I_VMULPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16157, 174},
    {I_VMULPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+16164, 174},
    {I_VMULPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+16171, 174},
    {I_VMULPS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+11292, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMULSD[] = {
    {I_VMULSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+16178, 174},
    {I_VMULSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+16185, 174},
    {I_VMULSD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+11300, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMULSS[] = {
    {I_VMULSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+16192, 174},
    {I_VMULSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+16199, 174},
    {I_VMULSS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+11308, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMWRITE[] = {
    {I_VMWRITE, 2, {REG_GPR|BITS32,RM_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+14058, 150},
    {I_VMWRITE, 2, {REG_GPR|BITS64,RM_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+14057, 151},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMXOFF[] = {
    {I_VMXOFF, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26743, 149},
    ITEMPLATE_END
};

static const struct itemplate instrux_VMXON[] = {
    {I_VMXON, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23677, 149},
    ITEMPLATE_END
};

static const struct itemplate instrux_VORPD[] = {
    {I_VORPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16206, 174},
    {I_VORPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16213, 174},
    {I_VORPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+16220, 174},
    {I_VORPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+16227, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VORPS[] = {
    {I_VORPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16234, 174},
    {I_VORPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16241, 174},
    {I_VORPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+16248, 174},
    {I_VORPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+16255, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPABSB[] = {
    {I_VPABSB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16262, 174},
    {I_VPABSB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19384, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPABSD[] = {
    {I_VPABSD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16276, 174},
    {I_VPABSD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19398, 187},
    {I_VPABSD, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32,0,0,0}, nasm_bytecodes+11316, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPABSQ[] = {
    {I_VPABSQ, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64,0,0,0}, nasm_bytecodes+11324, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPABSW[] = {
    {I_VPABSW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16269, 174},
    {I_VPABSW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19391, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPACKSSDW[] = {
    {I_VPACKSSDW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16297, 174},
    {I_VPACKSSDW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16304, 174},
    {I_VPACKSSDW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19419, 187},
    {I_VPACKSSDW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19426, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPACKSSWB[] = {
    {I_VPACKSSWB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16283, 174},
    {I_VPACKSSWB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16290, 174},
    {I_VPACKSSWB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19405, 187},
    {I_VPACKSSWB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19412, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPACKUSDW[] = {
    {I_VPACKUSDW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16325, 174},
    {I_VPACKUSDW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16332, 174},
    {I_VPACKUSDW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19433, 187},
    {I_VPACKUSDW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19440, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPACKUSWB[] = {
    {I_VPACKUSWB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16311, 174},
    {I_VPACKUSWB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16318, 174},
    {I_VPACKUSWB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19447, 187},
    {I_VPACKUSWB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19454, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPADDB[] = {
    {I_VPADDB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16339, 174},
    {I_VPADDB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16346, 174},
    {I_VPADDB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19461, 187},
    {I_VPADDB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19468, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPADDD[] = {
    {I_VPADDD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16367, 174},
    {I_VPADDD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16374, 174},
    {I_VPADDD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19489, 187},
    {I_VPADDD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19496, 187},
    {I_VPADDD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11332, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPADDQ[] = {
    {I_VPADDQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16381, 174},
    {I_VPADDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16388, 174},
    {I_VPADDQ, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19503, 187},
    {I_VPADDQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19510, 187},
    {I_VPADDQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11340, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPADDSB[] = {
    {I_VPADDSB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16395, 174},
    {I_VPADDSB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16402, 174},
    {I_VPADDSB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19517, 187},
    {I_VPADDSB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19524, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPADDSW[] = {
    {I_VPADDSW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16409, 174},
    {I_VPADDSW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16416, 174},
    {I_VPADDSW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19531, 187},
    {I_VPADDSW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19538, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPADDUSB[] = {
    {I_VPADDUSB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16423, 174},
    {I_VPADDUSB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16430, 174},
    {I_VPADDUSB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19545, 187},
    {I_VPADDUSB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19552, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPADDUSW[] = {
    {I_VPADDUSW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16437, 174},
    {I_VPADDUSW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16444, 174},
    {I_VPADDUSW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19559, 187},
    {I_VPADDUSW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19566, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPADDW[] = {
    {I_VPADDW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16353, 174},
    {I_VPADDW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16360, 174},
    {I_VPADDW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19475, 187},
    {I_VPADDW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19482, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPALIGNR[] = {
    {I_VPALIGNR, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7100, 174},
    {I_VPALIGNR, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7108, 174},
    {I_VPALIGNR, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+9260, 187},
    {I_VPALIGNR, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9268, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPAND[] = {
    {I_VPAND, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16451, 174},
    {I_VPAND, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16458, 174},
    {I_VPAND, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19573, 187},
    {I_VPAND, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19580, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPANDD[] = {
    {I_VPANDD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11348, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPANDN[] = {
    {I_VPANDN, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16465, 174},
    {I_VPANDN, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16472, 174},
    {I_VPANDN, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19587, 187},
    {I_VPANDN, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19594, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPANDND[] = {
    {I_VPANDND, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11356, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPANDNQ[] = {
    {I_VPANDNQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11364, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPANDQ[] = {
    {I_VPANDQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11372, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPAVGB[] = {
    {I_VPAVGB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16479, 174},
    {I_VPAVGB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16486, 174},
    {I_VPAVGB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19601, 187},
    {I_VPAVGB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19608, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPAVGW[] = {
    {I_VPAVGW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16493, 174},
    {I_VPAVGW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16500, 174},
    {I_VPAVGW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19615, 187},
    {I_VPAVGW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19622, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPBLENDD[] = {
    {I_VPBLENDD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+9492, 187},
    {I_VPBLENDD, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9500, 187},
    {I_VPBLENDD, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+9508, 187},
    {I_VPBLENDD, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9516, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPBLENDMD[] = {
    {I_VPBLENDMD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11380, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPBLENDMQ[] = {
    {I_VPBLENDMQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11388, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPBLENDVB[] = {
    {I_VPBLENDVB, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+7116, 174},
    {I_VPBLENDVB, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+7124, 174},
    {I_VPBLENDVB, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+9276, 187},
    {I_VPBLENDVB, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9284, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPBLENDW[] = {
    {I_VPBLENDW, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7132, 174},
    {I_VPBLENDW, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7140, 174},
    {I_VPBLENDW, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+9292, 187},
    {I_VPBLENDW, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9300, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPBROADCASTB[] = {
    {I_VPBROADCASTB, 2, {XMM_L16,MEMORY|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+20658, 187},
    {I_VPBROADCASTB, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20658, 187},
    {I_VPBROADCASTB, 2, {YMM_L16,MEMORY|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+20665, 187},
    {I_VPBROADCASTB, 2, {YMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20665, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPBROADCASTD[] = {
    {I_VPBROADCASTD, 2, {XMM_L16,MEMORY|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+20686, 187},
    {I_VPBROADCASTD, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20686, 187},
    {I_VPBROADCASTD, 2, {YMM_L16,MEMORY|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+20693, 187},
    {I_VPBROADCASTD, 2, {YMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20693, 187},
    {I_VPBROADCASTD, 2, {ZMMREG,XMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11396, 200},
    {I_VPBROADCASTD, 2, {ZMMREG,MEMORY|BITS32,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11404, 200},
    {I_VPBROADCASTD, 2, {ZMMREG,REG_GPR|BITS32,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11412, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPBROADCASTMB2Q[] = {
    {I_VPBROADCASTMB2Q, 2, {ZMMREG,KREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+12508, 202},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPBROADCASTMW2D[] = {
    {I_VPBROADCASTMW2D, 2, {ZMMREG,KREG,0,0,0}, NO_DECORATOR, nasm_bytecodes+12516, 202},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPBROADCASTQ[] = {
    {I_VPBROADCASTQ, 2, {XMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+20700, 187},
    {I_VPBROADCASTQ, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20700, 187},
    {I_VPBROADCASTQ, 2, {YMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+20707, 187},
    {I_VPBROADCASTQ, 2, {YMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20707, 187},
    {I_VPBROADCASTQ, 2, {ZMMREG,XMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11420, 200},
    {I_VPBROADCASTQ, 2, {ZMMREG,MEMORY|BITS64,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11428, 200},
    {I_VPBROADCASTQ, 2, {ZMMREG,REG_GPR|BITS64,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11436, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPBROADCASTW[] = {
    {I_VPBROADCASTW, 2, {XMM_L16,MEMORY|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20672, 187},
    {I_VPBROADCASTW, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20672, 187},
    {I_VPBROADCASTW, 2, {YMM_L16,MEMORY|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20679, 187},
    {I_VPBROADCASTW, 2, {YMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20679, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCLMULHQHQDQ[] = {
    {I_VPCLMULHQHQDQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+5118, 174},
    {I_VPCLMULHQHQDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+5127, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCLMULHQLQDQ[] = {
    {I_VPCLMULHQLQDQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+5082, 174},
    {I_VPCLMULHQLQDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+5091, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCLMULLQHQDQ[] = {
    {I_VPCLMULLQHQDQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+5100, 174},
    {I_VPCLMULLQHQDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+5109, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCLMULLQLQDQ[] = {
    {I_VPCLMULLQLQDQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+5064, 174},
    {I_VPCLMULLQLQDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+5073, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCLMULQDQ[] = {
    {I_VPCLMULQDQ, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7644, 174},
    {I_VPCLMULQDQ, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7652, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMOV[] = {
    {I_VPCMOV, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8764, 186},
    {I_VPCMOV, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8772, 186},
    {I_VPCMOV, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8780, 186},
    {I_VPCMOV, 3, {YMM_L16,RM_YMM_L16|BITS256,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8788, 186},
    {I_VPCMOV, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+8796, 186},
    {I_VPCMOV, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+8804, 186},
    {I_VPCMOV, 4, {YMM_L16,YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0}, NO_DECORATOR, nasm_bytecodes+8812, 186},
    {I_VPCMOV, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+8820, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPD[] = {
    {I_VPCMPD, 4, {KREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK,0,B32,0,0}, nasm_bytecodes+5433, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPEQB[] = {
    {I_VPCMPEQB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16507, 174},
    {I_VPCMPEQB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16514, 174},
    {I_VPCMPEQB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19629, 187},
    {I_VPCMPEQB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19636, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPEQD[] = {
    {I_VPCMPEQD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16535, 174},
    {I_VPCMPEQD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16542, 174},
    {I_VPCMPEQD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19657, 187},
    {I_VPCMPEQD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19664, 187},
    {I_VPCMPEQD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+11444, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPEQQ[] = {
    {I_VPCMPEQQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16549, 174},
    {I_VPCMPEQQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16556, 174},
    {I_VPCMPEQQ, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19671, 187},
    {I_VPCMPEQQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19678, 187},
    {I_VPCMPEQQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+11452, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPEQUD[] = {
    {I_VPCMPEQUD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+1380, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPEQUQ[] = {
    {I_VPCMPEQUQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+1440, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPEQW[] = {
    {I_VPCMPEQW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16521, 174},
    {I_VPCMPEQW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16528, 174},
    {I_VPCMPEQW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19643, 187},
    {I_VPCMPEQW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19650, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPESTRI[] = {
    {I_VPCMPESTRI, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7148, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPESTRM[] = {
    {I_VPCMPESTRM, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7156, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPGTB[] = {
    {I_VPCMPGTB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16563, 174},
    {I_VPCMPGTB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16570, 174},
    {I_VPCMPGTB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19685, 187},
    {I_VPCMPGTB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19692, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPGTD[] = {
    {I_VPCMPGTD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16591, 174},
    {I_VPCMPGTD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16598, 174},
    {I_VPCMPGTD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19713, 187},
    {I_VPCMPGTD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19720, 187},
    {I_VPCMPGTD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+11460, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPGTQ[] = {
    {I_VPCMPGTQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16605, 174},
    {I_VPCMPGTQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16612, 174},
    {I_VPCMPGTQ, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19727, 187},
    {I_VPCMPGTQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19734, 187},
    {I_VPCMPGTQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+11468, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPGTW[] = {
    {I_VPCMPGTW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16577, 174},
    {I_VPCMPGTW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16584, 174},
    {I_VPCMPGTW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19699, 187},
    {I_VPCMPGTW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19706, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPISTRI[] = {
    {I_VPCMPISTRI, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7164, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPISTRM[] = {
    {I_VPCMPISTRM, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7172, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPLED[] = {
    {I_VPCMPLED, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+1290, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPLEQ[] = {
    {I_VPCMPLEQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+1340, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPLEUD[] = {
    {I_VPCMPLEUD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+1400, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPLEUQ[] = {
    {I_VPCMPLEUQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+1460, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPLTD[] = {
    {I_VPCMPLTD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+1280, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPLTQ[] = {
    {I_VPCMPLTQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+1330, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPLTUD[] = {
    {I_VPCMPLTUD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+1390, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPLTUQ[] = {
    {I_VPCMPLTUQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+1450, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPNEQD[] = {
    {I_VPCMPNEQD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+1300, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPNEQQ[] = {
    {I_VPCMPNEQQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+1350, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPNEQUD[] = {
    {I_VPCMPNEQUD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+1410, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPNEQUQ[] = {
    {I_VPCMPNEQUQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+1470, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPNLED[] = {
    {I_VPCMPNLED, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+1320, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPNLEQ[] = {
    {I_VPCMPNLEQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+1370, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPNLEUD[] = {
    {I_VPCMPNLEUD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+1430, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPNLEUQ[] = {
    {I_VPCMPNLEUQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+1490, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPNLTD[] = {
    {I_VPCMPNLTD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+1310, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPNLTQ[] = {
    {I_VPCMPNLTQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+1360, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPNLTUD[] = {
    {I_VPCMPNLTUD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+1420, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPNLTUQ[] = {
    {I_VPCMPNLTUQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+1480, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPQ[] = {
    {I_VPCMPQ, 4, {KREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK,0,B64,0,0}, nasm_bytecodes+5442, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPUD[] = {
    {I_VPCMPUD, 4, {KREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK,0,B32,0,0}, nasm_bytecodes+5451, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCMPUQ[] = {
    {I_VPCMPUQ, 4, {KREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK,0,B64,0,0}, nasm_bytecodes+5460, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCOMB[] = {
    {I_VPCOMB, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+8828, 186},
    {I_VPCOMB, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+8836, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCOMD[] = {
    {I_VPCOMD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+8844, 186},
    {I_VPCOMD, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+8852, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCOMPRESSD[] = {
    {I_VPCOMPRESSD, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11476, 200},
    {I_VPCOMPRESSD, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11484, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCOMPRESSQ[] = {
    {I_VPCOMPRESSQ, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11492, 200},
    {I_VPCOMPRESSQ, 2, {MEMORY|BITS512,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11500, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCOMQ[] = {
    {I_VPCOMQ, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+8860, 186},
    {I_VPCOMQ, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+8868, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCOMUB[] = {
    {I_VPCOMUB, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+8876, 186},
    {I_VPCOMUB, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+8884, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCOMUD[] = {
    {I_VPCOMUD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+8892, 186},
    {I_VPCOMUD, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+8900, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCOMUQ[] = {
    {I_VPCOMUQ, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+8908, 186},
    {I_VPCOMUQ, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+8916, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCOMUW[] = {
    {I_VPCOMUW, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+8924, 186},
    {I_VPCOMUW, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+8932, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCOMW[] = {
    {I_VPCOMW, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+8940, 186},
    {I_VPCOMW, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+8948, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCONFLICTD[] = {
    {I_VPCONFLICTD, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32,0,0,0}, nasm_bytecodes+12524, 202},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPCONFLICTQ[] = {
    {I_VPCONFLICTQ, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64,0,0,0}, nasm_bytecodes+12532, 202},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERM2F128[] = {
    {I_VPERM2F128, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7212, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERM2I128[] = {
    {I_VPERM2I128, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+9540, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMD[] = {
    {I_VPERMD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20714, 187},
    {I_VPERMD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20721, 187},
    {I_VPERMD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11508, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMI2D[] = {
    {I_VPERMI2D, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11516, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMI2PD[] = {
    {I_VPERMI2PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11524, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMI2PS[] = {
    {I_VPERMI2PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11532, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMI2Q[] = {
    {I_VPERMI2Q, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11540, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMILPD[] = {
    {I_VPERMILPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16619, 174},
    {I_VPERMILPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+16626, 174},
    {I_VPERMILPD, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7180, 174},
    {I_VPERMILPD, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7188, 174},
    {I_VPERMILPD, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B64,0,0,0}, nasm_bytecodes+5469, 200},
    {I_VPERMILPD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11548, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMILPS[] = {
    {I_VPERMILPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16633, 174},
    {I_VPERMILPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+16640, 174},
    {I_VPERMILPS, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7196, 174},
    {I_VPERMILPS, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7204, 174},
    {I_VPERMILPS, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B32,0,0,0}, nasm_bytecodes+5478, 200},
    {I_VPERMILPS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11556, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMPD[] = {
    {I_VPERMPD, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9524, 187},
    {I_VPERMPD, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B64,0,0,0}, nasm_bytecodes+5487, 200},
    {I_VPERMPD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11564, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMPS[] = {
    {I_VPERMPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20728, 187},
    {I_VPERMPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20735, 187},
    {I_VPERMPS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11572, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMQ[] = {
    {I_VPERMQ, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9532, 187},
    {I_VPERMQ, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B64,0,0,0}, nasm_bytecodes+5496, 200},
    {I_VPERMQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11580, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMT2D[] = {
    {I_VPERMT2D, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11588, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMT2PD[] = {
    {I_VPERMT2PD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11596, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMT2PS[] = {
    {I_VPERMT2PS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11604, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPERMT2Q[] = {
    {I_VPERMT2Q, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11612, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPEXPANDD[] = {
    {I_VPEXPANDD, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11620, 200},
    {I_VPEXPANDD, 2, {ZMMREG,MEMORY|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11620, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPEXPANDQ[] = {
    {I_VPEXPANDQ, 2, {ZMMREG,MEMORY|BITS512,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11628, 200},
    {I_VPEXPANDQ, 2, {ZMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11628, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPEXTRB[] = {
    {I_VPEXTRB, 3, {REG_GPR|BITS64,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7220, 177},
    {I_VPEXTRB, 3, {REG_GPR|BITS32,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7220, 174},
    {I_VPEXTRB, 3, {MEMORY|BITS8,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7220, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPEXTRD[] = {
    {I_VPEXTRD, 3, {REG_GPR|BITS64,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7244, 177},
    {I_VPEXTRD, 3, {RM_GPR|BITS32,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7244, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPEXTRQ[] = {
    {I_VPEXTRQ, 3, {RM_GPR|BITS64,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7252, 177},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPEXTRW[] = {
    {I_VPEXTRW, 3, {REG_GPR|BITS64,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7228, 177},
    {I_VPEXTRW, 3, {REG_GPR|BITS32,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7228, 174},
    {I_VPEXTRW, 3, {REG_GPR|BITS64,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7236, 177},
    {I_VPEXTRW, 3, {REG_GPR|BITS32,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7236, 174},
    {I_VPEXTRW, 3, {MEMORY|BITS16,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7236, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPGATHERDD[] = {
    {I_VPGATHERDD, 3, {XMM_L16,XMEM|BITS32,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9636, 187},
    {I_VPGATHERDD, 3, {YMM_L16,YMEM|BITS32,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9652, 187},
    {I_VPGATHERDD, 2, {ZMMREG,ZMEM|BITS32,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5505, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPGATHERDQ[] = {
    {I_VPGATHERDQ, 3, {XMM_L16,XMEM|BITS64,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9668, 187},
    {I_VPGATHERDQ, 3, {YMM_L16,XMEM|BITS64,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9684, 187},
    {I_VPGATHERDQ, 2, {ZMMREG,YMEM|BITS64,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5514, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPGATHERQD[] = {
    {I_VPGATHERQD, 3, {XMM_L16,XMEM|BITS32,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9644, 187},
    {I_VPGATHERQD, 3, {XMM_L16,YMEM|BITS32,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9660, 187},
    {I_VPGATHERQD, 2, {YMMREG,ZMEM|BITS32,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5523, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPGATHERQQ[] = {
    {I_VPGATHERQQ, 3, {XMM_L16,XMEM|BITS64,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9676, 187},
    {I_VPGATHERQQ, 3, {YMM_L16,YMEM|BITS64,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9692, 187},
    {I_VPGATHERQQ, 2, {ZMMREG,ZMEM|BITS64,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5532, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDBD[] = {
    {I_VPHADDBD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18838, 186},
    {I_VPHADDBD, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18845, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDBQ[] = {
    {I_VPHADDBQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18852, 186},
    {I_VPHADDBQ, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18859, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDBW[] = {
    {I_VPHADDBW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18866, 186},
    {I_VPHADDBW, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18873, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDD[] = {
    {I_VPHADDD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16661, 174},
    {I_VPHADDD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16668, 174},
    {I_VPHADDD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19755, 187},
    {I_VPHADDD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19762, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDDQ[] = {
    {I_VPHADDDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18880, 186},
    {I_VPHADDDQ, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18887, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDSW[] = {
    {I_VPHADDSW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16675, 174},
    {I_VPHADDSW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16682, 174},
    {I_VPHADDSW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19769, 187},
    {I_VPHADDSW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19776, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDUBD[] = {
    {I_VPHADDUBD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18894, 186},
    {I_VPHADDUBD, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18901, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDUBQ[] = {
    {I_VPHADDUBQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18908, 186},
    {I_VPHADDUBQ, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18915, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDUBW[] = {
    {I_VPHADDUBW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18922, 186},
    {I_VPHADDUBW, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18929, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDUDQ[] = {
    {I_VPHADDUDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18936, 186},
    {I_VPHADDUDQ, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18943, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDUWD[] = {
    {I_VPHADDUWD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18950, 186},
    {I_VPHADDUWD, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18957, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDUWQ[] = {
    {I_VPHADDUWQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18964, 186},
    {I_VPHADDUWQ, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18971, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDW[] = {
    {I_VPHADDW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16647, 174},
    {I_VPHADDW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16654, 174},
    {I_VPHADDW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19741, 187},
    {I_VPHADDW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19748, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDWD[] = {
    {I_VPHADDWD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18978, 186},
    {I_VPHADDWD, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18985, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHADDWQ[] = {
    {I_VPHADDWQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+18992, 186},
    {I_VPHADDWQ, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18999, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHMINPOSUW[] = {
    {I_VPHMINPOSUW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16689, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHSUBBW[] = {
    {I_VPHSUBBW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19006, 186},
    {I_VPHSUBBW, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+19013, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHSUBD[] = {
    {I_VPHSUBD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16710, 174},
    {I_VPHSUBD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16717, 174},
    {I_VPHSUBD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19797, 187},
    {I_VPHSUBD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19804, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHSUBDQ[] = {
    {I_VPHSUBDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19020, 186},
    {I_VPHSUBDQ, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+19027, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHSUBSW[] = {
    {I_VPHSUBSW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16724, 174},
    {I_VPHSUBSW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16731, 174},
    {I_VPHSUBSW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19811, 187},
    {I_VPHSUBSW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19818, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHSUBW[] = {
    {I_VPHSUBW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16696, 174},
    {I_VPHSUBW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16703, 174},
    {I_VPHSUBW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19783, 187},
    {I_VPHSUBW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19790, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPHSUBWD[] = {
    {I_VPHSUBWD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19034, 186},
    {I_VPHSUBWD, 1, {XMM_L16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+19041, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPINSRB[] = {
    {I_VPINSRB, 4, {XMM_L16,XMM_L16,MEMORY|BITS8,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7260, 174},
    {I_VPINSRB, 3, {XMM_L16,MEMORY|BITS8,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7268, 174},
    {I_VPINSRB, 4, {XMM_L16,XMM_L16,RM_GPR|BITS8,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7260, 174},
    {I_VPINSRB, 3, {XMM_L16,RM_GPR|BITS8,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7268, 174},
    {I_VPINSRB, 4, {XMM_L16,XMM_L16,REG_GPR|BITS32,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7260, 174},
    {I_VPINSRB, 3, {XMM_L16,REG_GPR|BITS32,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7268, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPINSRD[] = {
    {I_VPINSRD, 4, {XMM_L16,XMM_L16,MEMORY|BITS32,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7292, 174},
    {I_VPINSRD, 3, {XMM_L16,MEMORY|BITS32,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7300, 174},
    {I_VPINSRD, 4, {XMM_L16,XMM_L16,RM_GPR|BITS32,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7292, 174},
    {I_VPINSRD, 3, {XMM_L16,RM_GPR|BITS32,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7300, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPINSRQ[] = {
    {I_VPINSRQ, 4, {XMM_L16,XMM_L16,MEMORY|BITS64,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7308, 177},
    {I_VPINSRQ, 3, {XMM_L16,MEMORY|BITS64,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7316, 177},
    {I_VPINSRQ, 4, {XMM_L16,XMM_L16,RM_GPR|BITS64,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7308, 177},
    {I_VPINSRQ, 3, {XMM_L16,RM_GPR|BITS64,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7316, 177},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPINSRW[] = {
    {I_VPINSRW, 4, {XMM_L16,XMM_L16,MEMORY|BITS16,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7276, 174},
    {I_VPINSRW, 3, {XMM_L16,MEMORY|BITS16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7284, 174},
    {I_VPINSRW, 4, {XMM_L16,XMM_L16,RM_GPR|BITS16,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7276, 174},
    {I_VPINSRW, 3, {XMM_L16,RM_GPR|BITS16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7284, 174},
    {I_VPINSRW, 4, {XMM_L16,XMM_L16,REG_GPR|BITS32,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7276, 174},
    {I_VPINSRW, 3, {XMM_L16,REG_GPR|BITS32,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7284, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPLZCNTD[] = {
    {I_VPLZCNTD, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32,0,0,0}, nasm_bytecodes+12540, 202},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPLZCNTQ[] = {
    {I_VPLZCNTQ, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64,0,0,0}, nasm_bytecodes+12548, 202},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMACSDD[] = {
    {I_VPMACSDD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8956, 186},
    {I_VPMACSDD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8964, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMACSDQH[] = {
    {I_VPMACSDQH, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8972, 186},
    {I_VPMACSDQH, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8980, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMACSDQL[] = {
    {I_VPMACSDQL, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+8988, 186},
    {I_VPMACSDQL, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+8996, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMACSSDD[] = {
    {I_VPMACSSDD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+9004, 186},
    {I_VPMACSSDD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9012, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMACSSDQH[] = {
    {I_VPMACSSDQH, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+9020, 186},
    {I_VPMACSSDQH, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9028, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMACSSDQL[] = {
    {I_VPMACSSDQL, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+9036, 186},
    {I_VPMACSSDQL, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9044, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMACSSWD[] = {
    {I_VPMACSSWD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+9052, 186},
    {I_VPMACSSWD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9060, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMACSSWW[] = {
    {I_VPMACSSWW, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+9068, 186},
    {I_VPMACSSWW, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9076, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMACSWD[] = {
    {I_VPMACSWD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+9084, 186},
    {I_VPMACSWD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9092, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMACSWW[] = {
    {I_VPMACSWW, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+9100, 186},
    {I_VPMACSWW, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9108, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMADCSSWD[] = {
    {I_VPMADCSSWD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+9116, 186},
    {I_VPMADCSSWD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9124, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMADCSWD[] = {
    {I_VPMADCSWD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+9132, 186},
    {I_VPMADCSWD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9140, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMADDUBSW[] = {
    {I_VPMADDUBSW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16752, 174},
    {I_VPMADDUBSW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16759, 174},
    {I_VPMADDUBSW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19825, 187},
    {I_VPMADDUBSW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19832, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMADDWD[] = {
    {I_VPMADDWD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16738, 174},
    {I_VPMADDWD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16745, 174},
    {I_VPMADDWD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19839, 187},
    {I_VPMADDWD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19846, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMASKMOVD[] = {
    {I_VPMASKMOVD, 3, {XMM_L16,XMM_L16,MEMORY|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20742, 187},
    {I_VPMASKMOVD, 2, {XMM_L16,MEMORY|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20749, 187},
    {I_VPMASKMOVD, 3, {YMM_L16,YMM_L16,MEMORY|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20756, 187},
    {I_VPMASKMOVD, 2, {YMM_L16,MEMORY|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20763, 187},
    {I_VPMASKMOVD, 3, {MEMORY|BITS128,XMM_L16,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+20798, 187},
    {I_VPMASKMOVD, 2, {MEMORY|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20805, 187},
    {I_VPMASKMOVD, 3, {MEMORY|BITS256,YMM_L16,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+20812, 187},
    {I_VPMASKMOVD, 2, {MEMORY|BITS256,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20819, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMASKMOVQ[] = {
    {I_VPMASKMOVQ, 3, {XMM_L16,XMM_L16,MEMORY|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20770, 187},
    {I_VPMASKMOVQ, 2, {XMM_L16,MEMORY|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20777, 187},
    {I_VPMASKMOVQ, 3, {YMM_L16,YMM_L16,MEMORY|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20784, 187},
    {I_VPMASKMOVQ, 2, {YMM_L16,MEMORY|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20791, 187},
    {I_VPMASKMOVQ, 3, {MEMORY|BITS128,XMM_L16,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+20826, 187},
    {I_VPMASKMOVQ, 2, {MEMORY|BITS128,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20833, 187},
    {I_VPMASKMOVQ, 3, {MEMORY|BITS256,YMM_L16,YMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+20840, 187},
    {I_VPMASKMOVQ, 2, {MEMORY|BITS256,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20847, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMAXSB[] = {
    {I_VPMAXSB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16766, 174},
    {I_VPMAXSB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16773, 174},
    {I_VPMAXSB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19853, 187},
    {I_VPMAXSB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19860, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMAXSD[] = {
    {I_VPMAXSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16794, 174},
    {I_VPMAXSD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16801, 174},
    {I_VPMAXSD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19881, 187},
    {I_VPMAXSD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19888, 187},
    {I_VPMAXSD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11636, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMAXSQ[] = {
    {I_VPMAXSQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11644, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMAXSW[] = {
    {I_VPMAXSW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16780, 174},
    {I_VPMAXSW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16787, 174},
    {I_VPMAXSW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19867, 187},
    {I_VPMAXSW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19874, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMAXUB[] = {
    {I_VPMAXUB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16808, 174},
    {I_VPMAXUB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16815, 174},
    {I_VPMAXUB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19895, 187},
    {I_VPMAXUB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19902, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMAXUD[] = {
    {I_VPMAXUD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16836, 174},
    {I_VPMAXUD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16843, 174},
    {I_VPMAXUD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19923, 187},
    {I_VPMAXUD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19930, 187},
    {I_VPMAXUD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11652, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMAXUQ[] = {
    {I_VPMAXUQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11660, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMAXUW[] = {
    {I_VPMAXUW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16822, 174},
    {I_VPMAXUW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16829, 174},
    {I_VPMAXUW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19909, 187},
    {I_VPMAXUW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19916, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMINSB[] = {
    {I_VPMINSB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16850, 174},
    {I_VPMINSB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16857, 174},
    {I_VPMINSB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19937, 187},
    {I_VPMINSB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19944, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMINSD[] = {
    {I_VPMINSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16878, 174},
    {I_VPMINSD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16885, 174},
    {I_VPMINSD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19965, 187},
    {I_VPMINSD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19972, 187},
    {I_VPMINSD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11668, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMINSQ[] = {
    {I_VPMINSQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11676, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMINSW[] = {
    {I_VPMINSW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16864, 174},
    {I_VPMINSW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16871, 174},
    {I_VPMINSW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19951, 187},
    {I_VPMINSW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19958, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMINUB[] = {
    {I_VPMINUB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16892, 174},
    {I_VPMINUB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16899, 174},
    {I_VPMINUB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19979, 187},
    {I_VPMINUB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+19986, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMINUD[] = {
    {I_VPMINUD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16920, 174},
    {I_VPMINUD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16927, 174},
    {I_VPMINUD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20007, 187},
    {I_VPMINUD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20014, 187},
    {I_VPMINUD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+11684, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMINUQ[] = {
    {I_VPMINUQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+11692, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMINUW[] = {
    {I_VPMINUW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+16906, 174},
    {I_VPMINUW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+16913, 174},
    {I_VPMINUW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+19993, 187},
    {I_VPMINUW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20000, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVDB[] = {
    {I_VPMOVDB, 2, {XMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11700, 200},
    {I_VPMOVDB, 2, {MEMORY|BITS128,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11708, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVDW[] = {
    {I_VPMOVDW, 2, {YMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11716, 200},
    {I_VPMOVDW, 2, {MEMORY|BITS256,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11724, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVMSKB[] = {
    {I_VPMOVMSKB, 2, {REG_GPR|BITS64,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+16934, 177},
    {I_VPMOVMSKB, 2, {REG_GPR|BITS32,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+16934, 174},
    {I_VPMOVMSKB, 2, {REG_GPR|BITS32,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20021, 187},
    {I_VPMOVMSKB, 2, {REG_GPR|BITS64,YMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20021, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVQB[] = {
    {I_VPMOVQB, 2, {XMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11732, 200},
    {I_VPMOVQB, 2, {MEMORY|BITS64,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11740, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVQD[] = {
    {I_VPMOVQD, 2, {YMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11748, 200},
    {I_VPMOVQD, 2, {MEMORY|BITS256,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11756, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVQW[] = {
    {I_VPMOVQW, 2, {XMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11764, 200},
    {I_VPMOVQW, 2, {MEMORY|BITS128,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11772, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVSDB[] = {
    {I_VPMOVSDB, 2, {MEMORY|BITS128,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11780, 200},
    {I_VPMOVSDB, 2, {XMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11788, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVSDW[] = {
    {I_VPMOVSDW, 2, {MEMORY|BITS256,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11796, 200},
    {I_VPMOVSDW, 2, {YMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11804, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVSQB[] = {
    {I_VPMOVSQB, 2, {MEMORY|BITS64,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11812, 200},
    {I_VPMOVSQB, 2, {XMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11820, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVSQD[] = {
    {I_VPMOVSQD, 2, {MEMORY|BITS256,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11828, 200},
    {I_VPMOVSQD, 2, {YMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11836, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVSQW[] = {
    {I_VPMOVSQW, 2, {XMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11844, 200},
    {I_VPMOVSQW, 2, {MEMORY|BITS128,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11852, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVSXBD[] = {
    {I_VPMOVSXBD, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+16948, 174},
    {I_VPMOVSXBD, 2, {YMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+20035, 187},
    {I_VPMOVSXBD, 2, {YMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20035, 187},
    {I_VPMOVSXBD, 2, {ZMMREG,RM_XMM|BITS128,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11860, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVSXBQ[] = {
    {I_VPMOVSXBQ, 2, {XMM_L16,RM_XMM_L16|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+16955, 174},
    {I_VPMOVSXBQ, 2, {YMM_L16,MEMORY|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+20042, 187},
    {I_VPMOVSXBQ, 2, {YMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20042, 187},
    {I_VPMOVSXBQ, 2, {ZMMREG,RM_XMM|BITS64,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11868, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVSXBW[] = {
    {I_VPMOVSXBW, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+16941, 174},
    {I_VPMOVSXBW, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20028, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVSXDQ[] = {
    {I_VPMOVSXDQ, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+16976, 174},
    {I_VPMOVSXDQ, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20063, 187},
    {I_VPMOVSXDQ, 2, {ZMMREG,RM_YMM|BITS256,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11876, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVSXWD[] = {
    {I_VPMOVSXWD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+16962, 174},
    {I_VPMOVSXWD, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20049, 187},
    {I_VPMOVSXWD, 2, {ZMMREG,RM_YMM|BITS256,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11884, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVSXWQ[] = {
    {I_VPMOVSXWQ, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+16969, 174},
    {I_VPMOVSXWQ, 2, {YMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+20056, 187},
    {I_VPMOVSXWQ, 2, {YMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20056, 187},
    {I_VPMOVSXWQ, 2, {ZMMREG,RM_XMM|BITS128,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11892, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVUSDB[] = {
    {I_VPMOVUSDB, 2, {XMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11900, 200},
    {I_VPMOVUSDB, 2, {MEMORY|BITS128,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11908, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVUSDW[] = {
    {I_VPMOVUSDW, 2, {YMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11916, 200},
    {I_VPMOVUSDW, 2, {MEMORY|BITS256,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11924, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVUSQB[] = {
    {I_VPMOVUSQB, 2, {XMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11932, 200},
    {I_VPMOVUSQB, 2, {MEMORY|BITS64,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11940, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVUSQD[] = {
    {I_VPMOVUSQD, 2, {YMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11948, 200},
    {I_VPMOVUSQD, 2, {MEMORY|BITS256,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11956, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVUSQW[] = {
    {I_VPMOVUSQW, 2, {XMMREG,ZMMREG,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11964, 200},
    {I_VPMOVUSQW, 2, {MEMORY|BITS128,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+11972, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVZXBD[] = {
    {I_VPMOVZXBD, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+16990, 174},
    {I_VPMOVZXBD, 2, {YMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+20077, 187},
    {I_VPMOVZXBD, 2, {YMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20077, 187},
    {I_VPMOVZXBD, 2, {ZMMREG,RM_XMM|BITS128,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11980, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVZXBQ[] = {
    {I_VPMOVZXBQ, 2, {XMM_L16,RM_XMM_L16|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+16997, 174},
    {I_VPMOVZXBQ, 2, {YMM_L16,MEMORY|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+20084, 187},
    {I_VPMOVZXBQ, 2, {YMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20084, 187},
    {I_VPMOVZXBQ, 2, {ZMMREG,RM_XMM|BITS64,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11988, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVZXBW[] = {
    {I_VPMOVZXBW, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+16983, 174},
    {I_VPMOVZXBW, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20070, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVZXDQ[] = {
    {I_VPMOVZXDQ, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+17018, 174},
    {I_VPMOVZXDQ, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20105, 187},
    {I_VPMOVZXDQ, 2, {ZMMREG,RM_YMM|BITS256,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+11996, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVZXWD[] = {
    {I_VPMOVZXWD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+17004, 174},
    {I_VPMOVZXWD, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20091, 187},
    {I_VPMOVZXWD, 2, {ZMMREG,RM_YMM|BITS256,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+12004, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMOVZXWQ[] = {
    {I_VPMOVZXWQ, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+17011, 174},
    {I_VPMOVZXWQ, 2, {YMM_L16,MEMORY|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+20098, 187},
    {I_VPMOVZXWQ, 2, {YMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+20098, 187},
    {I_VPMOVZXWQ, 2, {ZMMREG,RM_XMM|BITS128,0,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+12012, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMULDQ[] = {
    {I_VPMULDQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17109, 174},
    {I_VPMULDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17116, 174},
    {I_VPMULDQ, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20112, 187},
    {I_VPMULDQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20119, 187},
    {I_VPMULDQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12020, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMULHRSW[] = {
    {I_VPMULHRSW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17039, 174},
    {I_VPMULHRSW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17046, 174},
    {I_VPMULHRSW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20126, 187},
    {I_VPMULHRSW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20133, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMULHUW[] = {
    {I_VPMULHUW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17025, 174},
    {I_VPMULHUW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17032, 174},
    {I_VPMULHUW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20140, 187},
    {I_VPMULHUW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20147, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMULHW[] = {
    {I_VPMULHW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17053, 174},
    {I_VPMULHW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17060, 174},
    {I_VPMULHW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20154, 187},
    {I_VPMULHW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20161, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMULLD[] = {
    {I_VPMULLD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17081, 174},
    {I_VPMULLD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17088, 174},
    {I_VPMULLD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20182, 187},
    {I_VPMULLD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20189, 187},
    {I_VPMULLD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+12028, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMULLW[] = {
    {I_VPMULLW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17067, 174},
    {I_VPMULLW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17074, 174},
    {I_VPMULLW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20168, 187},
    {I_VPMULLW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20175, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPMULUDQ[] = {
    {I_VPMULUDQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17095, 174},
    {I_VPMULUDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17102, 174},
    {I_VPMULUDQ, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20196, 187},
    {I_VPMULUDQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20203, 187},
    {I_VPMULUDQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12036, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPOR[] = {
    {I_VPOR, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17123, 174},
    {I_VPOR, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17130, 174},
    {I_VPOR, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20210, 187},
    {I_VPOR, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20217, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPORD[] = {
    {I_VPORD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+12044, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPORQ[] = {
    {I_VPORQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12052, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPPERM[] = {
    {I_VPPERM, 4, {XMM_L16,XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0}, NO_DECORATOR, nasm_bytecodes+9148, 186},
    {I_VPPERM, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+9156, 186},
    {I_VPPERM, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0}, NO_DECORATOR, nasm_bytecodes+9164, 186},
    {I_VPPERM, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+9172, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPROLD[] = {
    {I_VPROLD, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B32,0,0,0}, nasm_bytecodes+5541, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPROLQ[] = {
    {I_VPROLQ, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B64,0,0,0}, nasm_bytecodes+5550, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPROLVD[] = {
    {I_VPROLVD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+12060, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPROLVQ[] = {
    {I_VPROLVQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12068, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPRORD[] = {
    {I_VPRORD, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B32,0,0,0}, nasm_bytecodes+5559, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPRORQ[] = {
    {I_VPRORQ, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B64,0,0,0}, nasm_bytecodes+5568, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPRORVD[] = {
    {I_VPRORVD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+12076, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPRORVQ[] = {
    {I_VPRORVQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12084, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPROTB[] = {
    {I_VPROTB, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+19048, 186},
    {I_VPROTB, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+19055, 186},
    {I_VPROTB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+19062, 186},
    {I_VPROTB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19069, 186},
    {I_VPROTB, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9180, 186},
    {I_VPROTB, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9188, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPROTD[] = {
    {I_VPROTD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+19076, 186},
    {I_VPROTD, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+19083, 186},
    {I_VPROTD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+19090, 186},
    {I_VPROTD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19097, 186},
    {I_VPROTD, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9196, 186},
    {I_VPROTD, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9204, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPROTQ[] = {
    {I_VPROTQ, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+19104, 186},
    {I_VPROTQ, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+19111, 186},
    {I_VPROTQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+19118, 186},
    {I_VPROTQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19125, 186},
    {I_VPROTQ, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9212, 186},
    {I_VPROTQ, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9220, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPROTW[] = {
    {I_VPROTW, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+19132, 186},
    {I_VPROTW, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+19139, 186},
    {I_VPROTW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+19146, 186},
    {I_VPROTW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19153, 186},
    {I_VPROTW, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9228, 186},
    {I_VPROTW, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9236, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSADBW[] = {
    {I_VPSADBW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17137, 174},
    {I_VPSADBW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17144, 174},
    {I_VPSADBW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20224, 187},
    {I_VPSADBW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20231, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSCATTERDD[] = {
    {I_VPSCATTERDD, 2, {ZMEM|BITS32,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5577, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSCATTERDQ[] = {
    {I_VPSCATTERDQ, 2, {YMEM|BITS64,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5586, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSCATTERQD[] = {
    {I_VPSCATTERQD, 2, {ZMEM|BITS32,YMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5595, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSCATTERQQ[] = {
    {I_VPSCATTERQQ, 2, {ZMEM|BITS64,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5604, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSHAB[] = {
    {I_VPSHAB, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+19160, 186},
    {I_VPSHAB, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+19167, 186},
    {I_VPSHAB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+19174, 186},
    {I_VPSHAB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19181, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSHAD[] = {
    {I_VPSHAD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+19188, 186},
    {I_VPSHAD, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+19195, 186},
    {I_VPSHAD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+19202, 186},
    {I_VPSHAD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19209, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSHAQ[] = {
    {I_VPSHAQ, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+19216, 186},
    {I_VPSHAQ, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+19223, 186},
    {I_VPSHAQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+19230, 186},
    {I_VPSHAQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19237, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSHAW[] = {
    {I_VPSHAW, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+19244, 186},
    {I_VPSHAW, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+19251, 186},
    {I_VPSHAW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+19258, 186},
    {I_VPSHAW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19265, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSHLB[] = {
    {I_VPSHLB, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+19272, 186},
    {I_VPSHLB, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+19279, 186},
    {I_VPSHLB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+19286, 186},
    {I_VPSHLB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19293, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSHLD[] = {
    {I_VPSHLD, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+19300, 186},
    {I_VPSHLD, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+19307, 186},
    {I_VPSHLD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+19314, 186},
    {I_VPSHLD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19321, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSHLQ[] = {
    {I_VPSHLQ, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+19328, 186},
    {I_VPSHLQ, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+19335, 186},
    {I_VPSHLQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+19342, 186},
    {I_VPSHLQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19349, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSHLW[] = {
    {I_VPSHLW, 3, {XMM_L16,RM_XMM_L16|BITS128,XMM_L16,0,0}, NO_DECORATOR, nasm_bytecodes+19356, 186},
    {I_VPSHLW, 2, {XMM_L16,XMM_L16,0,0,0}, NO_DECORATOR, nasm_bytecodes+19363, 186},
    {I_VPSHLW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+19370, 186},
    {I_VPSHLW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+19377, 186},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSHUFB[] = {
    {I_VPSHUFB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17151, 174},
    {I_VPSHUFB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17158, 174},
    {I_VPSHUFB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20238, 187},
    {I_VPSHUFB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20245, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSHUFD[] = {
    {I_VPSHUFD, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7324, 174},
    {I_VPSHUFD, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9308, 187},
    {I_VPSHUFD, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B32,0,0,0}, nasm_bytecodes+5613, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSHUFHW[] = {
    {I_VPSHUFHW, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7332, 174},
    {I_VPSHUFHW, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9316, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSHUFLW[] = {
    {I_VPSHUFLW, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7340, 174},
    {I_VPSHUFLW, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9324, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSIGNB[] = {
    {I_VPSIGNB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17165, 174},
    {I_VPSIGNB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17172, 174},
    {I_VPSIGNB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20252, 187},
    {I_VPSIGNB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20259, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSIGND[] = {
    {I_VPSIGND, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17193, 174},
    {I_VPSIGND, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17200, 174},
    {I_VPSIGND, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20280, 187},
    {I_VPSIGND, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20287, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSIGNW[] = {
    {I_VPSIGNW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17179, 174},
    {I_VPSIGNW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17186, 174},
    {I_VPSIGNW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20266, 187},
    {I_VPSIGNW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20273, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSLLD[] = {
    {I_VPSLLD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17221, 174},
    {I_VPSLLD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17228, 174},
    {I_VPSLLD, 3, {XMM_L16,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7396, 174},
    {I_VPSLLD, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+7404, 174},
    {I_VPSLLD, 3, {YMM_L16,YMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20308, 187},
    {I_VPSLLD, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20315, 187},
    {I_VPSLLD, 3, {YMM_L16,YMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9364, 187},
    {I_VPSLLD, 2, {YMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9372, 187},
    {I_VPSLLD, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B32,0,0,0}, nasm_bytecodes+5622, 200},
    {I_VPSLLD, 3, {ZMMREG,ZMMREG,RM_XMM|BITS128,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+12092, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSLLDQ[] = {
    {I_VPSLLDQ, 3, {XMM_L16,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7348, 174},
    {I_VPSLLDQ, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+7356, 174},
    {I_VPSLLDQ, 3, {YMM_L16,YMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9332, 187},
    {I_VPSLLDQ, 2, {YMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9340, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSLLQ[] = {
    {I_VPSLLQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17235, 174},
    {I_VPSLLQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17242, 174},
    {I_VPSLLQ, 3, {XMM_L16,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7412, 174},
    {I_VPSLLQ, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+7420, 174},
    {I_VPSLLQ, 3, {YMM_L16,YMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20322, 187},
    {I_VPSLLQ, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20329, 187},
    {I_VPSLLQ, 3, {YMM_L16,YMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9380, 187},
    {I_VPSLLQ, 2, {YMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9388, 187},
    {I_VPSLLQ, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B64,0,0,0}, nasm_bytecodes+5631, 200},
    {I_VPSLLQ, 3, {ZMMREG,ZMMREG,RM_XMM|BITS128,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+12100, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSLLVD[] = {
    {I_VPSLLVD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20854, 187},
    {I_VPSLLVD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20861, 187},
    {I_VPSLLVD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20882, 187},
    {I_VPSLLVD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20889, 187},
    {I_VPSLLVD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+12108, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSLLVQ[] = {
    {I_VPSLLVQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20868, 187},
    {I_VPSLLVQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20875, 187},
    {I_VPSLLVQ, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20896, 187},
    {I_VPSLLVQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20903, 187},
    {I_VPSLLVQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12116, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSLLW[] = {
    {I_VPSLLW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17207, 174},
    {I_VPSLLW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17214, 174},
    {I_VPSLLW, 3, {XMM_L16,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7380, 174},
    {I_VPSLLW, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+7388, 174},
    {I_VPSLLW, 3, {YMM_L16,YMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20294, 187},
    {I_VPSLLW, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20301, 187},
    {I_VPSLLW, 3, {YMM_L16,YMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9348, 187},
    {I_VPSLLW, 2, {YMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9356, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSRAD[] = {
    {I_VPSRAD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17263, 174},
    {I_VPSRAD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17270, 174},
    {I_VPSRAD, 3, {XMM_L16,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7444, 174},
    {I_VPSRAD, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+7452, 174},
    {I_VPSRAD, 3, {YMM_L16,YMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20350, 187},
    {I_VPSRAD, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20357, 187},
    {I_VPSRAD, 3, {YMM_L16,YMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9412, 187},
    {I_VPSRAD, 2, {YMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9420, 187},
    {I_VPSRAD, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B32,0,0,0}, nasm_bytecodes+5640, 200},
    {I_VPSRAD, 3, {ZMMREG,ZMMREG,RM_XMM|BITS128,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+12124, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSRAQ[] = {
    {I_VPSRAQ, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B64,0,0,0}, nasm_bytecodes+5649, 200},
    {I_VPSRAQ, 3, {ZMMREG,ZMMREG,RM_XMM|BITS128,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+12132, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSRAVD[] = {
    {I_VPSRAVD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20910, 187},
    {I_VPSRAVD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20917, 187},
    {I_VPSRAVD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20924, 187},
    {I_VPSRAVD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20931, 187},
    {I_VPSRAVD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+12140, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSRAVQ[] = {
    {I_VPSRAVQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12148, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSRAW[] = {
    {I_VPSRAW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17249, 174},
    {I_VPSRAW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17256, 174},
    {I_VPSRAW, 3, {XMM_L16,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7428, 174},
    {I_VPSRAW, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+7436, 174},
    {I_VPSRAW, 3, {YMM_L16,YMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20336, 187},
    {I_VPSRAW, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20343, 187},
    {I_VPSRAW, 3, {YMM_L16,YMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9396, 187},
    {I_VPSRAW, 2, {YMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9404, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSRLD[] = {
    {I_VPSRLD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17291, 174},
    {I_VPSRLD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17298, 174},
    {I_VPSRLD, 3, {XMM_L16,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7476, 174},
    {I_VPSRLD, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+7484, 174},
    {I_VPSRLD, 3, {YMM_L16,YMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20378, 187},
    {I_VPSRLD, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20385, 187},
    {I_VPSRLD, 3, {YMM_L16,YMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9460, 187},
    {I_VPSRLD, 2, {YMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9468, 187},
    {I_VPSRLD, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B32,0,0,0}, nasm_bytecodes+5658, 200},
    {I_VPSRLD, 3, {ZMMREG,ZMMREG,RM_XMM|BITS128,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+12156, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSRLDQ[] = {
    {I_VPSRLDQ, 3, {XMM_L16,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7364, 174},
    {I_VPSRLDQ, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+7372, 174},
    {I_VPSRLDQ, 3, {YMM_L16,YMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9428, 187},
    {I_VPSRLDQ, 2, {YMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9436, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSRLQ[] = {
    {I_VPSRLQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17305, 174},
    {I_VPSRLQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17312, 174},
    {I_VPSRLQ, 3, {XMM_L16,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7492, 174},
    {I_VPSRLQ, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+7500, 174},
    {I_VPSRLQ, 3, {YMM_L16,YMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20392, 187},
    {I_VPSRLQ, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20399, 187},
    {I_VPSRLQ, 3, {YMM_L16,YMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9476, 187},
    {I_VPSRLQ, 2, {YMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9484, 187},
    {I_VPSRLQ, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B64,0,0,0}, nasm_bytecodes+5667, 200},
    {I_VPSRLQ, 3, {ZMMREG,ZMMREG,RM_XMM|BITS128,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+12164, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSRLVD[] = {
    {I_VPSRLVD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20938, 187},
    {I_VPSRLVD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20945, 187},
    {I_VPSRLVD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20966, 187},
    {I_VPSRLVD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20973, 187},
    {I_VPSRLVD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+12172, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSRLVQ[] = {
    {I_VPSRLVQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20952, 187},
    {I_VPSRLVQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20959, 187},
    {I_VPSRLVQ, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20980, 187},
    {I_VPSRLVQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20987, 187},
    {I_VPSRLVQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12180, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSRLW[] = {
    {I_VPSRLW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17277, 174},
    {I_VPSRLW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17284, 174},
    {I_VPSRLW, 3, {XMM_L16,XMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7460, 174},
    {I_VPSRLW, 2, {XMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+7468, 174},
    {I_VPSRLW, 3, {YMM_L16,YMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+20364, 187},
    {I_VPSRLW, 2, {YMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+20371, 187},
    {I_VPSRLW, 3, {YMM_L16,YMM_L16,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+9444, 187},
    {I_VPSRLW, 2, {YMM_L16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+9452, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSUBB[] = {
    {I_VPSUBB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17333, 174},
    {I_VPSUBB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17340, 174},
    {I_VPSUBB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20406, 187},
    {I_VPSUBB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20413, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSUBD[] = {
    {I_VPSUBD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17361, 174},
    {I_VPSUBD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17368, 174},
    {I_VPSUBD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20434, 187},
    {I_VPSUBD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20441, 187},
    {I_VPSUBD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+12188, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSUBQ[] = {
    {I_VPSUBQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17375, 174},
    {I_VPSUBQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17382, 174},
    {I_VPSUBQ, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20448, 187},
    {I_VPSUBQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20455, 187},
    {I_VPSUBQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12196, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSUBSB[] = {
    {I_VPSUBSB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17389, 174},
    {I_VPSUBSB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17396, 174},
    {I_VPSUBSB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20462, 187},
    {I_VPSUBSB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20469, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSUBSW[] = {
    {I_VPSUBSW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17403, 174},
    {I_VPSUBSW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17410, 174},
    {I_VPSUBSW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20476, 187},
    {I_VPSUBSW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20483, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSUBUSB[] = {
    {I_VPSUBUSB, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17417, 174},
    {I_VPSUBUSB, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17424, 174},
    {I_VPSUBUSB, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20490, 187},
    {I_VPSUBUSB, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20497, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSUBUSW[] = {
    {I_VPSUBUSW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17431, 174},
    {I_VPSUBUSW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17438, 174},
    {I_VPSUBUSW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20504, 187},
    {I_VPSUBUSW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20511, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPSUBW[] = {
    {I_VPSUBW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17347, 174},
    {I_VPSUBW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17354, 174},
    {I_VPSUBW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20420, 187},
    {I_VPSUBW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20427, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPTERNLOGD[] = {
    {I_VPTERNLOGD, 4, {ZMMREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+5676, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPTERNLOGQ[] = {
    {I_VPTERNLOGQ, 4, {ZMMREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+5685, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPTEST[] = {
    {I_VPTEST, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17319, 174},
    {I_VPTEST, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17326, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPTESTMD[] = {
    {I_VPTESTMD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+12204, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPTESTMQ[] = {
    {I_VPTESTMQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+12212, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPTESTNMD[] = {
    {I_VPTESTNMD, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B32,0,0}, nasm_bytecodes+12220, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPTESTNMQ[] = {
    {I_VPTESTNMQ, 3, {KREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK,0,B64,0,0}, nasm_bytecodes+12228, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPUNPCKHBW[] = {
    {I_VPUNPCKHBW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17445, 174},
    {I_VPUNPCKHBW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17452, 174},
    {I_VPUNPCKHBW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20518, 187},
    {I_VPUNPCKHBW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20525, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPUNPCKHDQ[] = {
    {I_VPUNPCKHDQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17473, 174},
    {I_VPUNPCKHDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17480, 174},
    {I_VPUNPCKHDQ, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20546, 187},
    {I_VPUNPCKHDQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20553, 187},
    {I_VPUNPCKHDQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+12236, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPUNPCKHQDQ[] = {
    {I_VPUNPCKHQDQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17487, 174},
    {I_VPUNPCKHQDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17494, 174},
    {I_VPUNPCKHQDQ, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20560, 187},
    {I_VPUNPCKHQDQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20567, 187},
    {I_VPUNPCKHQDQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12244, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPUNPCKHWD[] = {
    {I_VPUNPCKHWD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17459, 174},
    {I_VPUNPCKHWD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17466, 174},
    {I_VPUNPCKHWD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20532, 187},
    {I_VPUNPCKHWD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20539, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPUNPCKLBW[] = {
    {I_VPUNPCKLBW, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17501, 174},
    {I_VPUNPCKLBW, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17508, 174},
    {I_VPUNPCKLBW, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20574, 187},
    {I_VPUNPCKLBW, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20581, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPUNPCKLDQ[] = {
    {I_VPUNPCKLDQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17529, 174},
    {I_VPUNPCKLDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17536, 174},
    {I_VPUNPCKLDQ, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20602, 187},
    {I_VPUNPCKLDQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20609, 187},
    {I_VPUNPCKLDQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+12252, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPUNPCKLQDQ[] = {
    {I_VPUNPCKLQDQ, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17543, 174},
    {I_VPUNPCKLQDQ, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17550, 174},
    {I_VPUNPCKLQDQ, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20616, 187},
    {I_VPUNPCKLQDQ, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20623, 187},
    {I_VPUNPCKLQDQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12260, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPUNPCKLWD[] = {
    {I_VPUNPCKLWD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17515, 174},
    {I_VPUNPCKLWD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17522, 174},
    {I_VPUNPCKLWD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20588, 187},
    {I_VPUNPCKLWD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20595, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPXOR[] = {
    {I_VPXOR, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17557, 174},
    {I_VPXOR, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17564, 174},
    {I_VPXOR, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+20630, 187},
    {I_VPXOR, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+20637, 187},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPXORD[] = {
    {I_VPXORD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+12268, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VPXORQ[] = {
    {I_VPXORQ, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12276, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRCP14PD[] = {
    {I_VRCP14PD, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64,0,0,0}, nasm_bytecodes+12284, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRCP14PS[] = {
    {I_VRCP14PS, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32,0,0,0}, nasm_bytecodes+12292, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRCP14SD[] = {
    {I_VRCP14SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+12300, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRCP14SS[] = {
    {I_VRCP14SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+12308, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRCP28PD[] = {
    {I_VRCP28PD, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64|SAE,0,0,0}, nasm_bytecodes+12572, 203},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRCP28PS[] = {
    {I_VRCP28PS, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32|SAE,0,0,0}, nasm_bytecodes+12580, 203},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRCP28SD[] = {
    {I_VRCP28SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+12588, 203},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRCP28SS[] = {
    {I_VRCP28SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+12596, 203},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRCPPS[] = {
    {I_VRCPPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17571, 174},
    {I_VRCPPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17578, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRCPSS[] = {
    {I_VRCPSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+17585, 174},
    {I_VRCPSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+17592, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRNDSCALEPD[] = {
    {I_VRNDSCALEPD, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B64|SAE,0,0,0}, nasm_bytecodes+5694, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRNDSCALEPS[] = {
    {I_VRNDSCALEPS, 3, {ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0,0}, {MASK|Z,B32|SAE,0,0,0}, nasm_bytecodes+5703, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRNDSCALESD[] = {
    {I_VRNDSCALESD, 4, {XMMREG,XMMREG,RM_XMM|BITS64,IMMEDIATE|BITS8,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+5712, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRNDSCALESS[] = {
    {I_VRNDSCALESS, 4, {XMMREG,XMMREG,RM_XMM|BITS32,IMMEDIATE|BITS8,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+5721, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VROUNDPD[] = {
    {I_VROUNDPD, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7508, 174},
    {I_VROUNDPD, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7516, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VROUNDPS[] = {
    {I_VROUNDPS, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7524, 174},
    {I_VROUNDPS, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7532, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VROUNDSD[] = {
    {I_VROUNDSD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7540, 174},
    {I_VROUNDSD, 3, {XMM_L16,RM_XMM_L16|BITS64,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7548, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VROUNDSS[] = {
    {I_VROUNDSS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7556, 174},
    {I_VROUNDSS, 3, {XMM_L16,RM_XMM_L16|BITS32,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7564, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRSQRT14PD[] = {
    {I_VRSQRT14PD, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64,0,0,0}, nasm_bytecodes+12316, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRSQRT14PS[] = {
    {I_VRSQRT14PS, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32,0,0,0}, nasm_bytecodes+12324, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRSQRT14SD[] = {
    {I_VRSQRT14SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+12332, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRSQRT14SS[] = {
    {I_VRSQRT14SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,0,0,0}, nasm_bytecodes+12340, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRSQRT28PD[] = {
    {I_VRSQRT28PD, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64|SAE,0,0,0}, nasm_bytecodes+12604, 203},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRSQRT28PS[] = {
    {I_VRSQRT28PS, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32|SAE,0,0,0}, nasm_bytecodes+12612, 203},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRSQRT28SD[] = {
    {I_VRSQRT28SD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+12620, 203},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRSQRT28SS[] = {
    {I_VRSQRT28SS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,SAE,0,0}, nasm_bytecodes+12628, 203},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRSQRTPS[] = {
    {I_VRSQRTPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17599, 174},
    {I_VRSQRTPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17606, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VRSQRTSS[] = {
    {I_VRSQRTSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+17613, 174},
    {I_VRSQRTSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+17620, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCALEFPD[] = {
    {I_VSCALEFPD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+12348, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCALEFPS[] = {
    {I_VSCALEFPS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+12356, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCALEFSD[] = {
    {I_VSCALEFSD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+12364, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCALEFSS[] = {
    {I_VSCALEFSS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+12372, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCATTERDPD[] = {
    {I_VSCATTERDPD, 2, {YMEM|BITS64,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5730, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCATTERDPS[] = {
    {I_VSCATTERDPS, 2, {ZMEM|BITS32,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5739, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCATTERPF0DPD[] = {
    {I_VSCATTERPF0DPD, 1, {YMEM|BITS64,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5892, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCATTERPF0DPS[] = {
    {I_VSCATTERPF0DPS, 1, {ZMEM|BITS32,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5901, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCATTERPF0QPD[] = {
    {I_VSCATTERPF0QPD, 1, {ZMEM|BITS64,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5910, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCATTERPF0QPS[] = {
    {I_VSCATTERPF0QPS, 1, {ZMEM|BITS32,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5919, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCATTERPF1DPD[] = {
    {I_VSCATTERPF1DPD, 1, {YMEM|BITS64,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5928, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCATTERPF1DPS[] = {
    {I_VSCATTERPF1DPS, 1, {ZMEM|BITS32,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5937, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCATTERPF1QPD[] = {
    {I_VSCATTERPF1QPD, 1, {ZMEM|BITS64,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5946, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCATTERPF1QPS[] = {
    {I_VSCATTERPF1QPS, 1, {ZMEM|BITS32,0,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5955, 204},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCATTERQPD[] = {
    {I_VSCATTERQPD, 2, {ZMEM|BITS64,ZMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5748, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSCATTERQPS[] = {
    {I_VSCATTERQPS, 2, {ZMEM|BITS32,YMMREG,0,0,0}, {MASK,0,0,0,0}, nasm_bytecodes+5757, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSHUFF32X4[] = {
    {I_VSHUFF32X4, 4, {ZMMREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+5766, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSHUFF64X2[] = {
    {I_VSHUFF64X2, 4, {ZMMREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+5775, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSHUFI32X4[] = {
    {I_VSHUFI32X4, 4, {ZMMREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+5784, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSHUFI64X2[] = {
    {I_VSHUFI64X2, 4, {ZMMREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+5793, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSHUFPD[] = {
    {I_VSHUFPD, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7572, 174},
    {I_VSHUFPD, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7580, 174},
    {I_VSHUFPD, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7588, 174},
    {I_VSHUFPD, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7596, 174},
    {I_VSHUFPD, 4, {ZMMREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+5802, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSHUFPS[] = {
    {I_VSHUFPS, 4, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7604, 174},
    {I_VSHUFPS, 3, {XMM_L16,RM_XMM_L16|BITS128,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7612, 174},
    {I_VSHUFPS, 4, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0}, NO_DECORATOR, nasm_bytecodes+7620, 174},
    {I_VSHUFPS, 3, {YMM_L16,RM_YMM_L16|BITS256,IMMEDIATE|BITS8,0,0}, NO_DECORATOR, nasm_bytecodes+7628, 174},
    {I_VSHUFPS, 4, {ZMMREG,ZMMREG,RM_ZMM|BITS512,IMMEDIATE|BITS8,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+5811, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSQRTPD[] = {
    {I_VSQRTPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17627, 174},
    {I_VSQRTPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17634, 174},
    {I_VSQRTPD, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B64|ER,0,0,0}, nasm_bytecodes+12380, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSQRTPS[] = {
    {I_VSQRTPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17641, 174},
    {I_VSQRTPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17648, 174},
    {I_VSQRTPS, 2, {ZMMREG,RM_ZMM|BITS512,0,0,0}, {MASK|Z,B32|ER,0,0,0}, nasm_bytecodes+12388, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSQRTSD[] = {
    {I_VSQRTSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+17655, 174},
    {I_VSQRTSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+17662, 174},
    {I_VSQRTSD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+12396, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSQRTSS[] = {
    {I_VSQRTSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+17669, 174},
    {I_VSQRTSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+17676, 174},
    {I_VSQRTSS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+12404, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSTMXCSR[] = {
    {I_VSTMXCSR, 1, {MEMORY|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+17683, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSUBPD[] = {
    {I_VSUBPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17690, 174},
    {I_VSUBPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17697, 174},
    {I_VSUBPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+17704, 174},
    {I_VSUBPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17711, 174},
    {I_VSUBPD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64|ER,0,0}, nasm_bytecodes+12412, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSUBPS[] = {
    {I_VSUBPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17718, 174},
    {I_VSUBPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17725, 174},
    {I_VSUBPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+17732, 174},
    {I_VSUBPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17739, 174},
    {I_VSUBPS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32|ER,0,0}, nasm_bytecodes+12420, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSUBSD[] = {
    {I_VSUBSD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS64,0,0}, NO_DECORATOR, nasm_bytecodes+17746, 174},
    {I_VSUBSD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+17753, 174},
    {I_VSUBSD, 3, {XMMREG,XMMREG,RM_XMM|BITS64,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+12428, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VSUBSS[] = {
    {I_VSUBSS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS32,0,0}, NO_DECORATOR, nasm_bytecodes+17760, 174},
    {I_VSUBSS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+17767, 174},
    {I_VSUBSS, 3, {XMMREG,XMMREG,RM_XMM|BITS32,0,0}, {MASK|Z,0,ER,0,0}, nasm_bytecodes+12436, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VTESTPD[] = {
    {I_VTESTPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17788, 174},
    {I_VTESTPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17795, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VTESTPS[] = {
    {I_VTESTPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17774, 174},
    {I_VTESTPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17781, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VUCOMISD[] = {
    {I_VUCOMISD, 2, {XMM_L16,RM_XMM_L16|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+17802, 174},
    {I_VUCOMISD, 2, {XMMREG,RM_XMM|BITS64,0,0,0}, {0,SAE,0,0,0}, nasm_bytecodes+12444, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VUCOMISS[] = {
    {I_VUCOMISS, 2, {XMM_L16,RM_XMM_L16|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+17809, 174},
    {I_VUCOMISS, 2, {XMMREG,RM_XMM|BITS32,0,0,0}, {0,SAE,0,0,0}, nasm_bytecodes+12452, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VUNPCKHPD[] = {
    {I_VUNPCKHPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17816, 174},
    {I_VUNPCKHPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17823, 174},
    {I_VUNPCKHPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+17830, 174},
    {I_VUNPCKHPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17837, 174},
    {I_VUNPCKHPD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12460, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VUNPCKHPS[] = {
    {I_VUNPCKHPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17844, 174},
    {I_VUNPCKHPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17851, 174},
    {I_VUNPCKHPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+17858, 174},
    {I_VUNPCKHPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17865, 174},
    {I_VUNPCKHPS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+12468, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VUNPCKLPD[] = {
    {I_VUNPCKLPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17872, 174},
    {I_VUNPCKLPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17879, 174},
    {I_VUNPCKLPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+17886, 174},
    {I_VUNPCKLPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17893, 174},
    {I_VUNPCKLPD, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B64,0,0}, nasm_bytecodes+12476, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VUNPCKLPS[] = {
    {I_VUNPCKLPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17900, 174},
    {I_VUNPCKLPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17907, 174},
    {I_VUNPCKLPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+17914, 174},
    {I_VUNPCKLPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17921, 174},
    {I_VUNPCKLPS, 3, {ZMMREG,ZMMREG,RM_ZMM|BITS512,0,0}, {MASK|Z,0,B32,0,0}, nasm_bytecodes+12484, 200},
    ITEMPLATE_END
};

static const struct itemplate instrux_VXORPD[] = {
    {I_VXORPD, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17928, 174},
    {I_VXORPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17935, 174},
    {I_VXORPD, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+17942, 174},
    {I_VXORPD, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17949, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VXORPS[] = {
    {I_VXORPS, 3, {XMM_L16,XMM_L16,RM_XMM_L16|BITS128,0,0}, NO_DECORATOR, nasm_bytecodes+17956, 174},
    {I_VXORPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+17963, 174},
    {I_VXORPS, 3, {YMM_L16,YMM_L16,RM_YMM_L16|BITS256,0,0}, NO_DECORATOR, nasm_bytecodes+17970, 174},
    {I_VXORPS, 2, {YMM_L16,RM_YMM_L16|BITS256,0,0,0}, NO_DECORATOR, nasm_bytecodes+17977, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VZEROALL[] = {
    {I_VZEROALL, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23707, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_VZEROUPPER[] = {
    {I_VZEROUPPER, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23713, 174},
    ITEMPLATE_END
};

static const struct itemplate instrux_WBINVD[] = {
    {I_WBINVD, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27731, 53},
    ITEMPLATE_END
};

static const struct itemplate instrux_WRFSBASE[] = {
    {I_WRFSBASE, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18684, 125},
    {I_WRFSBASE, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18691, 125},
    ITEMPLATE_END
};

static const struct itemplate instrux_WRGSBASE[] = {
    {I_WRGSBASE, 1, {REG_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18698, 125},
    {I_WRGSBASE, 1, {REG_GPR|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+18705, 125},
    ITEMPLATE_END
};

static const struct itemplate instrux_WRMSR[] = {
    {I_WRMSR, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27735, 94},
    ITEMPLATE_END
};

static const struct itemplate instrux_WRSHR[] = {
    {I_WRSHR, 1, {RM_GPR|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22531, 93},
    ITEMPLATE_END
};

static const struct itemplate instrux_XABORT[] = {
    {I_XABORT, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26763, 188},
    {I_XABORT, 1, {IMMEDIATE|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26763, 188},
    ITEMPLATE_END
};

static const struct itemplate instrux_XADD[] = {
    {I_XADD, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22537, 108},
    {I_XADD, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22538, 20},
    {I_XADD, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13553, 108},
    {I_XADD, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13554, 20},
    {I_XADD, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13560, 108},
    {I_XADD, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13561, 20},
    {I_XADD, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+13567, 6},
    {I_XADD, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+13568, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_XBEGIN[] = {
    {I_XBEGIN, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23803, 188},
    {I_XBEGIN, 1, {IMMEDIATE|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23803, 188},
    {I_XBEGIN, 1, {IMMEDIATE|BITS16,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23809, 189},
    {I_XBEGIN, 1, {IMMEDIATE|BITS16|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23809, 189},
    {I_XBEGIN, 1, {IMMEDIATE|BITS32,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23815, 189},
    {I_XBEGIN, 1, {IMMEDIATE|BITS32|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23815, 189},
    {I_XBEGIN, 1, {IMMEDIATE|BITS64,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23821, 190},
    {I_XBEGIN, 1, {IMMEDIATE|BITS64|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23821, 190},
    ITEMPLATE_END
};

static const struct itemplate instrux_XBTS[] = {
    {I_XBTS, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+22543, 48},
    {I_XBTS, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22543, 49},
    {I_XBTS, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+22549, 50},
    {I_XBTS, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22549, 49},
    ITEMPLATE_END
};

static const struct itemplate instrux_XCHG[] = {
    {I_XCHG, 2, {REG_AX,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+27739, 0},
    {I_XCHG, 2, {REG_EAX,REG32NA,0,0,0}, NO_DECORATOR, nasm_bytecodes+27743, 5},
    {I_XCHG, 2, {REG_RAX,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+27747, 7},
    {I_XCHG, 2, {REG_GPR|BITS16,REG_AX,0,0,0}, NO_DECORATOR, nasm_bytecodes+27751, 0},
    {I_XCHG, 2, {REG32NA,REG_EAX,0,0,0}, NO_DECORATOR, nasm_bytecodes+27755, 5},
    {I_XCHG, 2, {REG_GPR|BITS64,REG_RAX,0,0,0}, NO_DECORATOR, nasm_bytecodes+27759, 7},
    {I_XCHG, 2, {REG_EAX,REG_EAX,0,0,0}, NO_DECORATOR, nasm_bytecodes+27763, 19},
    {I_XCHG, 2, {REG_GPR|BITS8,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26633, 3},
    {I_XCHG, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26634, 0},
    {I_XCHG, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+22555, 3},
    {I_XCHG, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22556, 0},
    {I_XCHG, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+22561, 4},
    {I_XCHG, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22562, 5},
    {I_XCHG, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+22567, 6},
    {I_XCHG, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22568, 7},
    {I_XCHG, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26638, 3},
    {I_XCHG, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26639, 0},
    {I_XCHG, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22573, 3},
    {I_XCHG, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22574, 0},
    {I_XCHG, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22579, 4},
    {I_XCHG, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22580, 5},
    {I_XCHG, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22585, 6},
    {I_XCHG, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22586, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_XCRYPTCBC[] = {
    {I_XCRYPTCBC, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23761, 17},
    ITEMPLATE_END
};

static const struct itemplate instrux_XCRYPTCFB[] = {
    {I_XCRYPTCFB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23773, 17},
    ITEMPLATE_END
};

static const struct itemplate instrux_XCRYPTCTR[] = {
    {I_XCRYPTCTR, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23767, 17},
    ITEMPLATE_END
};

static const struct itemplate instrux_XCRYPTECB[] = {
    {I_XCRYPTECB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23755, 17},
    ITEMPLATE_END
};

static const struct itemplate instrux_XCRYPTOFB[] = {
    {I_XCRYPTOFB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23779, 17},
    ITEMPLATE_END
};

static const struct itemplate instrux_XEND[] = {
    {I_XEND, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26768, 188},
    ITEMPLATE_END
};

static const struct itemplate instrux_XGETBV[] = {
    {I_XGETBV, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26683, 121},
    ITEMPLATE_END
};

static const struct itemplate instrux_XLAT[] = {
    {I_XLAT, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27832, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_XLATB[] = {
    {I_XLATB, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+27832, 0},
    ITEMPLATE_END
};

static const struct itemplate instrux_XOR[] = {
    {I_XOR, 2, {MEMORY,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26643, 3},
    {I_XOR, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+26644, 0},
    {I_XOR, 2, {MEMORY,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22591, 3},
    {I_XOR, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+22592, 0},
    {I_XOR, 2, {MEMORY,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22597, 4},
    {I_XOR, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+22598, 5},
    {I_XOR, 2, {MEMORY,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22603, 6},
    {I_XOR, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+22604, 7},
    {I_XOR, 2, {REG_GPR|BITS8,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+20087, 8},
    {I_XOR, 2, {REG_GPR|BITS8,REG_GPR|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+20087, 0},
    {I_XOR, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26648, 8},
    {I_XOR, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+26648, 0},
    {I_XOR, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26653, 9},
    {I_XOR, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+26653, 5},
    {I_XOR, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+26658, 10},
    {I_XOR, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+26658, 7},
    {I_XOR, 2, {RM_GPR|BITS16,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+13574, 11},
    {I_XOR, 2, {RM_GPR|BITS32,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+13581, 12},
    {I_XOR, 2, {RM_GPR|BITS64,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+13588, 13},
    {I_XOR, 2, {REG_AL,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+27767, 8},
    {I_XOR, 2, {REG_AX,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13575, 8},
    {I_XOR, 2, {REG_AX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26663, 8},
    {I_XOR, 2, {REG_EAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13582, 9},
    {I_XOR, 2, {REG_EAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26668, 9},
    {I_XOR, 2, {REG_RAX,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13589, 10},
    {I_XOR, 2, {REG_RAX,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+26673, 10},
    {I_XOR, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+22609, 3},
    {I_XOR, 2, {RM_GPR|BITS16,SBYTEWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13574, 3},
    {I_XOR, 2, {RM_GPR|BITS16,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13595, 3},
    {I_XOR, 2, {RM_GPR|BITS32,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13581, 4},
    {I_XOR, 2, {RM_GPR|BITS32,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13602, 4},
    {I_XOR, 2, {RM_GPR|BITS64,SBYTEDWORD,0,0,0}, NO_DECORATOR, nasm_bytecodes+13588, 6},
    {I_XOR, 2, {RM_GPR|BITS64,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+13609, 6},
    {I_XOR, 2, {MEMORY,IMMEDIATE|BITS8,0,0,0}, NO_DECORATOR, nasm_bytecodes+22609, 3},
    {I_XOR, 2, {MEMORY,SBYTEWORD|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13574, 3},
    {I_XOR, 2, {MEMORY,IMMEDIATE|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13595, 3},
    {I_XOR, 2, {MEMORY,SBYTEDWORD|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13581, 4},
    {I_XOR, 2, {MEMORY,IMMEDIATE|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13602, 4},
    {I_XOR, 2, {RM_GPR|BITS8,IMMEDIATE,0,0,0}, NO_DECORATOR, nasm_bytecodes+22615, 14},
    ITEMPLATE_END
};

static const struct itemplate instrux_XORPD[] = {
    {I_XORPD, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+23593, 131},
    ITEMPLATE_END
};

static const struct itemplate instrux_XORPS[] = {
    {I_XORPS, 2, {XMM_L16,RM_XMM_L16|BITS128,0,0,0}, NO_DECORATOR, nasm_bytecodes+22873, 111},
    ITEMPLATE_END
};

static const struct itemplate instrux_XRSTOR[] = {
    {I_XRSTOR, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13750, 121},
    ITEMPLATE_END
};

static const struct itemplate instrux_XRSTOR64[] = {
    {I_XRSTOR64, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13749, 123},
    ITEMPLATE_END
};

static const struct itemplate instrux_XSAVE[] = {
    {I_XSAVE, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13736, 121},
    ITEMPLATE_END
};

static const struct itemplate instrux_XSAVE64[] = {
    {I_XSAVE64, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13735, 123},
    ITEMPLATE_END
};

static const struct itemplate instrux_XSAVEOPT[] = {
    {I_XSAVEOPT, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13743, 124},
    ITEMPLATE_END
};

static const struct itemplate instrux_XSAVEOPT64[] = {
    {I_XSAVEOPT64, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13742, 125},
    ITEMPLATE_END
};

static const struct itemplate instrux_XSETBV[] = {
    {I_XSETBV, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26688, 122},
    ITEMPLATE_END
};

static const struct itemplate instrux_XSHA1[] = {
    {I_XSHA1, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23791, 17},
    ITEMPLATE_END
};

static const struct itemplate instrux_XSHA256[] = {
    {I_XSHA256, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+23797, 17},
    ITEMPLATE_END
};

static const struct itemplate instrux_XSTORE[] = {
    {I_XSTORE, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26758, 17},
    ITEMPLATE_END
};

static const struct itemplate instrux_XTEST[] = {
    {I_XTEST, 0, {0,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26773, 191},
    ITEMPLATE_END
};

static const struct itemplate instrux_CMOVcc[] = {
    {I_CMOVcc, 2, {REG_GPR|BITS16,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+13616, 109},
    {I_CMOVcc, 2, {REG_GPR|BITS16,REG_GPR|BITS16,0,0,0}, NO_DECORATOR, nasm_bytecodes+13616, 84},
    {I_CMOVcc, 2, {REG_GPR|BITS32,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+13623, 109},
    {I_CMOVcc, 2, {REG_GPR|BITS32,REG_GPR|BITS32,0,0,0}, NO_DECORATOR, nasm_bytecodes+13623, 84},
    {I_CMOVcc, 2, {REG_GPR|BITS64,MEMORY,0,0,0}, NO_DECORATOR, nasm_bytecodes+13630, 10},
    {I_CMOVcc, 2, {REG_GPR|BITS64,REG_GPR|BITS64,0,0,0}, NO_DECORATOR, nasm_bytecodes+13630, 7},
    ITEMPLATE_END
};

static const struct itemplate instrux_Jcc[] = {
    {I_Jcc, 1, {IMMEDIATE|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13637, 110},
    {I_Jcc, 1, {IMMEDIATE|BITS16|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13644, 27},
    {I_Jcc, 1, {IMMEDIATE|BITS32|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13651, 27},
    {I_Jcc, 1, {IMMEDIATE|BITS64|NEAR,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13658, 28},
    {I_Jcc, 1, {IMMEDIATE|SHORT,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26679, 25},
    {I_Jcc, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26678, 25},
    {I_Jcc, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13659, 110},
    {I_Jcc, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+13665, 25},
    {I_Jcc, 1, {IMMEDIATE,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+26679, 25},
    ITEMPLATE_END
};

static const struct itemplate instrux_SETcc[] = {
    {I_SETcc, 1, {MEMORY,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22621, 21},
    {I_SETcc, 1, {REG_GPR|BITS8,0,0,0,0}, NO_DECORATOR, nasm_bytecodes+22621, 5},
    ITEMPLATE_END
};

const struct itemplate * const nasm_instructions[] = {
    instrux_AAA,
    instrux_AAD,
    instrux_AAM,
    instrux_AAS,
    instrux_ADC,
    instrux_ADCX,
    instrux_ADD,
    instrux_ADDPD,
    instrux_ADDPS,
    instrux_ADDSD,
    instrux_ADDSS,
    instrux_ADDSUBPD,
    instrux_ADDSUBPS,
    instrux_ADOX,
    instrux_AESDEC,
    instrux_AESDECLAST,
    instrux_AESENC,
    instrux_AESENCLAST,
    instrux_AESIMC,
    instrux_AESKEYGENASSIST,
    instrux_AND,
    instrux_ANDN,
    instrux_ANDNPD,
    instrux_ANDNPS,
    instrux_ANDPD,
    instrux_ANDPS,
    instrux_ARPL,
    instrux_BB0_RESET,
    instrux_BB1_RESET,
    instrux_BEXTR,
    instrux_BLCFILL,
    instrux_BLCI,
    instrux_BLCIC,
    instrux_BLCMSK,
    instrux_BLCS,
    instrux_BLENDPD,
    instrux_BLENDPS,
    instrux_BLENDVPD,
    instrux_BLENDVPS,
    instrux_BLSFILL,
    instrux_BLSI,
    instrux_BLSIC,
    instrux_BLSMSK,
    instrux_BLSR,
    instrux_BNDCL,
    instrux_BNDCN,
    instrux_BNDCU,
    instrux_BNDLDX,
    instrux_BNDMK,
    instrux_BNDMOV,
    instrux_BNDSTX,
    instrux_BOUND,
    instrux_BSF,
    instrux_BSR,
    instrux_BSWAP,
    instrux_BT,
    instrux_BTC,
    instrux_BTR,
    instrux_BTS,
    instrux_BZHI,
    instrux_CALL,
    instrux_CBW,
    instrux_CDQ,
    instrux_CDQE,
    instrux_CLAC,
    instrux_CLC,
    instrux_CLD,
    instrux_CLFLUSH,
    instrux_CLGI,
    instrux_CLI,
    instrux_CLTS,
    instrux_CMC,
    instrux_CMP,
    instrux_CMPEQPD,
    instrux_CMPEQPS,
    instrux_CMPEQSD,
    instrux_CMPEQSS,
    instrux_CMPLEPD,
    instrux_CMPLEPS,
    instrux_CMPLESD,
    instrux_CMPLESS,
    instrux_CMPLTPD,
    instrux_CMPLTPS,
    instrux_CMPLTSD,
    instrux_CMPLTSS,
    instrux_CMPNEQPD,
    instrux_CMPNEQPS,
    instrux_CMPNEQSD,
    instrux_CMPNEQSS,
    instrux_CMPNLEPD,
    instrux_CMPNLEPS,
    instrux_CMPNLESD,
    instrux_CMPNLESS,
    instrux_CMPNLTPD,
    instrux_CMPNLTPS,
    instrux_CMPNLTSD,
    instrux_CMPNLTSS,
    instrux_CMPORDPD,
    instrux_CMPORDPS,
    instrux_CMPORDSD,
    instrux_CMPORDSS,
    instrux_CMPPD,
    instrux_CMPPS,
    instrux_CMPSB,
    instrux_CMPSD,
    instrux_CMPSQ,
    instrux_CMPSS,
    instrux_CMPSW,
    instrux_CMPUNORDPD,
    instrux_CMPUNORDPS,
    instrux_CMPUNORDSD,
    instrux_CMPUNORDSS,
    instrux_CMPXCHG,
    instrux_CMPXCHG16B,
    instrux_CMPXCHG486,
    instrux_CMPXCHG8B,
    instrux_COMISD,
    instrux_COMISS,
    instrux_CPUID,
    instrux_CPU_READ,
    instrux_CPU_WRITE,
    instrux_CQO,
    instrux_CRC32,
    instrux_CVTDQ2PD,
    instrux_CVTDQ2PS,
    instrux_CVTPD2DQ,
    instrux_CVTPD2PI,
    instrux_CVTPD2PS,
    instrux_CVTPI2PD,
    instrux_CVTPI2PS,
    instrux_CVTPS2DQ,
    instrux_CVTPS2PD,
    instrux_CVTPS2PI,
    instrux_CVTSD2SI,
    instrux_CVTSD2SS,
    instrux_CVTSI2SD,
    instrux_CVTSI2SS,
    instrux_CVTSS2SD,
    instrux_CVTSS2SI,
    instrux_CVTTPD2DQ,
    instrux_CVTTPD2PI,
    instrux_CVTTPS2DQ,
    instrux_CVTTPS2PI,
    instrux_CVTTSD2SI,
    instrux_CVTTSS2SI,
    instrux_CWD,
    instrux_CWDE,
    instrux_DAA,
    instrux_DAS,
    instrux_DB,
    instrux_DD,
    instrux_DEC,
    instrux_DIV,
    instrux_DIVPD,
    instrux_DIVPS,
    instrux_DIVSD,
    instrux_DIVSS,
    instrux_DMINT,
    instrux_DO,
    instrux_DPPD,
    instrux_DPPS,
    instrux_DQ,
    instrux_DT,
    instrux_DW,
    instrux_DY,
    instrux_DZ,
    instrux_EMMS,
    instrux_ENTER,
    instrux_EQU,
    instrux_EXTRACTPS,
    instrux_EXTRQ,
    instrux_F2XM1,
    instrux_FABS,
    instrux_FADD,
    instrux_FADDP,
    instrux_FBLD,
    instrux_FBSTP,
    instrux_FCHS,
    instrux_FCLEX,
    instrux_FCMOVB,
    instrux_FCMOVBE,
    instrux_FCMOVE,
    instrux_FCMOVNB,
    instrux_FCMOVNBE,
    instrux_FCMOVNE,
    instrux_FCMOVNU,
    instrux_FCMOVU,
    instrux_FCOM,
    instrux_FCOMI,
    instrux_FCOMIP,
    instrux_FCOMP,
    instrux_FCOMPP,
    instrux_FCOS,
    instrux_FDECSTP,
    instrux_FDISI,
    instrux_FDIV,
    instrux_FDIVP,
    instrux_FDIVR,
    instrux_FDIVRP,
    instrux_FEMMS,
    instrux_FENI,
    instrux_FFREE,
    instrux_FFREEP,
    instrux_FIADD,
    instrux_FICOM,
    instrux_FICOMP,
    instrux_FIDIV,
    instrux_FIDIVR,
    instrux_FILD,
    instrux_FIMUL,
    instrux_FINCSTP,
    instrux_FINIT,
    instrux_FIST,
    instrux_FISTP,
    instrux_FISTTP,
    instrux_FISUB,
    instrux_FISUBR,
    instrux_FLD,
    instrux_FLD1,
    instrux_FLDCW,
    instrux_FLDENV,
    instrux_FLDL2E,
    instrux_FLDL2T,
    instrux_FLDLG2,
    instrux_FLDLN2,
    instrux_FLDPI,
    instrux_FLDZ,
    instrux_FMUL,
    instrux_FMULP,
    instrux_FNCLEX,
    instrux_FNDISI,
    instrux_FNENI,
    instrux_FNINIT,
    instrux_FNOP,
    instrux_FNSAVE,
    instrux_FNSTCW,
    instrux_FNSTENV,
    instrux_FNSTSW,
    instrux_FPATAN,
    instrux_FPREM,
    instrux_FPREM1,
    instrux_FPTAN,
    instrux_FRNDINT,
    instrux_FRSTOR,
    instrux_FSAVE,
    instrux_FSCALE,
    instrux_FSETPM,
    instrux_FSIN,
    instrux_FSINCOS,
    instrux_FSQRT,
    instrux_FST,
    instrux_FSTCW,
    instrux_FSTENV,
    instrux_FSTP,
    instrux_FSTSW,
    instrux_FSUB,
    instrux_FSUBP,
    instrux_FSUBR,
    instrux_FSUBRP,
    instrux_FTST,
    instrux_FUCOM,
    instrux_FUCOMI,
    instrux_FUCOMIP,
    instrux_FUCOMP,
    instrux_FUCOMPP,
    instrux_FWAIT,
    instrux_FXAM,
    instrux_FXCH,
    instrux_FXRSTOR,
    instrux_FXRSTOR64,
    instrux_FXSAVE,
    instrux_FXSAVE64,
    instrux_FXTRACT,
    instrux_FYL2X,
    instrux_FYL2XP1,
    instrux_GETSEC,
    instrux_HADDPD,
    instrux_HADDPS,
    instrux_HINT_NOP0,
    instrux_HINT_NOP1,
    instrux_HINT_NOP10,
    instrux_HINT_NOP11,
    instrux_HINT_NOP12,
    instrux_HINT_NOP13,
    instrux_HINT_NOP14,
    instrux_HINT_NOP15,
    instrux_HINT_NOP16,
    instrux_HINT_NOP17,
    instrux_HINT_NOP18,
    instrux_HINT_NOP19,
    instrux_HINT_NOP2,
    instrux_HINT_NOP20,
    instrux_HINT_NOP21,
    instrux_HINT_NOP22,
    instrux_HINT_NOP23,
    instrux_HINT_NOP24,
    instrux_HINT_NOP25,
    instrux_HINT_NOP26,
    instrux_HINT_NOP27,
    instrux_HINT_NOP28,
    instrux_HINT_NOP29,
    instrux_HINT_NOP3,
    instrux_HINT_NOP30,
    instrux_HINT_NOP31,
    instrux_HINT_NOP32,
    instrux_HINT_NOP33,
    instrux_HINT_NOP34,
    instrux_HINT_NOP35,
    instrux_HINT_NOP36,
    instrux_HINT_NOP37,
    instrux_HINT_NOP38,
    instrux_HINT_NOP39,
    instrux_HINT_NOP4,
    instrux_HINT_NOP40,
    instrux_HINT_NOP41,
    instrux_HINT_NOP42,
    instrux_HINT_NOP43,
    instrux_HINT_NOP44,
    instrux_HINT_NOP45,
    instrux_HINT_NOP46,
    instrux_HINT_NOP47,
    instrux_HINT_NOP48,
    instrux_HINT_NOP49,
    instrux_HINT_NOP5,
    instrux_HINT_NOP50,
    instrux_HINT_NOP51,
    instrux_HINT_NOP52,
    instrux_HINT_NOP53,
    instrux_HINT_NOP54,
    instrux_HINT_NOP55,
    instrux_HINT_NOP56,
    instrux_HINT_NOP57,
    instrux_HINT_NOP58,
    instrux_HINT_NOP59,
    instrux_HINT_NOP6,
    instrux_HINT_NOP60,
    instrux_HINT_NOP61,
    instrux_HINT_NOP62,
    instrux_HINT_NOP63,
    instrux_HINT_NOP7,
    instrux_HINT_NOP8,
    instrux_HINT_NOP9,
    instrux_HLT,
    instrux_HSUBPD,
    instrux_HSUBPS,
    instrux_IBTS,
    instrux_ICEBP,
    instrux_IDIV,
    instrux_IMUL,
    instrux_IN,
    instrux_INC,
    instrux_INCBIN,
    instrux_INSB,
    instrux_INSD,
    instrux_INSERTPS,
    instrux_INSERTQ,
    instrux_INSW,
    instrux_INT,
    instrux_INT01,
    instrux_INT03,
    instrux_INT1,
    instrux_INT3,
    instrux_INTO,
    instrux_INVD,
    instrux_INVEPT,
    instrux_INVLPG,
    instrux_INVLPGA,
    instrux_INVPCID,
    instrux_INVVPID,
    instrux_IRET,
    instrux_IRETD,
    instrux_IRETQ,
    instrux_IRETW,
    instrux_JCXZ,
    instrux_JECXZ,
    instrux_JMP,
    instrux_JMPE,
    instrux_JRCXZ,
    instrux_KANDNW,
    instrux_KANDW,
    instrux_KMOVW,
    instrux_KNOTW,
    instrux_KORTESTW,
    instrux_KORW,
    instrux_KSHIFTLW,
    instrux_KSHIFTRW,
    instrux_KUNPCKBW,
    instrux_KXNORW,
    instrux_KXORW,
    instrux_LAHF,
    instrux_LAR,
    instrux_LDDQU,
    instrux_LDMXCSR,
    instrux_LDS,
    instrux_LEA,
    instrux_LEAVE,
    instrux_LES,
    instrux_LFENCE,
    instrux_LFS,
    instrux_LGDT,
    instrux_LGS,
    instrux_LIDT,
    instrux_LLDT,
    instrux_LLWPCB,
    instrux_LMSW,
    instrux_LOADALL,
    instrux_LOADALL286,
    instrux_LODSB,
    instrux_LODSD,
    instrux_LODSQ,
    instrux_LODSW,
    instrux_LOOP,
    instrux_LOOPE,
    instrux_LOOPNE,
    instrux_LOOPNZ,
    instrux_LOOPZ,
    instrux_LSL,
    instrux_LSS,
    instrux_LTR,
    instrux_LWPINS,
    instrux_LWPVAL,
    instrux_LZCNT,
    instrux_MASKMOVDQU,
    instrux_MASKMOVQ,
    instrux_MAXPD,
    instrux_MAXPS,
    instrux_MAXSD,
    instrux_MAXSS,
    instrux_MFENCE,
    instrux_MINPD,
    instrux_MINPS,
    instrux_MINSD,
    instrux_MINSS,
    instrux_MONITOR,
    instrux_MONTMUL,
    instrux_MOV,
    instrux_MOVAPD,
    instrux_MOVAPS,
    instrux_MOVBE,
    instrux_MOVD,
    instrux_MOVDDUP,
    instrux_MOVDQ2Q,
    instrux_MOVDQA,
    instrux_MOVDQU,
    instrux_MOVHLPS,
    instrux_MOVHPD,
    instrux_MOVHPS,
    instrux_MOVLHPS,
    instrux_MOVLPD,
    instrux_MOVLPS,
    instrux_MOVMSKPD,
    instrux_MOVMSKPS,
    instrux_MOVNTDQ,
    instrux_MOVNTDQA,
    instrux_MOVNTI,
    instrux_MOVNTPD,
    instrux_MOVNTPS,
    instrux_MOVNTQ,
    instrux_MOVNTSD,
    instrux_MOVNTSS,
    instrux_MOVQ,
    instrux_MOVQ2DQ,
    instrux_MOVSB,
    instrux_MOVSD,
    instrux_MOVSHDUP,
    instrux_MOVSLDUP,
    instrux_MOVSQ,
    instrux_MOVSS,
    instrux_MOVSW,
    instrux_MOVSX,
    instrux_MOVSXD,
    instrux_MOVUPD,
    instrux_MOVUPS,
    instrux_MOVZX,
    instrux_MPSADBW,
    instrux_MUL,
    instrux_MULPD,
    instrux_MULPS,
    instrux_MULSD,
    instrux_MULSS,
    instrux_MULX,
    instrux_MWAIT,
    instrux_NEG,
    instrux_NOP,
    instrux_NOT,
    instrux_OR,
    instrux_ORPD,
    instrux_ORPS,
    instrux_OUT,
    instrux_OUTSB,
    instrux_OUTSD,
    instrux_OUTSW,
    instrux_PABSB,
    instrux_PABSD,
    instrux_PABSW,
    instrux_PACKSSDW,
    instrux_PACKSSWB,
    instrux_PACKUSDW,
    instrux_PACKUSWB,
    instrux_PADDB,
    instrux_PADDD,
    instrux_PADDQ,
    instrux_PADDSB,
    instrux_PADDSIW,
    instrux_PADDSW,
    instrux_PADDUSB,
    instrux_PADDUSW,
    instrux_PADDW,
    instrux_PALIGNR,
    instrux_PAND,
    instrux_PANDN,
    instrux_PAUSE,
    instrux_PAVEB,
    instrux_PAVGB,
    instrux_PAVGUSB,
    instrux_PAVGW,
    instrux_PBLENDVB,
    instrux_PBLENDW,
    instrux_PCLMULHQHQDQ,
    instrux_PCLMULHQLQDQ,
    instrux_PCLMULLQHQDQ,
    instrux_PCLMULLQLQDQ,
    instrux_PCLMULQDQ,
    instrux_PCMPEQB,
    instrux_PCMPEQD,
    instrux_PCMPEQQ,
    instrux_PCMPEQW,
    instrux_PCMPESTRI,
    instrux_PCMPESTRM,
    instrux_PCMPGTB,
    instrux_PCMPGTD,
    instrux_PCMPGTQ,
    instrux_PCMPGTW,
    instrux_PCMPISTRI,
    instrux_PCMPISTRM,
    instrux_PDEP,
    instrux_PDISTIB,
    instrux_PEXT,
    instrux_PEXTRB,
    instrux_PEXTRD,
    instrux_PEXTRQ,
    instrux_PEXTRW,
    instrux_PF2ID,
    instrux_PF2IW,
    instrux_PFACC,
    instrux_PFADD,
    instrux_PFCMPEQ,
    instrux_PFCMPGE,
    instrux_PFCMPGT,
    instrux_PFMAX,
    instrux_PFMIN,
    instrux_PFMUL,
    instrux_PFNACC,
    instrux_PFPNACC,
    instrux_PFRCP,
    instrux_PFRCPIT1,
    instrux_PFRCPIT2,
    instrux_PFRCPV,
    instrux_PFRSQIT1,
    instrux_PFRSQRT,
    instrux_PFRSQRTV,
    instrux_PFSUB,
    instrux_PFSUBR,
    instrux_PHADDD,
    instrux_PHADDSW,
    instrux_PHADDW,
    instrux_PHMINPOSUW,
    instrux_PHSUBD,
    instrux_PHSUBSW,
    instrux_PHSUBW,
    instrux_PI2FD,
    instrux_PI2FW,
    instrux_PINSRB,
    instrux_PINSRD,
    instrux_PINSRQ,
    instrux_PINSRW,
    instrux_PMACHRIW,
    instrux_PMADDUBSW,
    instrux_PMADDWD,
    instrux_PMAGW,
    instrux_PMAXSB,
    instrux_PMAXSD,
    instrux_PMAXSW,
    instrux_PMAXUB,
    instrux_PMAXUD,
    instrux_PMAXUW,
    instrux_PMINSB,
    instrux_PMINSD,
    instrux_PMINSW,
    instrux_PMINUB,
    instrux_PMINUD,
    instrux_PMINUW,
    instrux_PMOVMSKB,
    instrux_PMOVSXBD,
    instrux_PMOVSXBQ,
    instrux_PMOVSXBW,
    instrux_PMOVSXDQ,
    instrux_PMOVSXWD,
    instrux_PMOVSXWQ,
    instrux_PMOVZXBD,
    instrux_PMOVZXBQ,
    instrux_PMOVZXBW,
    instrux_PMOVZXDQ,
    instrux_PMOVZXWD,
    instrux_PMOVZXWQ,
    instrux_PMULDQ,
    instrux_PMULHRIW,
    instrux_PMULHRSW,
    instrux_PMULHRWA,
    instrux_PMULHRWC,
    instrux_PMULHUW,
    instrux_PMULHW,
    instrux_PMULLD,
    instrux_PMULLW,
    instrux_PMULUDQ,
    instrux_PMVGEZB,
    instrux_PMVLZB,
    instrux_PMVNZB,
    instrux_PMVZB,
    instrux_POP,
    instrux_POPA,
    instrux_POPAD,
    instrux_POPAW,
    instrux_POPCNT,
    instrux_POPF,
    instrux_POPFD,
    instrux_POPFQ,
    instrux_POPFW,
    instrux_POR,
    instrux_PREFETCH,
    instrux_PREFETCHNTA,
    instrux_PREFETCHT0,
    instrux_PREFETCHT1,
    instrux_PREFETCHT2,
    instrux_PREFETCHW,
    instrux_PREFETCHWT1,
    instrux_PSADBW,
    instrux_PSHUFB,
    instrux_PSHUFD,
    instrux_PSHUFHW,
    instrux_PSHUFLW,
    instrux_PSHUFW,
    instrux_PSIGNB,
    instrux_PSIGND,
    instrux_PSIGNW,
    instrux_PSLLD,
    instrux_PSLLDQ,
    instrux_PSLLQ,
    instrux_PSLLW,
    instrux_PSRAD,
    instrux_PSRAW,
    instrux_PSRLD,
    instrux_PSRLDQ,
    instrux_PSRLQ,
    instrux_PSRLW,
    instrux_PSUBB,
    instrux_PSUBD,
    instrux_PSUBQ,
    instrux_PSUBSB,
    instrux_PSUBSIW,
    instrux_PSUBSW,
    instrux_PSUBUSB,
    instrux_PSUBUSW,
    instrux_PSUBW,
    instrux_PSWAPD,
    instrux_PTEST,
    instrux_PUNPCKHBW,
    instrux_PUNPCKHDQ,
    instrux_PUNPCKHQDQ,
    instrux_PUNPCKHWD,
    instrux_PUNPCKLBW,
    instrux_PUNPCKLDQ,
    instrux_PUNPCKLQDQ,
    instrux_PUNPCKLWD,
    instrux_PUSH,
    instrux_PUSHA,
    instrux_PUSHAD,
    instrux_PUSHAW,
    instrux_PUSHF,
    instrux_PUSHFD,
    instrux_PUSHFQ,
    instrux_PUSHFW,
    instrux_PXOR,
    instrux_RCL,
    instrux_RCPPS,
    instrux_RCPSS,
    instrux_RCR,
    instrux_RDFSBASE,
    instrux_RDGSBASE,
    instrux_RDM,
    instrux_RDMSR,
    instrux_RDPMC,
    instrux_RDRAND,
    instrux_RDSEED,
    instrux_RDSHR,
    instrux_RDTSC,
    instrux_RDTSCP,
    instrux_RESB,
    instrux_RESD,
    instrux_RESO,
    instrux_RESQ,
    instrux_REST,
    instrux_RESW,
    instrux_RESY,
    instrux_RESZ,
    instrux_RET,
    instrux_RETF,
    instrux_RETN,
    instrux_ROL,
    instrux_ROR,
    instrux_RORX,
    instrux_ROUNDPD,
    instrux_ROUNDPS,
    instrux_ROUNDSD,
    instrux_ROUNDSS,
    instrux_RSDC,
    instrux_RSLDT,
    instrux_RSM,
    instrux_RSQRTPS,
    instrux_RSQRTSS,
    instrux_RSTS,
    instrux_SAHF,
    instrux_SAL,
    instrux_SALC,
    instrux_SAR,
    instrux_SARX,
    instrux_SBB,
    instrux_SCASB,
    instrux_SCASD,
    instrux_SCASQ,
    instrux_SCASW,
    instrux_SFENCE,
    instrux_SGDT,
    instrux_SHA1MSG1,
    instrux_SHA1MSG2,
    instrux_SHA1NEXTE,
    instrux_SHA1RNDS4,
    instrux_SHA256MSG1,
    instrux_SHA256MSG2,
    instrux_SHA256RNDS2,
    instrux_SHL,
    instrux_SHLD,
    instrux_SHLX,
    instrux_SHR,
    instrux_SHRD,
    instrux_SHRX,
    instrux_SHUFPD,
    instrux_SHUFPS,
    instrux_SIDT,
    instrux_SKINIT,
    instrux_SLDT,
    instrux_SLWPCB,
    instrux_SMI,
    instrux_SMINT,
    instrux_SMINTOLD,
    instrux_SMSW,
    instrux_SQRTPD,
    instrux_SQRTPS,
    instrux_SQRTSD,
    instrux_SQRTSS,
    instrux_STAC,
    instrux_STC,
    instrux_STD,
    instrux_STGI,
    instrux_STI,
    instrux_STMXCSR,
    instrux_STOSB,
    instrux_STOSD,
    instrux_STOSQ,
    instrux_STOSW,
    instrux_STR,
    instrux_SUB,
    instrux_SUBPD,
    instrux_SUBPS,
    instrux_SUBSD,
    instrux_SUBSS,
    instrux_SVDC,
    instrux_SVLDT,
    instrux_SVTS,
    instrux_SWAPGS,
    instrux_SYSCALL,
    instrux_SYSENTER,
    instrux_SYSEXIT,
    instrux_SYSRET,
    instrux_T1MSKC,
    instrux_TEST,
    instrux_TZCNT,
    instrux_TZMSK,
    instrux_UCOMISD,
    instrux_UCOMISS,
    instrux_UD0,
    instrux_UD1,
    instrux_UD2,
    instrux_UD2A,
    instrux_UD2B,
    instrux_UMOV,
    instrux_UNPCKHPD,
    instrux_UNPCKHPS,
    instrux_UNPCKLPD,
    instrux_UNPCKLPS,
    instrux_VADDPD,
    instrux_VADDPS,
    instrux_VADDSD,
    instrux_VADDSS,
    instrux_VADDSUBPD,
    instrux_VADDSUBPS,
    instrux_VAESDEC,
    instrux_VAESDECLAST,
    instrux_VAESENC,
    instrux_VAESENCLAST,
    instrux_VAESIMC,
    instrux_VAESKEYGENASSIST,
    instrux_VALIGND,
    instrux_VALIGNQ,
    instrux_VANDNPD,
    instrux_VANDNPS,
    instrux_VANDPD,
    instrux_VANDPS,
    instrux_VBLENDMPD,
    instrux_VBLENDMPS,
    instrux_VBLENDPD,
    instrux_VBLENDPS,
    instrux_VBLENDVPD,
    instrux_VBLENDVPS,
    instrux_VBROADCASTF128,
    instrux_VBROADCASTF32X4,
    instrux_VBROADCASTF64X4,
    instrux_VBROADCASTI128,
    instrux_VBROADCASTI32X4,
    instrux_VBROADCASTI64X4,
    instrux_VBROADCASTSD,
    instrux_VBROADCASTSS,
    instrux_VCMPEQPD,
    instrux_VCMPEQPS,
    instrux_VCMPEQSD,
    instrux_VCMPEQSS,
    instrux_VCMPEQ_OSPD,
    instrux_VCMPEQ_OSPS,
    instrux_VCMPEQ_OSSD,
    instrux_VCMPEQ_OSSS,
    instrux_VCMPEQ_UQPD,
    instrux_VCMPEQ_UQPS,
    instrux_VCMPEQ_UQSD,
    instrux_VCMPEQ_UQSS,
    instrux_VCMPEQ_USPD,
    instrux_VCMPEQ_USPS,
    instrux_VCMPEQ_USSD,
    instrux_VCMPEQ_USSS,
    instrux_VCMPFALSEPD,
    instrux_VCMPFALSEPS,
    instrux_VCMPFALSESD,
    instrux_VCMPFALSESS,
    instrux_VCMPFALSE_OQPD,
    instrux_VCMPFALSE_OQPS,
    instrux_VCMPFALSE_OQSD,
    instrux_VCMPFALSE_OQSS,
    instrux_VCMPFALSE_OSPD,
    instrux_VCMPFALSE_OSPS,
    instrux_VCMPFALSE_OSSD,
    instrux_VCMPFALSE_OSSS,
    instrux_VCMPGEPD,
    instrux_VCMPGEPS,
    instrux_VCMPGESD,
    instrux_VCMPGESS,
    instrux_VCMPGE_OQPD,
    instrux_VCMPGE_OQPS,
    instrux_VCMPGE_OQSD,
    instrux_VCMPGE_OQSS,
    instrux_VCMPGE_OSPD,
    instrux_VCMPGE_OSPS,
    instrux_VCMPGE_OSSD,
    instrux_VCMPGE_OSSS,
    instrux_VCMPGTPD,
    instrux_VCMPGTPS,
    instrux_VCMPGTSD,
    instrux_VCMPGTSS,
    instrux_VCMPGT_OQPD,
    instrux_VCMPGT_OQPS,
    instrux_VCMPGT_OQSD,
    instrux_VCMPGT_OQSS,
    instrux_VCMPGT_OSPD,
    instrux_VCMPGT_OSPS,
    instrux_VCMPGT_OSSD,
    instrux_VCMPGT_OSSS,
    instrux_VCMPLEPD,
    instrux_VCMPLEPS,
    instrux_VCMPLESD,
    instrux_VCMPLESS,
    instrux_VCMPLE_OQPD,
    instrux_VCMPLE_OQPS,
    instrux_VCMPLE_OQSD,
    instrux_VCMPLE_OQSS,
    instrux_VCMPLE_OSPD,
    instrux_VCMPLE_OSPS,
    instrux_VCMPLE_OSSD,
    instrux_VCMPLE_OSSS,
    instrux_VCMPLTPD,
    instrux_VCMPLTPS,
    instrux_VCMPLTSD,
    instrux_VCMPLTSS,
    instrux_VCMPLT_OQPD,
    instrux_VCMPLT_OQPS,
    instrux_VCMPLT_OQSD,
    instrux_VCMPLT_OQSS,
    instrux_VCMPLT_OSPD,
    instrux_VCMPLT_OSPS,
    instrux_VCMPLT_OSSD,
    instrux_VCMPLT_OSSS,
    instrux_VCMPNEQPD,
    instrux_VCMPNEQPS,
    instrux_VCMPNEQSD,
    instrux_VCMPNEQSS,
    instrux_VCMPNEQ_OQPD,
    instrux_VCMPNEQ_OQPS,
    instrux_VCMPNEQ_OQSD,
    instrux_VCMPNEQ_OQSS,
    instrux_VCMPNEQ_OSPD,
    instrux_VCMPNEQ_OSPS,
    instrux_VCMPNEQ_OSSD,
    instrux_VCMPNEQ_OSSS,
    instrux_VCMPNEQ_UQPD,
    instrux_VCMPNEQ_UQPS,
    instrux_VCMPNEQ_UQSD,
    instrux_VCMPNEQ_UQSS,
    instrux_VCMPNEQ_USPD,
    instrux_VCMPNEQ_USPS,
    instrux_VCMPNEQ_USSD,
    instrux_VCMPNEQ_USSS,
    instrux_VCMPNGEPD,
    instrux_VCMPNGEPS,
    instrux_VCMPNGESD,
    instrux_VCMPNGESS,
    instrux_VCMPNGE_UQPD,
    instrux_VCMPNGE_UQPS,
    instrux_VCMPNGE_UQSD,
    instrux_VCMPNGE_UQSS,
    instrux_VCMPNGE_USPD,
    instrux_VCMPNGE_USPS,
    instrux_VCMPNGE_USSD,
    instrux_VCMPNGE_USSS,
    instrux_VCMPNGTPD,
    instrux_VCMPNGTPS,
    instrux_VCMPNGTSD,
    instrux_VCMPNGTSS,
    instrux_VCMPNGT_UQPD,
    instrux_VCMPNGT_UQPS,
    instrux_VCMPNGT_UQSD,
    instrux_VCMPNGT_UQSS,
    instrux_VCMPNGT_USPD,
    instrux_VCMPNGT_USPS,
    instrux_VCMPNGT_USSD,
    instrux_VCMPNGT_USSS,
    instrux_VCMPNLEPD,
    instrux_VCMPNLEPS,
    instrux_VCMPNLESD,
    instrux_VCMPNLESS,
    instrux_VCMPNLE_UQPD,
    instrux_VCMPNLE_UQPS,
    instrux_VCMPNLE_UQSD,
    instrux_VCMPNLE_UQSS,
    instrux_VCMPNLE_USPD,
    instrux_VCMPNLE_USPS,
    instrux_VCMPNLE_USSD,
    instrux_VCMPNLE_USSS,
    instrux_VCMPNLTPD,
    instrux_VCMPNLTPS,
    instrux_VCMPNLTSD,
    instrux_VCMPNLTSS,
    instrux_VCMPNLT_UQPD,
    instrux_VCMPNLT_UQPS,
    instrux_VCMPNLT_UQSD,
    instrux_VCMPNLT_UQSS,
    instrux_VCMPNLT_USPD,
    instrux_VCMPNLT_USPS,
    instrux_VCMPNLT_USSD,
    instrux_VCMPNLT_USSS,
    instrux_VCMPORDPD,
    instrux_VCMPORDPS,
    instrux_VCMPORDSD,
    instrux_VCMPORDSS,
    instrux_VCMPORD_QPD,
    instrux_VCMPORD_QPS,
    instrux_VCMPORD_QSD,
    instrux_VCMPORD_QSS,
    instrux_VCMPORD_SPD,
    instrux_VCMPORD_SPS,
    instrux_VCMPORD_SSD,
    instrux_VCMPORD_SSS,
    instrux_VCMPPD,
    instrux_VCMPPS,
    instrux_VCMPSD,
    instrux_VCMPSS,
    instrux_VCMPTRUEPD,
    instrux_VCMPTRUEPS,
    instrux_VCMPTRUESD,
    instrux_VCMPTRUESS,
    instrux_VCMPTRUE_UQPD,
    instrux_VCMPTRUE_UQPS,
    instrux_VCMPTRUE_UQSD,
    instrux_VCMPTRUE_UQSS,
    instrux_VCMPTRUE_USPD,
    instrux_VCMPTRUE_USPS,
    instrux_VCMPTRUE_USSD,
    instrux_VCMPTRUE_USSS,
    instrux_VCMPUNORDPD,
    instrux_VCMPUNORDPS,
    instrux_VCMPUNORDSD,
    instrux_VCMPUNORDSS,
    instrux_VCMPUNORD_QPD,
    instrux_VCMPUNORD_QPS,
    instrux_VCMPUNORD_QSD,
    instrux_VCMPUNORD_QSS,
    instrux_VCMPUNORD_SPD,
    instrux_VCMPUNORD_SPS,
    instrux_VCMPUNORD_SSD,
    instrux_VCMPUNORD_SSS,
    instrux_VCOMISD,
    instrux_VCOMISS,
    instrux_VCOMPRESSPD,
    instrux_VCOMPRESSPS,
    instrux_VCVTDQ2PD,
    instrux_VCVTDQ2PS,
    instrux_VCVTPD2DQ,
    instrux_VCVTPD2PS,
    instrux_VCVTPD2UDQ,
    instrux_VCVTPH2PS,
    instrux_VCVTPS2DQ,
    instrux_VCVTPS2PD,
    instrux_VCVTPS2PH,
    instrux_VCVTPS2UDQ,
    instrux_VCVTSD2SI,
    instrux_VCVTSD2SS,
    instrux_VCVTSD2USI,
    instrux_VCVTSI2SD,
    instrux_VCVTSI2SS,
    instrux_VCVTSS2SD,
    instrux_VCVTSS2SI,
    instrux_VCVTSS2USI,
    instrux_VCVTTPD2DQ,
    instrux_VCVTTPD2UDQ,
    instrux_VCVTTPS2DQ,
    instrux_VCVTTPS2UDQ,
    instrux_VCVTTSD2SI,
    instrux_VCVTTSD2USI,
    instrux_VCVTTSS2SI,
    instrux_VCVTTSS2USI,
    instrux_VCVTUDQ2PD,
    instrux_VCVTUDQ2PS,
    instrux_VCVTUSI2SD,
    instrux_VCVTUSI2SS,
    instrux_VDIVPD,
    instrux_VDIVPS,
    instrux_VDIVSD,
    instrux_VDIVSS,
    instrux_VDPPD,
    instrux_VDPPS,
    instrux_VERR,
    instrux_VERW,
    instrux_VEXP2PD,
    instrux_VEXP2PS,
    instrux_VEXPANDPD,
    instrux_VEXPANDPS,
    instrux_VEXTRACTF128,
    instrux_VEXTRACTF32X4,
    instrux_VEXTRACTF64X4,
    instrux_VEXTRACTI128,
    instrux_VEXTRACTI32X4,
    instrux_VEXTRACTI64X4,
    instrux_VEXTRACTPS,
    instrux_VFIXUPIMMPD,
    instrux_VFIXUPIMMPS,
    instrux_VFIXUPIMMSD,
    instrux_VFIXUPIMMSS,
    instrux_VFMADD123PD,
    instrux_VFMADD123PS,
    instrux_VFMADD123SD,
    instrux_VFMADD123SS,
    instrux_VFMADD132PD,
    instrux_VFMADD132PS,
    instrux_VFMADD132SD,
    instrux_VFMADD132SS,
    instrux_VFMADD213PD,
    instrux_VFMADD213PS,
    instrux_VFMADD213SD,
    instrux_VFMADD213SS,
    instrux_VFMADD231PD,
    instrux_VFMADD231PS,
    instrux_VFMADD231SD,
    instrux_VFMADD231SS,
    instrux_VFMADD312PD,
    instrux_VFMADD312PS,
    instrux_VFMADD312SD,
    instrux_VFMADD312SS,
    instrux_VFMADD321PD,
    instrux_VFMADD321PS,
    instrux_VFMADD321SD,
    instrux_VFMADD321SS,
    instrux_VFMADDPD,
    instrux_VFMADDPS,
    instrux_VFMADDSD,
    instrux_VFMADDSS,
    instrux_VFMADDSUB123PD,
    instrux_VFMADDSUB123PS,
    instrux_VFMADDSUB132PD,
    instrux_VFMADDSUB132PS,
    instrux_VFMADDSUB213PD,
    instrux_VFMADDSUB213PS,
    instrux_VFMADDSUB231PD,
    instrux_VFMADDSUB231PS,
    instrux_VFMADDSUB312PD,
    instrux_VFMADDSUB312PS,
    instrux_VFMADDSUB321PD,
    instrux_VFMADDSUB321PS,
    instrux_VFMADDSUBPD,
    instrux_VFMADDSUBPS,
    instrux_VFMSUB123PD,
    instrux_VFMSUB123PS,
    instrux_VFMSUB123SD,
    instrux_VFMSUB123SS,
    instrux_VFMSUB132PD,
    instrux_VFMSUB132PS,
    instrux_VFMSUB132SD,
    instrux_VFMSUB132SS,
    instrux_VFMSUB213PD,
    instrux_VFMSUB213PS,
    instrux_VFMSUB213SD,
    instrux_VFMSUB213SS,
    instrux_VFMSUB231PD,
    instrux_VFMSUB231PS,
    instrux_VFMSUB231SD,
    instrux_VFMSUB231SS,
    instrux_VFMSUB312PD,
    instrux_VFMSUB312PS,
    instrux_VFMSUB312SD,
    instrux_VFMSUB312SS,
    instrux_VFMSUB321PD,
    instrux_VFMSUB321PS,
    instrux_VFMSUB321SD,
    instrux_VFMSUB321SS,
    instrux_VFMSUBADD123PD,
    instrux_VFMSUBADD123PS,
    instrux_VFMSUBADD132PD,
    instrux_VFMSUBADD132PS,
    instrux_VFMSUBADD213PD,
    instrux_VFMSUBADD213PS,
    instrux_VFMSUBADD231PD,
    instrux_VFMSUBADD231PS,
    instrux_VFMSUBADD312PD,
    instrux_VFMSUBADD312PS,
    instrux_VFMSUBADD321PD,
    instrux_VFMSUBADD321PS,
    instrux_VFMSUBADDPD,
    instrux_VFMSUBADDPS,
    instrux_VFMSUBPD,
    instrux_VFMSUBPS,
    instrux_VFMSUBSD,
    instrux_VFMSUBSS,
    instrux_VFNMADD123PD,
    instrux_VFNMADD123PS,
    instrux_VFNMADD123SD,
    instrux_VFNMADD123SS,
    instrux_VFNMADD132PD,
    instrux_VFNMADD132PS,
    instrux_VFNMADD132SD,
    instrux_VFNMADD132SS,
    instrux_VFNMADD213PD,
    instrux_VFNMADD213PS,
    instrux_VFNMADD213SD,
    instrux_VFNMADD213SS,
    instrux_VFNMADD231PD,
    instrux_VFNMADD231PS,
    instrux_VFNMADD231SD,
    instrux_VFNMADD231SS,
    instrux_VFNMADD312PD,
    instrux_VFNMADD312PS,
    instrux_VFNMADD312SD,
    instrux_VFNMADD312SS,
    instrux_VFNMADD321PD,
    instrux_VFNMADD321PS,
    instrux_VFNMADD321SD,
    instrux_VFNMADD321SS,
    instrux_VFNMADDPD,
    instrux_VFNMADDPS,
    instrux_VFNMADDSD,
    instrux_VFNMADDSS,
    instrux_VFNMSUB123PD,
    instrux_VFNMSUB123PS,
    instrux_VFNMSUB123SD,
    instrux_VFNMSUB123SS,
    instrux_VFNMSUB132PD,
    instrux_VFNMSUB132PS,
    instrux_VFNMSUB132SD,
    instrux_VFNMSUB132SS,
    instrux_VFNMSUB213PD,
    instrux_VFNMSUB213PS,
    instrux_VFNMSUB213SD,
    instrux_VFNMSUB213SS,
    instrux_VFNMSUB231PD,
    instrux_VFNMSUB231PS,
    instrux_VFNMSUB231SD,
    instrux_VFNMSUB231SS,
    instrux_VFNMSUB312PD,
    instrux_VFNMSUB312PS,
    instrux_VFNMSUB312SD,
    instrux_VFNMSUB312SS,
    instrux_VFNMSUB321PD,
    instrux_VFNMSUB321PS,
    instrux_VFNMSUB321SD,
    instrux_VFNMSUB321SS,
    instrux_VFNMSUBPD,
    instrux_VFNMSUBPS,
    instrux_VFNMSUBSD,
    instrux_VFNMSUBSS,
    instrux_VFRCZPD,
    instrux_VFRCZPS,
    instrux_VFRCZSD,
    instrux_VFRCZSS,
    instrux_VGATHERDPD,
    instrux_VGATHERDPS,
    instrux_VGATHERPF0DPD,
    instrux_VGATHERPF0DPS,
    instrux_VGATHERPF0QPD,
    instrux_VGATHERPF0QPS,
    instrux_VGATHERPF1DPD,
    instrux_VGATHERPF1DPS,
    instrux_VGATHERPF1QPD,
    instrux_VGATHERPF1QPS,
    instrux_VGATHERQPD,
    instrux_VGATHERQPS,
    instrux_VGETEXPPD,
    instrux_VGETEXPPS,
    instrux_VGETEXPSD,
    instrux_VGETEXPSS,
    instrux_VGETMANTPD,
    instrux_VGETMANTPS,
    instrux_VGETMANTSD,
    instrux_VGETMANTSS,
    instrux_VHADDPD,
    instrux_VHADDPS,
    instrux_VHSUBPD,
    instrux_VHSUBPS,
    instrux_VINSERTF128,
    instrux_VINSERTF32X4,
    instrux_VINSERTF64X4,
    instrux_VINSERTI128,
    instrux_VINSERTI32X4,
    instrux_VINSERTI64X4,
    instrux_VINSERTPS,
    instrux_VLDDQU,
    instrux_VLDMXCSR,
    instrux_VLDQQU,
    instrux_VMASKMOVDQU,
    instrux_VMASKMOVPD,
    instrux_VMASKMOVPS,
    instrux_VMAXPD,
    instrux_VMAXPS,
    instrux_VMAXSD,
    instrux_VMAXSS,
    instrux_VMCALL,
    instrux_VMCLEAR,
    instrux_VMFUNC,
    instrux_VMINPD,
    instrux_VMINPS,
    instrux_VMINSD,
    instrux_VMINSS,
    instrux_VMLAUNCH,
    instrux_VMLOAD,
    instrux_VMMCALL,
    instrux_VMOVAPD,
    instrux_VMOVAPS,
    instrux_VMOVD,
    instrux_VMOVDDUP,
    instrux_VMOVDQA,
    instrux_VMOVDQA32,
    instrux_VMOVDQA64,
    instrux_VMOVDQU,
    instrux_VMOVDQU32,
    instrux_VMOVDQU64,
    instrux_VMOVHLPS,
    instrux_VMOVHPD,
    instrux_VMOVHPS,
    instrux_VMOVLHPS,
    instrux_VMOVLPD,
    instrux_VMOVLPS,
    instrux_VMOVMSKPD,
    instrux_VMOVMSKPS,
    instrux_VMOVNTDQ,
    instrux_VMOVNTDQA,
    instrux_VMOVNTPD,
    instrux_VMOVNTPS,
    instrux_VMOVNTQQ,
    instrux_VMOVQ,
    instrux_VMOVQQA,
    instrux_VMOVQQU,
    instrux_VMOVSD,
    instrux_VMOVSHDUP,
    instrux_VMOVSLDUP,
    instrux_VMOVSS,
    instrux_VMOVUPD,
    instrux_VMOVUPS,
    instrux_VMPSADBW,
    instrux_VMPTRLD,
    instrux_VMPTRST,
    instrux_VMREAD,
    instrux_VMRESUME,
    instrux_VMRUN,
    instrux_VMSAVE,
    instrux_VMULPD,
    instrux_VMULPS,
    instrux_VMULSD,
    instrux_VMULSS,
    instrux_VMWRITE,
    instrux_VMXOFF,
    instrux_VMXON,
    instrux_VORPD,
    instrux_VORPS,
    instrux_VPABSB,
    instrux_VPABSD,
    instrux_VPABSQ,
    instrux_VPABSW,
    instrux_VPACKSSDW,
    instrux_VPACKSSWB,
    instrux_VPACKUSDW,
    instrux_VPACKUSWB,
    instrux_VPADDB,
    instrux_VPADDD,
    instrux_VPADDQ,
    instrux_VPADDSB,
    instrux_VPADDSW,
    instrux_VPADDUSB,
    instrux_VPADDUSW,
    instrux_VPADDW,
    instrux_VPALIGNR,
    instrux_VPAND,
    instrux_VPANDD,
    instrux_VPANDN,
    instrux_VPANDND,
    instrux_VPANDNQ,
    instrux_VPANDQ,
    instrux_VPAVGB,
    instrux_VPAVGW,
    instrux_VPBLENDD,
    instrux_VPBLENDMD,
    instrux_VPBLENDMQ,
    instrux_VPBLENDVB,
    instrux_VPBLENDW,
    instrux_VPBROADCASTB,
    instrux_VPBROADCASTD,
    instrux_VPBROADCASTMB2Q,
    instrux_VPBROADCASTMW2D,
    instrux_VPBROADCASTQ,
    instrux_VPBROADCASTW,
    instrux_VPCLMULHQHQDQ,
    instrux_VPCLMULHQLQDQ,
    instrux_VPCLMULLQHQDQ,
    instrux_VPCLMULLQLQDQ,
    instrux_VPCLMULQDQ,
    instrux_VPCMOV,
    instrux_VPCMPD,
    instrux_VPCMPEQB,
    instrux_VPCMPEQD,
    instrux_VPCMPEQQ,
    instrux_VPCMPEQUD,
    instrux_VPCMPEQUQ,
    instrux_VPCMPEQW,
    instrux_VPCMPESTRI,
    instrux_VPCMPESTRM,
    instrux_VPCMPGTB,
    instrux_VPCMPGTD,
    instrux_VPCMPGTQ,
    instrux_VPCMPGTW,
    instrux_VPCMPISTRI,
    instrux_VPCMPISTRM,
    instrux_VPCMPLED,
    instrux_VPCMPLEQ,
    instrux_VPCMPLEUD,
    instrux_VPCMPLEUQ,
    instrux_VPCMPLTD,
    instrux_VPCMPLTQ,
    instrux_VPCMPLTUD,
    instrux_VPCMPLTUQ,
    instrux_VPCMPNEQD,
    instrux_VPCMPNEQQ,
    instrux_VPCMPNEQUD,
    instrux_VPCMPNEQUQ,
    instrux_VPCMPNLED,
    instrux_VPCMPNLEQ,
    instrux_VPCMPNLEUD,
    instrux_VPCMPNLEUQ,
    instrux_VPCMPNLTD,
    instrux_VPCMPNLTQ,
    instrux_VPCMPNLTUD,
    instrux_VPCMPNLTUQ,
    instrux_VPCMPQ,
    instrux_VPCMPUD,
    instrux_VPCMPUQ,
    instrux_VPCOMB,
    instrux_VPCOMD,
    instrux_VPCOMPRESSD,
    instrux_VPCOMPRESSQ,
    instrux_VPCOMQ,
    instrux_VPCOMUB,
    instrux_VPCOMUD,
    instrux_VPCOMUQ,
    instrux_VPCOMUW,
    instrux_VPCOMW,
    instrux_VPCONFLICTD,
    instrux_VPCONFLICTQ,
    instrux_VPERM2F128,
    instrux_VPERM2I128,
    instrux_VPERMD,
    instrux_VPERMI2D,
    instrux_VPERMI2PD,
    instrux_VPERMI2PS,
    instrux_VPERMI2Q,
    instrux_VPERMILPD,
    instrux_VPERMILPS,
    instrux_VPERMPD,
    instrux_VPERMPS,
    instrux_VPERMQ,
    instrux_VPERMT2D,
    instrux_VPERMT2PD,
    instrux_VPERMT2PS,
    instrux_VPERMT2Q,
    instrux_VPEXPANDD,
    instrux_VPEXPANDQ,
    instrux_VPEXTRB,
    instrux_VPEXTRD,
    instrux_VPEXTRQ,
    instrux_VPEXTRW,
    instrux_VPGATHERDD,
    instrux_VPGATHERDQ,
    instrux_VPGATHERQD,
    instrux_VPGATHERQQ,
    instrux_VPHADDBD,
    instrux_VPHADDBQ,
    instrux_VPHADDBW,
    instrux_VPHADDD,
    instrux_VPHADDDQ,
    instrux_VPHADDSW,
    instrux_VPHADDUBD,
    instrux_VPHADDUBQ,
    instrux_VPHADDUBW,
    instrux_VPHADDUDQ,
    instrux_VPHADDUWD,
    instrux_VPHADDUWQ,
    instrux_VPHADDW,
    instrux_VPHADDWD,
    instrux_VPHADDWQ,
    instrux_VPHMINPOSUW,
    instrux_VPHSUBBW,
    instrux_VPHSUBD,
    instrux_VPHSUBDQ,
    instrux_VPHSUBSW,
    instrux_VPHSUBW,
    instrux_VPHSUBWD,
    instrux_VPINSRB,
    instrux_VPINSRD,
    instrux_VPINSRQ,
    instrux_VPINSRW,
    instrux_VPLZCNTD,
    instrux_VPLZCNTQ,
    instrux_VPMACSDD,
    instrux_VPMACSDQH,
    instrux_VPMACSDQL,
    instrux_VPMACSSDD,
    instrux_VPMACSSDQH,
    instrux_VPMACSSDQL,
    instrux_VPMACSSWD,
    instrux_VPMACSSWW,
    instrux_VPMACSWD,
    instrux_VPMACSWW,
    instrux_VPMADCSSWD,
    instrux_VPMADCSWD,
    instrux_VPMADDUBSW,
    instrux_VPMADDWD,
    instrux_VPMASKMOVD,
    instrux_VPMASKMOVQ,
    instrux_VPMAXSB,
    instrux_VPMAXSD,
    instrux_VPMAXSQ,
    instrux_VPMAXSW,
    instrux_VPMAXUB,
    instrux_VPMAXUD,
    instrux_VPMAXUQ,
    instrux_VPMAXUW,
    instrux_VPMINSB,
    instrux_VPMINSD,
    instrux_VPMINSQ,
    instrux_VPMINSW,
    instrux_VPMINUB,
    instrux_VPMINUD,
    instrux_VPMINUQ,
    instrux_VPMINUW,
    instrux_VPMOVDB,
    instrux_VPMOVDW,
    instrux_VPMOVMSKB,
    instrux_VPMOVQB,
    instrux_VPMOVQD,
    instrux_VPMOVQW,
    instrux_VPMOVSDB,
    instrux_VPMOVSDW,
    instrux_VPMOVSQB,
    instrux_VPMOVSQD,
    instrux_VPMOVSQW,
    instrux_VPMOVSXBD,
    instrux_VPMOVSXBQ,
    instrux_VPMOVSXBW,
    instrux_VPMOVSXDQ,
    instrux_VPMOVSXWD,
    instrux_VPMOVSXWQ,
    instrux_VPMOVUSDB,
    instrux_VPMOVUSDW,
    instrux_VPMOVUSQB,
    instrux_VPMOVUSQD,
    instrux_VPMOVUSQW,
    instrux_VPMOVZXBD,
    instrux_VPMOVZXBQ,
    instrux_VPMOVZXBW,
    instrux_VPMOVZXDQ,
    instrux_VPMOVZXWD,
    instrux_VPMOVZXWQ,
    instrux_VPMULDQ,
    instrux_VPMULHRSW,
    instrux_VPMULHUW,
    instrux_VPMULHW,
    instrux_VPMULLD,
    instrux_VPMULLW,
    instrux_VPMULUDQ,
    instrux_VPOR,
    instrux_VPORD,
    instrux_VPORQ,
    instrux_VPPERM,
    instrux_VPROLD,
    instrux_VPROLQ,
    instrux_VPROLVD,
    instrux_VPROLVQ,
    instrux_VPRORD,
    instrux_VPRORQ,
    instrux_VPRORVD,
    instrux_VPRORVQ,
    instrux_VPROTB,
    instrux_VPROTD,
    instrux_VPROTQ,
    instrux_VPROTW,
    instrux_VPSADBW,
    instrux_VPSCATTERDD,
    instrux_VPSCATTERDQ,
    instrux_VPSCATTERQD,
    instrux_VPSCATTERQQ,
    instrux_VPSHAB,
    instrux_VPSHAD,
    instrux_VPSHAQ,
    instrux_VPSHAW,
    instrux_VPSHLB,
    instrux_VPSHLD,
    instrux_VPSHLQ,
    instrux_VPSHLW,
    instrux_VPSHUFB,
    instrux_VPSHUFD,
    instrux_VPSHUFHW,
    instrux_VPSHUFLW,
    instrux_VPSIGNB,
    instrux_VPSIGND,
    instrux_VPSIGNW,
    instrux_VPSLLD,
    instrux_VPSLLDQ,
    instrux_VPSLLQ,
    instrux_VPSLLVD,
    instrux_VPSLLVQ,
    instrux_VPSLLW,
    instrux_VPSRAD,
    instrux_VPSRAQ,
    instrux_VPSRAVD,
    instrux_VPSRAVQ,
    instrux_VPSRAW,
    instrux_VPSRLD,
    instrux_VPSRLDQ,
    instrux_VPSRLQ,
    instrux_VPSRLVD,
    instrux_VPSRLVQ,
    instrux_VPSRLW,
    instrux_VPSUBB,
    instrux_VPSUBD,
    instrux_VPSUBQ,
    instrux_VPSUBSB,
    instrux_VPSUBSW,
    instrux_VPSUBUSB,
    instrux_VPSUBUSW,
    instrux_VPSUBW,
    instrux_VPTERNLOGD,
    instrux_VPTERNLOGQ,
    instrux_VPTEST,
    instrux_VPTESTMD,
    instrux_VPTESTMQ,
    instrux_VPTESTNMD,
    instrux_VPTESTNMQ,
    instrux_VPUNPCKHBW,
    instrux_VPUNPCKHDQ,
    instrux_VPUNPCKHQDQ,
    instrux_VPUNPCKHWD,
    instrux_VPUNPCKLBW,
    instrux_VPUNPCKLDQ,
    instrux_VPUNPCKLQDQ,
    instrux_VPUNPCKLWD,
    instrux_VPXOR,
    instrux_VPXORD,
    instrux_VPXORQ,
    instrux_VRCP14PD,
    instrux_VRCP14PS,
    instrux_VRCP14SD,
    instrux_VRCP14SS,
    instrux_VRCP28PD,
    instrux_VRCP28PS,
    instrux_VRCP28SD,
    instrux_VRCP28SS,
    instrux_VRCPPS,
    instrux_VRCPSS,
    instrux_VRNDSCALEPD,
    instrux_VRNDSCALEPS,
    instrux_VRNDSCALESD,
    instrux_VRNDSCALESS,
    instrux_VROUNDPD,
    instrux_VROUNDPS,
    instrux_VROUNDSD,
    instrux_VROUNDSS,
    instrux_VRSQRT14PD,
    instrux_VRSQRT14PS,
    instrux_VRSQRT14SD,
    instrux_VRSQRT14SS,
    instrux_VRSQRT28PD,
    instrux_VRSQRT28PS,
    instrux_VRSQRT28SD,
    instrux_VRSQRT28SS,
    instrux_VRSQRTPS,
    instrux_VRSQRTSS,
    instrux_VSCALEFPD,
    instrux_VSCALEFPS,
    instrux_VSCALEFSD,
    instrux_VSCALEFSS,
    instrux_VSCATTERDPD,
    instrux_VSCATTERDPS,
    instrux_VSCATTERPF0DPD,
    instrux_VSCATTERPF0DPS,
    instrux_VSCATTERPF0QPD,
    instrux_VSCATTERPF0QPS,
    instrux_VSCATTERPF1DPD,
    instrux_VSCATTERPF1DPS,
    instrux_VSCATTERPF1QPD,
    instrux_VSCATTERPF1QPS,
    instrux_VSCATTERQPD,
    instrux_VSCATTERQPS,
    instrux_VSHUFF32X4,
    instrux_VSHUFF64X2,
    instrux_VSHUFI32X4,
    instrux_VSHUFI64X2,
    instrux_VSHUFPD,
    instrux_VSHUFPS,
    instrux_VSQRTPD,
    instrux_VSQRTPS,
    instrux_VSQRTSD,
    instrux_VSQRTSS,
    instrux_VSTMXCSR,
    instrux_VSUBPD,
    instrux_VSUBPS,
    instrux_VSUBSD,
    instrux_VSUBSS,
    instrux_VTESTPD,
    instrux_VTESTPS,
    instrux_VUCOMISD,
    instrux_VUCOMISS,
    instrux_VUNPCKHPD,
    instrux_VUNPCKHPS,
    instrux_VUNPCKLPD,
    instrux_VUNPCKLPS,
    instrux_VXORPD,
    instrux_VXORPS,
    instrux_VZEROALL,
    instrux_VZEROUPPER,
    instrux_WBINVD,
    instrux_WRFSBASE,
    instrux_WRGSBASE,
    instrux_WRMSR,
    instrux_WRSHR,
    instrux_XABORT,
    instrux_XADD,
    instrux_XBEGIN,
    instrux_XBTS,
    instrux_XCHG,
    instrux_XCRYPTCBC,
    instrux_XCRYPTCFB,
    instrux_XCRYPTCTR,
    instrux_XCRYPTECB,
    instrux_XCRYPTOFB,
    instrux_XEND,
    instrux_XGETBV,
    instrux_XLAT,
    instrux_XLATB,
    instrux_XOR,
    instrux_XORPD,
    instrux_XORPS,
    instrux_XRSTOR,
    instrux_XRSTOR64,
    instrux_XSAVE,
    instrux_XSAVE64,
    instrux_XSAVEOPT,
    instrux_XSAVEOPT64,
    instrux_XSETBV,
    instrux_XSHA1,
    instrux_XSHA256,
    instrux_XSTORE,
    instrux_XTEST,
    instrux_CMOVcc,
    instrux_Jcc,
    instrux_SETcc,
};
