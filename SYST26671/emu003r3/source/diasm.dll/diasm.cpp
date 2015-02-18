/*

Disassembler module for EMU8086 by Alexander Popov

 This code is published under this licence:

 http://www.emu8086.com/dr/license.html

*/

#define WIN32_LEAN_AND_MEAN

#include <stdio.h>
#include <string.h>
#include <windows.h>   /* for LPSTR */

/* flag to avoid making init more then once */
int  fINIT_DONE = 0;

/* buffer to keep single disassembled instruction */
char buffer1[256] = "Copyright (c) emu8086.com                                                                 ";

/* 1.0.0.6 support for signed displacements,
   currently only for + d8 */
char sSign[3] = "? ";
unsigned char disp8;


char *column_s[] =  {"ES",   "CS",   "SS",   "DS"};
char *column_rb[] = {"AL",   "CL",   "DL",   "BL",   "AH",   "CH",   "DH",   "BH"};
char *column_rw[] = {"AX",   "CX",   "DX",   "BX",   "SP",   "BP",   "SI",   "DI"};

char *eaRowsW[]={
"[BX + SI]",
"[BX + DI]",
"[BP + SI]",
"[BP + DI]",

"[SI]",
"[DI]",
"", /* d16 (simple var) */
"[BX]",

"[BX + SI] ", /* [BX + SI] + d8 */
"[BX + DI] ", /* [BX + DI] + d8 */
"[BP + SI] ", /* [BP + SI] + d8 */
"[BP + DI] ", /* [BP + DI] + d8 */

"[SI] ", /* [SI] + d8 */
"[DI] ", /* [DI] + d8 */
"[BP] ", /* [BP] + d8 */
"[BX] ", /* [BX] + d8 */

"[BX + SI] + ", /* [BX + SI] + d16 */
"[BX + DI] + ", /* [BX + DI] + d16 */
"[BP + SI] + ", /* [BP + SI] + d16 */
"[BP + DI] + ", /* [BP + DI] + d16 */

"[SI] + ", /* [SI] + d16 */
"[DI] + ", /* [DI] + d16 */
"[BP] + ", /* [BP] + d16 */
"[BX] + ", /* [BX] + d16 */

"AX", /* ew=AX   eb=AL */
"CX", /* ew=CX   eb=CL */
"DX", /* ew=DX   eb=DL */
"BX", /* ew=BX   eb=BL */

"SP", /* ew=SP   eb=AH */
"BP", /* ew=BP   eb=CH */
"SI", /* ew=SI   eb=DH */
"DI", /* ew=DI   eb=BH */

};

char *eaRowsB[] = {
"[BX + SI]",
"[BX + DI]",
"[BP + SI]",
"[BP + DI]",

"[SI]",
"[DI]",
"", /* d16 (simple var) */
"[BX]",

"[BX + SI] ", /* [BX + SI] + d8 */
"[BX + DI] ", /* [BX + DI] + d8 */
"[BP + SI] ", /* [BP + SI] + d8 */
"[BP + DI] ", /* [BP + DI] + d8 */

"[SI] ", /* [SI] + d8 */
"[DI] ", /* [DI] + d8 */
"[BP] ", /* [BP] + d8 */
"[BX] ", /* [BX] + d8 */

"[BX + SI] + ", /* [BX + SI] + d16 */
"[BX + DI] + ", /* [BX + DI] + d16 */
"[BP + SI] + ", /* [BP + SI] + d16 */
"[BP + DI] + ", /* [BP + DI] + d16 */

"[SI] + ", /* [SI] + d16 */
"[DI] + ", /* [DI] + d16 */
"[BP] + ", /* [BP] + d16 */
"[BX] + ", /* [BX] + d16 */

"AL", /* ew=AX   eb=AL */
"CL", /* ew=CX   eb=CL */
"DL", /* ew=DX   eb=DL */
"BL", /* ew=BX   eb=BL */

"AH", /* ew=SP   eb=AH */
"CH", /* ew=BP   eb=CH */
"DH", /* ew=SI   eb=DH */
"BH", /* ew=DI   eb=BH */

};


#define	STR_ONLY	0
#define PLUS__d8	1
#define PLUS_d16	2
#define VAR__d16	3

struct eaByteStruct {

	/* 0 ... 7 */
	unsigned char iColumn;

	/* 0 ... 31 */
	unsigned char iRow;

    /* 0 - str.only, 1 - "+d8", 2 - "+d16", 3 - "d16 (simple var)" */
	unsigned char iType;

} eaByte[256] = {			/* EA byte values (HEX) */

	/* 00 - 3F */

	{0, 0, STR_ONLY},		/* 00 */
	{0, 1, STR_ONLY},		/* 01 */
	{0, 2, STR_ONLY},		/* 02 */
	{0, 3, STR_ONLY},		/* 03 */
	{0, 4, STR_ONLY},		/* 04 */
	{0, 5, STR_ONLY},		/* 05 */
	{0, 6, VAR__d16},		/* 06 */
	{0, 7, STR_ONLY},		/* 07 */

	{1, 0, STR_ONLY},		/* 08 */
	{1, 1, STR_ONLY},		/* 09 */
	{1, 2, STR_ONLY},		/* 0A */
	{1, 3, STR_ONLY},		/* 0B */
	{1, 4, STR_ONLY},		/* 0C */
	{1, 5, STR_ONLY},		/* 0D */
	{1, 6, VAR__d16},		/* 0E */
	{1, 7, STR_ONLY},		/* 0F */

	{2, 0, STR_ONLY},		/* 10 */
	{2, 1, STR_ONLY},		/* 11 */
	{2, 2, STR_ONLY},		/* 12 */
	{2, 3, STR_ONLY},		/* 13 */
	{2, 4, STR_ONLY},		/* 14 */
	{2, 5, STR_ONLY},		/* 15 */
	{2, 6, VAR__d16},		/* 16 */
	{2, 7, STR_ONLY},		/* 17 */

	{3, 0, STR_ONLY},		/* 18 */
	{3, 1, STR_ONLY},		/* 19 */
	{3, 2, STR_ONLY},		/* 1A*/
	{3, 3, STR_ONLY},		/* 1B */
	{3, 4, STR_ONLY},		/* 1C */
	{3, 5, STR_ONLY},		/* 1D */
	{3, 6, VAR__d16},		/* 1E */
	{3, 7, STR_ONLY},		/* 1F */

	{4, 0, STR_ONLY},		/* 20 */
	{4, 1, STR_ONLY},		/* 21 */
	{4, 2, STR_ONLY},		/* 22*/
	{4, 3, STR_ONLY},		/* 23 */
	{4, 4, STR_ONLY},		/* 24 */
	{4, 5, STR_ONLY},		/* 25 */
	{4, 6, VAR__d16},		/* 26 */
	{4, 7, STR_ONLY},		/* 27 */

	{5, 0, STR_ONLY},		/* 28 */
	{5, 1, STR_ONLY},		/* 29 */
	{5, 2, STR_ONLY},		/* 2A*/
	{5, 3, STR_ONLY},		/* 2B */
	{5, 4, STR_ONLY},		/* 2C */
	{5, 5, STR_ONLY},		/* 2D */
	{5, 6, VAR__d16},		/* 2E */
	{5, 7, STR_ONLY},		/* 2F */

	{6, 0, STR_ONLY},		/* 30 */
	{6, 1, STR_ONLY},		/* 31 */
	{6, 2, STR_ONLY},		/* 32*/
	{6, 3, STR_ONLY},		/* 33 */
	{6, 4, STR_ONLY},		/* 34 */
	{6, 5, STR_ONLY},		/* 35 */
	{6, 6, VAR__d16},		/* 36 */
	{6, 7, STR_ONLY},		/* 37 */

	{7, 0, STR_ONLY},		/* 38 */
	{7, 1, STR_ONLY},		/* 39 */
	{7, 2, STR_ONLY},		/* 3A*/
	{7, 3, STR_ONLY},		/* 3B */
	{7, 4, STR_ONLY},		/* 3C */
	{7, 5, STR_ONLY},		/* 3D */
	{7, 6, VAR__d16},		/* 3E */
	{7, 7, STR_ONLY},		/* 3F */

	/* 40 - 7F */

	{0, 8, PLUS__d8},		/* 40 */
	{0, 9, PLUS__d8},		/* 41 */
	{0, 10, PLUS__d8},		/* 42 */
	{0, 11, PLUS__d8},		/* 43 */
	{0, 12, PLUS__d8},		/* 44 */
	{0, 13, PLUS__d8},		/* 45 */
	{0, 14, PLUS__d8},		/* 46 */
	{0, 15, PLUS__d8},		/* 47 */

	{1, 8, PLUS__d8},		/* 48 */
	{1, 9, PLUS__d8},		/* 49 */
	{1, 10, PLUS__d8},		/* 4A */
	{1, 11, PLUS__d8},		/* 4B */
	{1, 12, PLUS__d8},		/* 4C */
	{1, 13, PLUS__d8},		/* 4D */
	{1, 14, PLUS__d8},		/* 4E */
	{1, 15, PLUS__d8},		/* 4F */

	{2, 8, PLUS__d8},		/* 50 */
	{2, 9, PLUS__d8},		/* 51 */
	{2, 10, PLUS__d8},		/* 52 */
	{2, 11, PLUS__d8},		/* 53 */
	{2, 12, PLUS__d8},		/* 54 */
	{2, 13, PLUS__d8},		/* 55 */
	{2, 14, PLUS__d8},		/* 56 */
	{2, 15, PLUS__d8},		/* 57 */

	{3, 8, PLUS__d8},		/* 58 */
	{3, 9, PLUS__d8},		/* 59 */
	{3, 10, PLUS__d8},		/* 5A */
	{3, 11, PLUS__d8},		/* 5B */
	{3, 12, PLUS__d8},		/* 5C */
	{3, 13, PLUS__d8},		/* 5D */
	{3, 14, PLUS__d8},		/* 5E */
	{3, 15, PLUS__d8},		/* 5F */

	{4, 8, PLUS__d8},		/* 60 */
	{4, 9, PLUS__d8},		/* 61 */
	{4, 10, PLUS__d8},		/* 62 */
	{4, 11, PLUS__d8},		/* 63 */
	{4, 12, PLUS__d8},		/* 64 */
	{4, 13, PLUS__d8},		/* 65 */
	{4, 14, PLUS__d8},		/* 66 */
	{4, 15, PLUS__d8},		/* 67 */

	{5, 8, PLUS__d8},		/* 68 */
	{5, 9, PLUS__d8},		/* 69 */
	{5, 10, PLUS__d8},		/* 6A */
	{5, 11, PLUS__d8},		/* 6B */
	{5, 12, PLUS__d8},		/* 6C */
	{5, 13, PLUS__d8},		/* 6D */
	{5, 14, PLUS__d8},		/* 6E */
	{5, 15, PLUS__d8},		/* 6F */

	{6, 8, PLUS__d8},		/* 70 */
	{6, 9, PLUS__d8},		/* 71 */
	{6, 10, PLUS__d8},		/* 72 */
	{6, 11, PLUS__d8},		/* 73 */
	{6, 12, PLUS__d8},		/* 74 */
	{6, 13, PLUS__d8},		/* 75 */
	{6, 14, PLUS__d8},		/* 76 */
	{6, 15, PLUS__d8},		/* 77 */

	{7, 8, PLUS__d8},		/* 78 */
	{7, 9, PLUS__d8},		/* 79 */
	{7, 10, PLUS__d8},		/* 7A */
	{7, 11, PLUS__d8},		/* 7B */
	{7, 12, PLUS__d8},		/* 7C */
	{7, 13, PLUS__d8},		/* 7D */
	{7, 14, PLUS__d8},		/* 7E */
	{7, 15, PLUS__d8},		/* 7F */

	/* 80 - BF */

	{0, 16, PLUS_d16},		/* 80 */
	{0, 17, PLUS_d16},		/* 81 */
	{0, 18, PLUS_d16},		/* 82 */
	{0, 19, PLUS_d16},		/* 83 */
	{0, 20, PLUS_d16},		/* 84 */
	{0, 21, PLUS_d16},		/* 85 */
	{0, 22, PLUS_d16},		/* 86 */
	{0, 23, PLUS_d16},		/* 87 */

	{1, 16, PLUS_d16},		/* 88 */
	{1, 17, PLUS_d16},		/* 89 */
	{1, 18, PLUS_d16},		/* 8A */
	{1, 19, PLUS_d16},		/* 8B */
	{1, 20, PLUS_d16},		/* 8C */
	{1, 21, PLUS_d16},		/* 8D */
	{1, 22, PLUS_d16},		/* 8E */
	{1, 23, PLUS_d16},		/* 8F */

	{2, 16, PLUS_d16},		/* 90 */
	{2, 17, PLUS_d16},		/* 91 */
	{2, 18, PLUS_d16},		/* 92 */
	{2, 19, PLUS_d16},		/* 93 */
	{2, 20, PLUS_d16},		/* 94 */
	{2, 21, PLUS_d16},		/* 95 */
	{2, 22, PLUS_d16},		/* 96 */
	{2, 23, PLUS_d16},		/* 97 */

	{3, 16, PLUS_d16},		/* 98 */
	{3, 17, PLUS_d16},		/* 99 */
	{3, 18, PLUS_d16},		/* 9A */
	{3, 19, PLUS_d16},		/* 9B */
	{3, 20, PLUS_d16},		/* 9C */
	{3, 21, PLUS_d16},		/* 9D */
	{3, 22, PLUS_d16},		/* 9E */
	{3, 23, PLUS_d16},		/* 9F */

	{4, 16, PLUS_d16},		/* A0 */
	{4, 17, PLUS_d16},		/* A1 */
	{4, 18, PLUS_d16},		/* A2 */
	{4, 19, PLUS_d16},		/* A3 */
	{4, 20, PLUS_d16},		/* A4 */
	{4, 21, PLUS_d16},		/* A5 */
	{4, 22, PLUS_d16},		/* A6 */
	{4, 23, PLUS_d16},		/* A7 */

	{5, 16, PLUS_d16},		/* A8 */
	{5, 17, PLUS_d16},		/* A9 */
	{5, 18, PLUS_d16},		/* AA */
	{5, 19, PLUS_d16},		/* AB */
	{5, 20, PLUS_d16},		/* AC */
	{5, 21, PLUS_d16},		/* AD */
	{5, 22, PLUS_d16},		/* AE */
	{5, 23, PLUS_d16},		/* AF */

	{6, 16, PLUS_d16},		/* B0 */
	{6, 17, PLUS_d16},		/* B1 */
	{6, 18, PLUS_d16},		/* B2 */
	{6, 19, PLUS_d16},		/* B3 */
	{6, 20, PLUS_d16},		/* B4 */
	{6, 21, PLUS_d16},		/* B5 */
	{6, 22, PLUS_d16},		/* B6 */
	{6, 23, PLUS_d16},		/* B7 */

	{7, 16, PLUS_d16},		/* B8 */
	{7, 17, PLUS_d16},		/* B9 */
	{7, 18, PLUS_d16},		/* BA */
	{7, 19, PLUS_d16},		/* BB */
	{7, 20, PLUS_d16},		/* BC */
	{7, 21, PLUS_d16},		/* BD */
	{7, 22, PLUS_d16},		/* BE */
	{7, 23, PLUS_d16},		/* BF */

	/* C0 - FF */

	{0, 24, STR_ONLY},		/* C0 */
	{0, 25, STR_ONLY},		/* C1 */
	{0, 26, STR_ONLY},		/* C2 */
	{0, 27, STR_ONLY},		/* C3 */
	{0, 28, STR_ONLY},		/* C4 */
	{0, 29, STR_ONLY},		/* C5 */
	{0, 30, STR_ONLY},		/* C6 */
	{0, 31, STR_ONLY},		/* C7 */

	{1, 24, STR_ONLY},		/* C8 */
	{1, 25, STR_ONLY},		/* C9 */
	{1, 26, STR_ONLY},		/* CA */
	{1, 27, STR_ONLY},		/* CB */
	{1, 28, STR_ONLY},		/* CC */
	{1, 29, STR_ONLY},		/* CD */
	{1, 30, STR_ONLY},		/* CE */
	{1, 31, STR_ONLY},		/* CF */

	{2, 24, STR_ONLY},		/* D0 */
	{2, 25, STR_ONLY},		/* D1 */
	{2, 26, STR_ONLY},		/* D2 */
	{2, 27, STR_ONLY},		/* D3 */
	{2, 28, STR_ONLY},		/* D4 */
	{2, 29, STR_ONLY},		/* D5 */
	{2, 30, STR_ONLY},		/* D6 */
	{2, 31, STR_ONLY},		/* D7 */

	{3, 24, STR_ONLY},		/* D8 */
	{3, 25, STR_ONLY},		/* D9 */
	{3, 26, STR_ONLY},		/* DA */
	{3, 27, STR_ONLY},		/* DB */
	{3, 28, STR_ONLY},		/* DC */
	{3, 29, STR_ONLY},		/* DD */
	{3, 30, STR_ONLY},		/* DE */
	{3, 31, STR_ONLY},		/* DF */

	{4, 24, STR_ONLY},		/* E0 */
	{4, 25, STR_ONLY},		/* E1 */
	{4, 26, STR_ONLY},		/* E2 */
	{4, 27, STR_ONLY},		/* E3 */
	{4, 28, STR_ONLY},		/* E4 */
	{4, 29, STR_ONLY},		/* E5 */
	{4, 30, STR_ONLY},		/* E6 */
	{4, 31, STR_ONLY},		/* E7 */

	{5, 24, STR_ONLY},		/* E8 */
	{5, 25, STR_ONLY},		/* E9 */
	{5, 26, STR_ONLY},		/* EA */
	{5, 27, STR_ONLY},		/* EB */
	{5, 28, STR_ONLY},		/* EC */
	{5, 29, STR_ONLY},		/* ED */
	{5, 30, STR_ONLY},		/* EE */
	{5, 31, STR_ONLY},		/* EF */

	{6, 24, STR_ONLY},		/* F0 */
	{6, 25, STR_ONLY},		/* F1 */
	{6, 26, STR_ONLY},		/* F2 */
	{6, 27, STR_ONLY},		/* F3 */
	{6, 28, STR_ONLY},		/* F4 */
	{6, 29, STR_ONLY},		/* F5 */
	{6, 30, STR_ONLY},		/* F6 */
	{6, 31, STR_ONLY},		/* F7 */

	{7, 24, STR_ONLY},		/* F8 */
	{7, 25, STR_ONLY},		/* F9 */
	{7, 26, STR_ONLY},		/* FA */
	{7, 27, STR_ONLY},		/* FB */
	{7, 28, STR_ONLY},		/* FC */
	{7, 29, STR_ONLY},		/* FD */
	{7, 30, STR_ONLY},		/* FE */
	{7, 31, STR_ONLY},		/* FF */

};


#define c_0_to_7	0		/* AX, CX, AL, CL.... */
#define c_0_to_4_S  8		/* DS, ES, .... */
#define c_r			10
#define c_cb		11
#define c_ib		12
#define c_iw		13
#define c_cd		14
#define c_cw		15
#define c_1byte		16
#define c_2bytes	17	 /* for AAD and AAM */
#define c_x			18
#define c_ib_only_0 19   /* this byte exists only for /0 */
#define c_iw_only_0 20   /* this word exists only for /0 */

#define c_EXTENDED 21   /* #400b20-jcc-word#  */

#define dir_E_R		0
#define dir_R_E		1

#define opWORD		0
#define opBYTE		1

struct opcodesStruct {

	/*         /0../7 /r cb ib iw cd cw  */
	char byte1;

	/*         ib iw */
	char byte2;



	/* first dimension is a /0../7 mode,
	   next is the instruction for that mode:
	   MOV, TEST, XCHG ...
	   in case mode is /r then only [0][0] is set */

	// #400b20-diasm-more-fpu#    char sINSTRUCTION[8][7];
	  char sINSTRUCTION[8][10];




	/* in case of "/r" a space - " ", or " AL," (for ADD AL,ib),
	   or " AX," (for ADD AX,iw)
	*/
	char sPREFIX[6];

	/* generally empty string, or ",CL" (for ROR eb,CL),
	   or ",CS" (for MOV ew,CS)
	*/
	char sSUFFIX[5];


	/* If has value "1" then first goes a register, and after
	   it an effective address. If value is "0" then first effective
	   address and after it a register.
	   For example: MOV rb,eb  - "1"
					MOV eb,rb  - "0"
	*/
	char r_e_dir;

	/* "0" in case instruction is for word, "1" in
	   case it's for byte.
	*/
	char is_byte;

} opcodes[256] = {

/* 00 /r       ADD eb,rb */
	{c_r, -1, {"ADD"}, " ", "", dir_E_R, opBYTE},

/* 01 /r       ADD ew,rw */
	{c_r, -1, {"ADD"}, " ", "", dir_E_R, opWORD},

/* 02 /r       ADD rb,eb */
	{c_r, -1, {"ADD"}, " ", "", dir_R_E, opBYTE},

/* 03 /r       ADD rw,ew */
	{c_r, -1, {"ADD"}, " ", "", dir_R_E, opWORD},

/* 04 ib       ADD AL,ib */
	{c_ib, -1, {"ADD"}, " AL, ", "", -1, opBYTE},

/* 05 iw       ADD AX,iw */
	{c_iw, -1, {"ADD"}, " AX, ", "", -1, opWORD},

/* 06          PUSH ES */
	{c_1byte, -1, {"PUSH"}, " ES", "", -1, opWORD},

/* 07          POP ES */
	{c_1byte, -1, {"POP"}, " ES", "", -1, opWORD},

/* 08 /r       OR eb,rb */
	{c_r, -1, {"OR"}, " ", "", dir_E_R, opBYTE},

/* 09 /r       OR ew,rw */
	{c_r, -1, {"OR"}, " ", "", dir_E_R, opWORD},

/* 0A /r       OR rb,eb */
	{c_r, -1, {"OR"}, " ", "", dir_R_E, opBYTE},

/* 0B /r       OR rw,ew */
	{c_r, -1, {"OR"}, " ", "", dir_R_E, opWORD},

/* 0C ib       OR AL,ib */
	{c_ib, -1, {"OR"}, " AL, ", "", -1, opBYTE},

/* 0D iw       OR AX,iw */
	{c_iw, -1, {"OR"}, " AX, ", "", -1, opWORD},

/* 0E          PUSH CS */
	{c_1byte, -1, {"PUSH"}, " CS", "", -1, opWORD},

/* 0F          #400b20-jcc-word# 

0F 80 cw       JO rel16        Jump near if overflow (OF=1).
0F 81 cw       JNO rel16       Jump near if not overflow (OF=0).
0F 82 cw       JC rel16        Jump near if carry (CF=1).
0F 83 cw       JNC rel16       Jump near if not carry (CF=0).
0F 84 cw       JZ rel16        Jump near if 0 (ZF=1).
0F 85 cw       JNZ rel16       Jump near if not zero (ZF=0).
0F 86 cw       JNA rel16       Jump near if not above (CF=1 or ZF=1).
0F 87 cw       JA rel16        Jump near if above (CF=0 and ZF=0).
0F 88 cw       JS rel16        Jump near if sign (SF=1).
0F 89 cw       JNS rel16       Jump near if not sign (SF=0).
0F 8A cw       JP rel16        Jump near if parity (PF=1).
0F 8B cw       JNP rel16       Jump near if not parity (PF=0).
0F 8C cw       JL rel16        Jump near if less (SF<>OF).
0F 8D cw       JGE rel16       Jump near if greater or equal (SF=OF).
0F 8E cw       JLE rel16       Jump near if less or equal (ZF=1 or SF<>OF).
0F 8F cw       JG rel16        Jump near if greater (ZF=0 and SF=OF).

requires special attention  "EXT OP" is not used

*/
/* 0F        (??)      (386 - indicates extended opcode)   */
	{c_EXTENDED, -1, {"EXT OP"}, "", "", -1, opWORD},



/* 10 /r       ADC eb,rb */
	{c_r, -1, {"ADC"}, " ", "", dir_E_R, opBYTE},

/* 11 /r       ADC ew,rw */
	{c_r, -1, {"ADC"}, " ", "", dir_E_R, opWORD},

/* 12 /r       ADC rb,eb */
	{c_r, -1, {"ADC"}, " ", "", dir_R_E, opBYTE},

/* TODO: not checked from here!!!!   ??? */

/* 13 /r       ADC rw,ew */
	{c_r, -1, {"ADC"}, " ", "", dir_R_E, opWORD},

/* 14 ib       ADC AL,ib */
	{c_ib, -1, {"ADC"}, " AL, ", "", -1, opBYTE},

/* 15 iw       ADC AX,iw */
	{c_iw, -1, {"ADC"}, " AX, ", "", -1, opWORD},

/* 16          PUSH SS */
	{c_1byte, -1, {"PUSH"}, " SS", "", -1, opWORD},

/* 17          POP SS */
	{c_1byte, -1, {"POP"}, " SS", "", -1, opWORD},

/* 18 /r       SBB eb,rb */
	{c_r, -1, {"SBB"}, " ", "", dir_E_R, opBYTE},

/* 19 /r       SBB ew,rw */
	{c_r, -1, {"SBB"}, " ", "", dir_E_R, opWORD},

/* 1A /r       SBB rb,eb */
	{c_r, -1, {"SBB"}, " ", "", dir_R_E, opBYTE},

/* 1B /r       SBB rw,ew */
	{c_r, -1, {"SBB"}, " ", "", dir_R_E, opWORD},

/* 1C ib       SBB AL,ib */
	{c_ib, -1, {"SBB"}, " AL, ", "", -1, opBYTE},

/* 1D iw       SBB AX,iw */
	{c_iw, -1, {"SBB"}, " AX, ", "", -1, opWORD},

/* 1E          PUSH DS */
	{c_1byte, -1, {"PUSH"}, " DS", "", -1, opWORD},

/* 1F          POP DS */
	{c_1byte, -1, {"POP"}, " DS", "", -1, opWORD},

/* 20 /r       AND eb,rb */
	{c_r, -1, {"AND"}, " ", "", dir_E_R, opBYTE},

/* 21 /r       AND ew,rw */
	{c_r, -1, {"AND"}, " ", "", dir_E_R, opWORD},

/* 22 /r       AND rb,eb */
	{c_r, -1, {"AND"}, " ", "", dir_R_E, opBYTE},

/* 23 /r       AND rw,ew */
	{c_r, -1, {"AND"}, " ", "", dir_R_E, opWORD},

/* 24 ib       AND AL,ib */
	{c_ib, -1, {"AND"}, " AL, ", "", -1, opBYTE},

/* 25 iw       AND AX,iw */
	{c_iw, -1, {"AND"}, " AX, ", "", -1, opWORD},

/* 26        [Prefix]   ES: override */
	{c_1byte, -1, {"ES:"}, "", "", -1, opWORD},

/* 27          DAA */
	{c_1byte, -1, {"DAA"}, "", "", -1, opWORD},

/* 28 /r       SUB eb,rb */
	{c_r, -1, {"SUB"}, " ", "", dir_E_R, opBYTE},

/* 29 /r       SUB ew,rw */
	{c_r, -1, {"SUB"}, " ", "", dir_E_R, opWORD},

/* 2A /r       SUB rb,eb */
	{c_r, -1, {"SUB"}, " ", "", dir_R_E, opBYTE},

/* 2B /r       SUB rw,ew */
	{c_r, -1, {"SUB"}, " ", "", dir_R_E, opWORD},

/* 2C ib       SUB AL,ib */
	{c_ib, -1, {"SUB"}, " AL, ", "", -1, opBYTE},

/* 2D iw       SUB AX,iw */
	{c_iw, -1, {"SUB"}, " AX, ", "", -1, opWORD},

/* 2E       [Prefix]  CS: override */
	{c_1byte, -1, {"CS:"}, "", "", -1, opWORD},

/* 2F          DAS */
	{c_1byte, -1, {"DAS"}, "", "", -1, opWORD},

/* 30 /r       XOR eb,rb */
	{c_r, -1, {"XOR"}, " ", "", dir_E_R, opBYTE},

/* 31 /r       XOR ew,rw */
	{c_r, -1, {"XOR"}, " ", "", dir_E_R, opWORD},

/* 32 /r       XOR rb,eb */
	{c_r, -1, {"XOR"}, " ", "", dir_R_E, opBYTE},

/* 33 /r       XOR rw,ew */
	{c_r, -1, {"XOR"}, " ", "", dir_R_E, opWORD},

/* 34 ib       XOR AL,ib */
	{c_ib, -1, {"XOR"}, " AL, ", "", -1, opBYTE},

/* 35 iw       XOR AX,iw */
	{c_iw, -1, {"XOR"}, " AX, ", "", -1, opWORD},

/* 36         [Prefix]   SS: override */
	{c_1byte, -1, {"SS:"}, "", "", -1, opWORD},

/* 37          AAA */
	{c_1byte, -1, {"AAA"}, "", "", -1, opWORD},

/* 38 /r       CMP eb,rb */
	{c_r, -1, {"CMP"}, " ", "", dir_E_R, opBYTE},

/* 39 /r       CMP ew,rw */
	{c_r, -1, {"CMP"}, " ", "", dir_E_R, opWORD},

/* 3A /r       CMP rb,eb */
	{c_r, -1, {"CMP"}, " ", "", dir_R_E, opBYTE},

/* 3B /r       CMP rw,ew */
	{c_r, -1, {"CMP"}, " ", "", dir_R_E, opWORD},

/* 3C ib       CMP AL,ib */
	{c_ib, -1, {"CMP"}, " AL, ", "", -1, opBYTE},

/* 3D iw       CMP AX,iw */
	{c_iw, -1, {"CMP"}, " AX, ", "", -1, opWORD},

/* 3E         [Prefix]   DS: override */
	{c_1byte, -1, {"DS:"}, "", "", -1, opWORD},

/* 3F          AAS */
	{c_1byte, -1, {"AAS"}, "", "", -1, opWORD},

/* The following instruction is expanded here to
   8 separate entries:
/* 40+rw       INC rw */

/* 40       INC AX */
	{c_1byte, -1, {"INC"}, " AX", "", -1, opWORD},

/* 41       INC CX */
	{c_1byte, -1, {"INC"}, " CX", "", -1, opWORD},

/* 42       INC DX */
	{c_1byte, -1, {"INC"}, " DX", "", -1, opWORD},

/* 43       INC BX */
	{c_1byte, -1, {"INC"}, " BX", "", -1, opWORD},

/* 44       INC SP */
	{c_1byte, -1, {"INC"}, " SP", "", -1, opWORD},

/* 45       INC BP */
	{c_1byte, -1, {"INC"}, " BP", "", -1, opWORD},

/* 46       INC SI */
	{c_1byte, -1, {"INC"}, " SI", "", -1, opWORD},

/* 47       INC DI */
	{c_1byte, -1, {"INC"}, " DI", "", -1, opWORD},

/* The following instruction is expanded here to
   8 separate entries:
/* 48+rw       DEC rw */

/* 48       DEC AX */
	{c_1byte, -1, {"DEC"}, " AX", "", -1, opWORD},

/* 49       DEC CX */
	{c_1byte, -1, {"DEC"}, " CX", "", -1, opWORD},

/* 4A       DEC DX */
	{c_1byte, -1, {"DEC"}, " DX", "", -1, opWORD},

/* 4B       DEC BX */
	{c_1byte, -1, {"DEC"}, " BX", "", -1, opWORD},

/* 4C       DEC SP */
	{c_1byte, -1, {"DEC"}, " SP", "", -1, opWORD},

/* 4D       DEC BP */
	{c_1byte, -1, {"DEC"}, " BP", "", -1, opWORD},

/* 4E       DEC SI */
	{c_1byte, -1, {"DEC"}, " SI", "", -1, opWORD},

/* 4F       DEC DI */
	{c_1byte, -1, {"DEC"}, " DI", "", -1, opWORD},

/* The following instruction is expanded here to
   8 separate entries:
   50+rw       PUSH rw */

/* 50       PUSH AX */
	{c_1byte, -1, {"PUSH"}, " AX", "", -1, opWORD},

/* 51       PUSH CX */
	{c_1byte, -1, {"PUSH"}, " CX", "", -1, opWORD},

/* 52       PUSH DX */
	{c_1byte, -1, {"PUSH"}, " DX", "", -1, opWORD},

/* 53       PUSH BX */
	{c_1byte, -1, {"PUSH"}, " BX", "", -1, opWORD},

/* 54       PUSH SP */
	{c_1byte, -1, {"PUSH"}, " SP", "", -1, opWORD},

/* 55       PUSH BP */
	{c_1byte, -1, {"PUSH"}, " BP", "", -1, opWORD},

/* 56       PUSH SI */
	{c_1byte, -1, {"PUSH"}, " SI", "", -1, opWORD},

/* 57       PUSH DI */
	{c_1byte, -1, {"PUSH"}, " DI", "", -1, opWORD},

/* The following instruction is expanded here to
   8 separate entries:
   58+rw       POP rw */

/* 58       POP AX */
	{c_1byte, -1, {"POP"}, " AX", "", -1, opWORD},

/* 59       POP CX */
	{c_1byte, -1, {"POP"}, " CX", "", -1, opWORD},

/* 5A       POP DX */
	{c_1byte, -1, {"POP"}, " DX", "", -1, opWORD},

/* 5B       POP BX */
	{c_1byte, -1, {"POP"}, " BX", "", -1, opWORD},

/* 5C       POP SP */
	{c_1byte, -1, {"POP"}, " SP", "", -1, opWORD},

/* 5D       POP BP */
	{c_1byte, -1, {"POP"}, " BP", "", -1, opWORD},

/* 5E       POP SI */
	{c_1byte, -1, {"POP"}, " SI", "", -1, opWORD},

/* 5F       POP DI */
	{c_1byte, -1, {"POP"}, " DI", "", -1, opWORD},

/* 60          (80186) */
/* 60         --         PUSHA */
	{c_1byte, -1, {"PUSHA"}, "", "", -1, opWORD},

/* 61          (80186) */
/* 61         --         POPA */
	{c_1byte, -1, {"POPA"}, "", "", -1, opWORD},

/* 62          (80186) */
/* 62         /r         BOUND r16,m16&16  */
	{c_1byte, -1, {"DB "}, "62h", "", -1, opWORD},

/* 63          not used in 8086 */
/* 63        (??)      (286 instruction: ARPL) */
	{c_1byte, -1, {"DB "}, "63h", "", -1, opWORD},

/* 64-67     (??)      (386 prefix bytes) */

/* 64          not used in 8086 */
	{c_1byte, -1, {"DB 64h"}, "", "", -1, opWORD},

/* 65          not used in 8086 */
	{c_1byte, -1, {"DB 65h"}, "", "", -1, opWORD},

/* 66          not used in 8086 */
	{c_1byte, -1, {"DB 66h"}, "", "", -1, opWORD},

/* 67          not used in 8086 */
	{c_1byte, -1, {"DB 67h"}, "", "", -1, opWORD},

/* 68          (80186) */
/* 68         iw         PUSH i16 */
	{c_iw, -1, {"PUSH"}, " ", "", -1, opWORD},




/* 69          (80186)

  #400b20-diasm-more-instructions#
  {c_1byte, -1, {"DB "}, " 69h", "", -1, opWORD},

*/
/* 69         /r iw      IMUL r16,rm16,i16
   69         /r iw      IMUL r16,i16 */
	{c_r, c_iw, {"IMUL"}, " ", "", -1, opWORD},





/* 6A          (80186) */
/* 6A         ib         PUSH i8 */
	{c_ib, -1, {"PUSH"}, " ", "", -1, opWORD},




/* 6B          (80186)
#400b20-diasm-more-instructions#
{c_1byte, -1, {"DB "}, "6Bh", "", -1, opWORD},
*/
/*
6B         /r ib      IMUL r16,rm16,i8                  ³
6B         /r ib      IMUL r16,i8                       ³
 */
	{c_r, c_ib, {"IMUL"}, " ", "", -1, opWORD},







/* 6C          not used in 8086 */
/* 6C        ³ --       ³  INSB */
	{c_1byte, -1, {"INSB"}, "", "", -1, opWORD},

/* 6D          not used in 8086 */
/* 6D        ³ --       ³  INSW */
	{c_1byte, -1, {"INSW"}, "", "", -1, opWORD},

/* 6E          not used in 8086 */
/* 6E        ³ --       ³  OUTSB */
	{c_1byte, -1, {"OUTSB"}, "", "", -1, opWORD},

/* 6F          not used in 8086 */
/* 6F        ³ --       ³  OUTSW */
	{c_1byte, -1, {"OUTSW"}, "", "", -1, opWORD},

/* 70 cb       JO cb */
	{c_cb, -1, {"JO"}, " ", "", -1, opBYTE},

/* 71 cb       JNO cb */
	{c_cb, -1, {"JNO"}, " ", "", -1, opBYTE},

/* 72 cb       JB cb */
	{c_cb, -1, {"JB"}, " ", "", -1, opBYTE},

/* 73 cb       JNB cb */
	{c_cb, -1, {"JNB"}, " ", "", -1, opBYTE},

/* 74 cb       JZ cb */
	{c_cb, -1, {"JZ"}, " ", "", -1, opBYTE},

/* 75 cb       JNE cb */
	{c_cb, -1, {"JNE"}, " ", "", -1, opBYTE},

/* 76 cb       JBE cb */
	{c_cb, -1, {"JBE"}, " ", "", -1, opBYTE},

/* 77 cb       JNBE cb */
	{c_cb, -1, {"JNBE"}, " ", "", -1, opBYTE},

/* 78 cb       JS cb */
	{c_cb, -1, {"JS"}, " ", "", -1, opBYTE},

/* 79 cb       JNS cb */
	{c_cb, -1, {"JNS"}, " ", "", -1, opBYTE},

/* 7A cb       JPE cb */
	{c_cb, -1, {"JPE"}, " ", "", -1, opBYTE},

/* 7B cb       JPO cb */
	{c_cb, -1, {"JPO"}, " ", "", -1, opBYTE},

/* 7C cb       JL cb */
	{c_cb, -1, {"JL"}, " ", "", -1, opBYTE},

/* 7D cb       JNL cb */
	{c_cb, -1, {"JNL"}, " ", "", -1, opBYTE},

/* 7E cb       JLE cb */
	{c_cb, -1, {"JLE"}, " ", "", -1, opBYTE},

/* 7F cb       JNLE cb */
	{c_cb, -1, {"JNLE"}, " ", "", -1, opBYTE},

/*
	80 /0 ib    ADD eb,ib
	80 /1 ib    OR eb,ib
	80 /2 ib    ADC eb,ib
	80 /3 ib    SBB eb,ib
	80 /4 ib    AND eb,ib
	80 /5 ib    SUB eb,ib
	80 /6 ib    XOR eb,ib
	80 /7 ib    CMP eb,ib
*/
	{c_0_to_7, c_ib, {"ADD", "OR", "ADC", "SBB", "AND", "SUB", "XOR", "CMP"}, " ", "", -1, opBYTE},

/*
	81 /0 iw    ADD ew,iw
	81 /1 iw    OR ew,iw
	81 /2 iw    ADC ew,iw
	81 /3 iw    SBB ew,iw
	81 /4 iw    AND ew,iw
	81 /5 iw    SUB ew,iw
	81 /6 iw    XOR ew,iw
	81 /7 iw    CMP ew,iw
*/
	{c_0_to_7, c_iw, {"ADD", "OR", "ADC", "SBB", "AND", "SUB", "XOR", "CMP"}, " ", "", -1, opWORD},

/* 82          not used in 8086
   seems to be the same as opcode 80,
   when disassembled in HIEW or HexIt */
/*
³82 /0     ³ /r ib    ³  ADD rm8,i8                        ³
³80 /0     ³ /r ib    ³  ADD rm8,i8                        ³

³82 /1     ³ /r ib    ³  OR rm8,i8                         ³
³80 /1     ³ /r ib    ³  OR rm8,i8                         ³

³82 /2     ³ /r ib    ³  ADC rm8,i8                        ³
³80 /2     ³ /r ib    ³  ADC rm8,i8                        ³

³82 /3     ³ /r ib    ³  SBB rm8,i8                        ³
³80 /3     ³ /r ib    ³  SBB rm8,i8                        ³

³82 /4     ³ /r ib    ³  AND rm8,i8                        ³
³80 /4     ³ /r ib    ³  AND rm8,i8                        ³

³82 /5     ³ /r ib    ³  SUB rm8,i8                        ³
³80 /5     ³ /r ib    ³  SUB rm8,i8                        ³

³82 /6     ³ /r ib    ³  XOR rm8,i8                        ³
³80 /6     ³ /r ib    ³  XOR rm8,i8                        ³

³82 /7     ³ /r ib    ³  CMP rm8,i8                        ³
³80 /7     ³ /r ib    ³  CMP rm8,i8                        ³
*/
	{c_0_to_7, c_ib, {"ADD", "OR", "ADC", "SBB", "AND", "SUB", "XOR", "CMP"}, " ", "", -1, opBYTE},

/*
	83 /0 ib    ADD ew,ib
	83 /1 ib    OR ew,ib
	83 /2 ib    ADC ew,ib
	83 /3 ib    SBB ew,ib
	83 /4 ib    AND ew,ib
	83 /5 ib    SUB ew,ib
	83 /6 ib    XOR ew,ib
	83 /7 ib    CMP ew,ib
*/
	{c_0_to_7, c_ib, {"ADD", "OR", "ADC", "SBB", "AND", "SUB", "XOR", "CMP"}, " ", "", -1, opWORD},

/* 84 /r       TEST eb,rb */
	{c_r, -1, {"TEST"}, " ", "", dir_E_R, opBYTE},

/* 85 /r       TEST ew,rw */
	{c_r, -1, {"TEST"}, " ", "", dir_E_R, opWORD},

/* 86 /r       XCHG eb,rb */
	{c_r, -1, {"XCHG"}, " ", "", dir_E_R, opBYTE},

/* 87 /r       XCHG ew,rw */
	{c_r, -1, {"XCHG"}, " ", "", dir_E_R, opWORD},

/* 88 /r       MOV eb,rb */
	{c_r, -1, {"MOV"}, " ", "", dir_E_R, opBYTE},

/* 89 /r       MOV ew,rw */
	{c_r, -1, {"MOV"}, " ", "", dir_E_R, opWORD},

/* 8A /r       MOV rb,eb */
	{c_r, -1, {"MOV"}, " ", "", dir_R_E, opBYTE},

/* 8B /r       MOV rw,ew */
	{c_r, -1, {"MOV"}, " ", "", dir_R_E, opWORD},

/*
	8C /0       MOV ew,ES
	8C /1       MOV ew,CS
	8C /2       MOV ew,SS
	8C /3       MOV ew,DS
	8E /4		???
	8E /5		???
	8E /6		???
	8E /7		???
*/
	{c_0_to_4_S, -1, {"MOV"}, " ", "", dir_E_R, opWORD},

/* 8D /r       LEA rw,m */
	{c_r, -1, {"LEA"}, " ", "", dir_R_E, opWORD},

/*
	8E /0       MOV ES,mw      Move memory word into ES
	8E /0       MOV ES,rw      Move word register into ES
	8E /2       MOV SS,mw      Move memory word into SS
	8E /2       MOV SS,rw      Move word register into SS
	8E /3       MOV DS,mw      Move memory word into DS
	8E /3       MOV DS,rw      Move word register into DS

	8E /4		???
	8E /5		???
	8E /6		???
	8E /7		???
*/
	{c_0_to_4_S, -1, {"MOV"}, " ", "", dir_R_E, opWORD},

/* 8F /0       POP mw */
	{c_0_to_7, -1, {"POP", "???", "???", "???", "???", "???", "???", "???"}, " ", "", -1, opWORD},

/* 90          NOP            No Operation
        or     XCHG  AX, AX
  */
	{c_1byte, -1, {"NOP"}, "", "", -1, opWORD},

/* The following instruction is expanded here to
   7 separate entries:
   9r          XCHG AX,rw
*/
/* 91          XCHG AX, CX*/
	{c_1byte, -1, {"XCHG"}, " AX, ", "CX", -1, opWORD},

/* 92          XCHG AX, DX*/
	{c_1byte, -1, {"XCHG"}, " AX, ", "DX", -1, opWORD},

/* 93          XCHG AX, BX*/
	{c_1byte, -1, {"XCHG"}, " AX, ", "BX", -1, opWORD},

/* 94          XCHG AX, SP*/
	{c_1byte, -1, {"XCHG"}, " AX, ", "SP", -1, opWORD},

/* 95          XCHG AX, BP*/
	{c_1byte, -1, {"XCHG"}, " AX, ", "BP", -1, opWORD},

/* 96          XCHG AX, SI*/
	{c_1byte, -1, {"XCHG"}, " AX, ", "SI", -1, opWORD},

/* 97          XCHG AX, DI*/
	{c_1byte, -1, {"XCHG"}, " AX, ", "DI", -1, opWORD},

/* 98          CBW */
	{c_1byte, -1, {"CBW"}, "", "", -1, opWORD},

/* 99          CWD */
	{c_1byte, -1, {"CWD"}, "", "", -1, opWORD},

/* 9A cd       CALL cd */
	{c_cd, -1, {"CALL"}, " ", "", -1, opWORD},

/* 9B          FWAIT */
	{c_1byte, -1, {"FWAIT"}, "", "", -1, opWORD},

/* 9C          PUSHF */
	{c_1byte, -1, {"PUSHF"}, "", "", -1, opWORD},

/* 9D          POPF */
	{c_1byte, -1, {"POPF"}, "", "", -1, opWORD},

/* 9E          SAHF */
	{c_1byte, -1, {"SAHF"}, "", "", -1, opWORD},

/* 9F          LAHF */
	{c_1byte, -1, {"LAHF"}, "", "", -1, opWORD},

/* A0 iw       MOV AL,xb */
	{c_x, -1, {"MOV"}, " AL, ", "", -1, opBYTE},

/* A1 iw       MOV AX,xw */
	{c_x, -1, {"MOV"}, " AX, ", "", -1, opWORD},

/* A2 iw       MOV xb,AL */
	{c_x, -1, {"MOV"}, " ", ", AL", -1, opWORD},

/* A3 iw       MOV xw,AX */
	{c_x, -1, {"MOV"}, " ", ", AX", -1, opWORD},

/* A4          MOVSB */
	{c_1byte, -1, {"MOVSB"}, "", "", -1, opBYTE},

/* A5          MOVSW */
	{c_1byte, -1, {"MOVSW"}, "", "", -1, opWORD},

/* A6          CMPSB */
	{c_1byte, -1, {"CMPSB"}, "", "", -1, opBYTE},

/* A7          CMPSW */
	{c_1byte, -1, {"CMPSW"}, "", "", -1, opWORD},

/* A8 ib       TEST AL,ib */
	{c_ib, -1, {"TEST"}, " AL, ", "", -1, opBYTE},

/* A9 iw       TEST AX,iw */
	{c_iw, -1, {"TEST"}, " AX, ", "", -1, opWORD},

/* AA          STOSB */
	{c_1byte, -1, {"STOSB"}, "", "", -1, opBYTE},

/* AB          STOSW */
	{c_1byte, -1, {"STOSW"}, "", "", -1, opWORD},

/* AC          LODSB */
	{c_1byte, -1, {"LODSB"}, "", "", -1, opBYTE},

/* AD          LODSW */
	{c_1byte, -1, {"LODSW"}, "", "", -1, opWORD},

/* AE          SCASB */
	{c_1byte, -1, {"SCASB"}, "", "", -1, opBYTE},

/* AF          SCASW */
	{c_1byte, -1, {"SCASW"}, "", "", -1, opWORD},

/* The following instruction is expanded here to
   8 separate entries:
   B0+rb ib    MOV rb,ib */

/* B0 ib    MOV AL,ib */
	{c_ib, -1, {"MOV"}, " AL, ", "", -1, opBYTE},

/* B1 ib    MOV CL,ib */
	{c_ib, -1, {"MOV"}, " CL, ", "", -1, opBYTE},

/* B2 ib    MOV DL,ib */
	{c_ib, -1, {"MOV"}, " DL, ", "", -1, opBYTE},

/* B3 ib    MOV BL,ib */
	{c_ib, -1, {"MOV"}, " BL, ", "", -1, opBYTE},

/* B4 ib    MOV AH,ib */
	{c_ib, -1, {"MOV"}, " AH, ", "", -1, opBYTE},

/* B5 ib    MOV CH,ib */
	{c_ib, -1, {"MOV"}, " CH, ", "", -1, opBYTE},

/* B6 ib    MOV DH,ib */
	{c_ib, -1, {"MOV"}, " DH, ", "", -1, opBYTE},

/* B7 ib    MOV BH,ib */
	{c_ib, -1, {"MOV"}, " BH, ", "", -1, opBYTE},

/* The following instruction is expanded here to
   8 separate entries:
   B8+rw iw    MOV rw,iw */

/* B8 iw    MOV AX,iw */
	{c_iw, -1, {"MOV"}, " AX, ", "", -1, opWORD},

/* B9 iw    MOV CX,iw */
	{c_iw, -1, {"MOV"}, " CX, ", "", -1, opWORD},

/* BA iw    MOV DX,iw */
	{c_iw, -1, {"MOV"}, " DX, ", "", -1, opWORD},

/* BB iw    MOV BX,iw */
	{c_iw, -1, {"MOV"}, " BX, ", "", -1, opWORD},

/* BC iw    MOV SP,iw */
	{c_iw, -1, {"MOV"}, " SP, ", "", -1, opWORD},

/* BD iw    MOV BP,iw */
	{c_iw, -1, {"MOV"}, " BP, ", "", -1, opWORD},

/* BE iw    MOV SI,iw */
	{c_iw, -1, {"MOV"}, " SI, ", "", -1, opWORD},

/* BF iw    MOV DI,iw */
	{c_iw, -1, {"MOV"}, " DI, ", "", -1, opWORD},


/* C0          not used in 8086 */
/*
³C0 /0     ³ /r ib    ³  ROL rm8,i8                        ³
³C0 /1     ³ /r ib    ³  ROR rm8,i8                        ³
³C0 /2     ³ /r ib    ³  RCL rm8,i8                        ³
³C0 /3     ³ /r ib    ³  RCR rm8,i8                        ³
³C0 /4     ³ /r ib    ³  SHL rm8,i8                        ³
³C0 /5     ³ /r ib    ³  SHR rm8,i8                        ³
³C0 /6     ³ /r ib    ³  SHL rm8,i8                        ³
³C0 /7     ³ /r ib    ³  SAR rm8,i8                        ³

#400b20-diasm#
{c_0_to_7, c_ib, {"ROL", "ROR", "RCL", "RCR", "SHL", "SHR", "SHL", "SAR"}, ", ", "", -1, opBYTE},

*/
	{c_0_to_7, c_ib, {"ROL", "ROR", "RCL", "RCR", "SHL", "SHR", "SHL", "SAR"}, " ", "", -1, opBYTE},


/* C1          not used in 8086 */
/*
³C1 /0     ³ /r ib    ³  ROL rm16,i8                       ³
³C1 /1     ³ /r ib    ³  ROR rm16,i8                       ³
³C1 /2     ³ /r ib    ³  RCL rm16,i8                       ³
³C1 /3     ³ /r ib    ³  RCR rm16,i8                       ³
³C1 /4     ³ /r ib    ³  SHL rm16,i8                       ³
³C1 /5     ³ /r ib    ³  SHR rm16,i8                       ³
³C1 /6     ³ /r ib    ³  SHL rm16,i8                       ³
³C1 /7     ³ /r ib    ³  SAR rm16,i8                       ³

#400b20-diasm#
{c_0_to_7, c_ib, {"ROL", "ROR", "RCL", "RCR", "SHL", "SHR", "SHL", "SAR"}, ", ", "", -1, opWORD},

*/
	{c_0_to_7, c_ib, {"ROL", "ROR", "RCL", "RCR", "SHL", "SHR", "SHL", "SAR"}, " ", "", -1, opWORD},


/* C2 iw       RET iw */
	{c_iw, -1, {"RET"}, " ", "", -1, opWORD},

/* C3          RET */
	{c_1byte, -1, {"RET"}, "", "", -1, opWORD},

/* C4 /r       LES rw,ed */
	{c_r, -1, {"LES"}, " ", "", dir_R_E, opWORD},

/* C5 /r       LDS rw,ed */
	{c_r, -1, {"LDS"}, " ", "", dir_R_E, opWORD},

/* C6 /0 ib    MOV eb,ib */
	{c_0_to_7, c_ib, {"MOV", "???", "???", "???", "???", "???", "???", "???"}, " ", "", -1, opBYTE},


/* C7 /0 iw    MOV ew,iw */
	{c_0_to_7, c_iw, {"MOV", "???", "???", "???", "???", "???", "???", "???"}, " ", "", -1, opWORD},


/* C8           80186
	#400b20-diasm-more-instructions#
	{c_1byte, -1, {"DB "}, "0C8h", "", -1, opWORD},
*/
/* ³C8        ³ iw ib    ³  ENTER i16,i8                      ³ */
	{c_iw, c_ib, {"ENTER"}, " ", "", -1, opWORD},



/* C9          80186
   #400b20-diasm-more-instructions#
   {c_1byte, -1, {"DB "}, "0C9h", "", -1, opWORD},
*/
/* ³C9        ³ --       ³  LEAVE                             ³ */
	{c_1byte, -1, {"LEAVE"}, " ", "", -1, opWORD},

/* CA iw       RETF iw */
	{c_iw, -1, {"RETF"}, " ", "", -1, opWORD},

/* CB          RETF */
	{c_1byte, -1, {"RETF"}, "", "", -1, opWORD},

/* CC          INT 3 */
	{c_1byte, -1, {"INT 3"}, "", "", -1, opWORD},

/* CD ib       INT ib */
	{c_ib, -1, {"INT"}, " ", "", -1, opBYTE},

/* CE          INTO */
	{c_1byte, -1, {"INTO"}, "", "", -1, opWORD},

/* CF          IRET */
	{c_1byte, -1, {"IRET"}, "", "", -1, opWORD},

/*
	D0 /0       ROL eb,1
	D0 /1       ROR eb,1
	D0 /2       RCL eb,1
	D0 /3       RCR eb,1
	D0 /4       SHL eb,1
	D0 /5       SHR eb,1
	D0 /6     ³ /r       ³  SHL rm8,1
	D0 /7       SAR eb,1
*/
	{c_0_to_7, -1, {"ROL", "ROR", "RCL", "RCR", "SHL", "SHR", "SHL", "SAR"}, " ", ", 1", -1, opBYTE},


/*
	D1 /0       ROL ew,1
	D1 /1       ROR ew,1
	D1 /2       RCL ew,1
	D1 /3       RCR ew,1
	D1 /4       SHL ew,1
	D1 /5       SHR ew,1
	D1 /6     ³ /r       ³  SHL rm16,1
	D1 /7       SAR ew,1
*/
	{c_0_to_7, -1, {"ROL", "ROR", "RCL", "RCR", "SHL", "SHR", "SHL", "SAR"}, " ", ", 1", -1, opWORD},

/*
	D2 /0       ROL eb,CL
	D2 /1       ROR eb,CL
	D2 /2       RCL eb,CL
	D2 /3       RCR eb,CL
	D2 /4       SHL eb,CL
	D2 /5       SHR eb,CL
	D2 /6     ³ /r       ³  SHL rm8,CL
	D2 /7       SAR eb,CL
*/
	{c_0_to_7, -1, {"ROL", "ROR", "RCL", "RCR", "SHL", "SHR", "SHL", "SAR"}, " ", ", CL", -1, opBYTE},


/*
	D3 /0       ROL ew,CL
	D3 /1       ROR ew,CL
	D3 /2       RCL ew,CL
	D3 /3       RCR ew,CL
	D3 /4       SHL ew,CL
	D3 /5       SHR ew,CL
	D3 /6     ³ /r       ³  SHL rm16,CL
	D3 /7       SAR ew,CL
*/
	{c_0_to_7, -1, {"ROL", "ROR", "RCL", "RCR", "SHL", "SHR", "SHL", "SAR"}, " ", ", CL", -1, opWORD},


/* D4 0A       AAM
   second byte not checked */
	{c_2bytes, -1, {"AAM"}, "", "", -1, opWORD},

/* D5 0A       AAD
   second byte not checked */
	{c_2bytes, -1, {"AAD"}, "", "", -1, opWORD},

/* D6          not used in 8086 */
	{c_1byte, -1, {"DB "}, "0D6h", "", -1, opWORD},

/* D7          XLATB */
	{c_1byte, -1, {"XLATB"}, "", "", -1, opWORD},











/* ³D8-DF     ³(??)      ³(FPU instructions)                  ³ */

/* D8          FPU */
	{c_0_to_7, -1, {"FADD d", "FMUL d", "FCOM d", "FCOMP d", "FSUB d", "FSUBR d", "FDIV d", "FDIVR d"}, "", "", -1, opWORD},

/* D9          FPU */
	{c_0_to_7, -1, {"FLD d", "??? d", "FST d", "FSTP d", "FLDENV d", "FLDCW ", "FSTENV d", "FSTCW "}, "", "", -1, opWORD},

/* DA          FPU */
	{c_0_to_7, -1, {"FIADD d", "FIMUL d", "FICOM d", "FICOMP d", "FISUB d", "FISUBR d", "FIDIV d", "FIDIV d"}, "", "", -1, opWORD},

/* DB          FPU */
	{c_0_to_7, -1, {"FILD d", "??? d", "FIST d", "FISTP d", "FLD t", "??? ", "FSTP t"}, "", "", -1, opWORD},

/* DC          FPU */
	{c_0_to_7, -1, {"FADD q", "FMUL q", "FCOM q", "FCOMP q", "FSUB q", "FSUBR q", "FDIV q", "FDIVR q"}, "", "", -1, opWORD},

/* DD          FPU

let "sw"  be 94 bytes (status)
 */
	{c_0_to_7, -1, {"FLD q", "", "FST q", "FSTP q", "FRSTOR s", "??? q", "FSAVE s", "FSTSW "}, "", "", -1, opWORD},

/* DE          FPU */
	{c_0_to_7, -1, {"FIADD ", "FIMUL ", "FICOM ", "FICOMP ", "FISUB ", "FISUBR ", "FIDIV ", "FIDIVR "}, "", "", -1, opWORD},

/* DF          FPU */
	{c_0_to_7, -1, {"FILD ", "??? ", "FIST ", "FISTP ", "FBLD t", "FILD q", "FBSTP t", "FISTP q"}, "", "", -1, opWORD},













/* E0 cb       LOOPNE cb */
	{c_cb, -1, {"LOOPNE"}, " ", "", -1, opBYTE},

/* E1 cb       LOOPE cb */
	{c_cb, -1, {"LOOPE"}, " ", "", -1, opBYTE},

/* E2 cb       LOOP cb */    /* 1.32#475 */
	{c_cb, -1, {"LOOP"}, " ", "", -1, opBYTE},

/* E3 cb       JCXZ cb */
	{c_cb, -1, {"JCXZ"}, " ", "", -1, opBYTE},

/* E4 ib       IN AL,ib */
	{c_ib, -1, {"IN"}, " AL, ", "", -1, opBYTE},

/* E5 ib       IN AX,ib */
	{c_ib, -1, {"IN"}, " AX, ", "", -1, opWORD},

/* E6 ib       OUT ib,AL */
	{c_ib, -1, {"OUT"}, " ", ", AL", -1, opBYTE},

/* E7 ib       OUT ib,AX */
	{c_ib, -1, {"OUT"}, " ", ", AX", -1, opWORD},

/* E8 cw       CALL cw */
	{c_cw, -1, {"CALL"}, " ", "", -1, opBYTE},

/* E9 cw       JMP cw */
	{c_cw, -1, {"JMP"}, " ", "", -1, opBYTE},

/* EA cd       JMP cd */
	{c_cd, -1, {"JMP"}, " ", "", -1, opBYTE},

/* EB cb       JMP cb */
	{c_cb, -1, {"JMP"}, " ", "", -1, opBYTE},

/* EC          IN AL,DX */
	{c_1byte, -1, {"IN"}, " AL, ", "DX", -1, opBYTE},

/* ED          IN AX,DX */
	{c_1byte, -1, {"IN"}, " AX, ", "DX", -1, opWORD},


/* EE          OUT DX,AL */
	{c_1byte, -1, {"OUT"}, " DX, ", "AL", -1, opBYTE},

/* EF          OUT DX,AX */
	{c_1byte, -1, {"OUT"}, " DX, ", "AX", -1, opWORD},

/* F0          LOCK */
	{c_1byte, -1, {"LOCK"}, "", "", -1, opWORD},

/* F1          not used in 8086 */
	{c_1byte, -1, {"DB "}, "0F1h", "", -1, opWORD},

/* F2          REPNE (prfix) */
	{c_1byte, -1, {"REPNE"}, "", "", -1, opWORD},

/* F3          REPE (prefix) */
	{c_1byte, -1, {"REPE"}, "", "", -1, opWORD},

/* F4          HLT */
	{c_1byte, -1, {"HLT"}, "", "", -1, opWORD},

/* F5          CMC */
	{c_1byte, -1, {"CMC"}, "", "", -1, opWORD},

/*
	only first command has ib byte!!!

	F6 /0 ib    TEST eb,ib
	F6 /1       ???
	F6 /2       NOT eb
	F6 /3       NEG eb
	F6 /4       MUL eb
	F6 /5       IMUL eb
	F6 /6       DIV eb
	F6 /7       IDIV eb
*/
	{c_0_to_7, c_ib_only_0, {"TEST", "???", "NOT", "NEG", "MUL", "IMUL", "DIV", "IDIV"}, " ", "", -1, opBYTE},


/*
	only first command has iw word!!!

	F7 /0 iw    TEST ew,iw
	F7 /1       ???
	F7 /2       NOT ew
	F7 /3       NEG ew
	F7 /4       MUL ew
	F7 /5       IMUL ew
	F7 /6       DIV ew
	F7 /7       IDIV ew
*/
	{c_0_to_7, c_iw_only_0, {"TEST", "???", "NOT", "NEG", "MUL", "IMUL", "DIV", "IDIV"}, " ", "", -1, opWORD},


/* F8          CLC */
	{c_1byte, -1, {"CLC"}, "", "", -1, opWORD},

/* F9          STC */
	{c_1byte, -1, {"STC"}, "", "", -1, opWORD},

/* FA          CLI */
	{c_1byte, -1, {"CLI"}, "", "", -1, opWORD},

/* FB          STI */
	{c_1byte, -1, {"STI"}, "", "", -1, opWORD},

/* FC          CLD */
	{c_1byte, -1, {"CLD"}, "", "", -1, opWORD},

/* FD          STD */
	{c_1byte, -1, {"STD"}, "", "", -1, opWORD},

/*
	FE /0       INC eb
	FE /1       DEC eb
	FE /2       ???
	FE /3       ???
	FE /4       ???
	FE /5       ???
	FE /6       ???
	FE /7       ???
*/
	{c_0_to_7, -1, {"INC", "DEC", "???", "???", "???", "???", "???", "???"}, " ", "", -1, opBYTE},


/*
    These last opcodes are different from regular table,
	because there is ew, ed, md, mw on the same opcode (FF).
	Though HIEW does it by the table, thus there is no difference
	between FF10 (JMP ew) and FF18 (JMP md).
	Though, HexIt does it more correctly.
	I made it "DWORD PTR" for CALL ed and JMP md,
	this didn't require to write any special code,
	"D" added in command name.
	(from version 1.0.0.7 it will be "Dw.")

	FF /0       INC ew
	FF /1       DEC ew
	FF /2       CALL ew
	FF /3       CALL ed
	FF /4       JMP ew
	FF /5       JMP md
	FF /6       PUSH mw
	FF /7       ???          - used by emulator to make calls to VB code (emulated interupts)!
*/
	{c_0_to_7, -1, {"INC ", "DEC ", "CALL ", "CALL d", "JMP ", "JMP d", "PUSH ", "BIOS "}, "", "", -1, opWORD},


};

int _stdcall tfunc(char *p, int iSize)
{
/*
	int i;

	for (i=0; i<iSize; i++)
		p[i]=i;
*/
/*
	p[0]='A';
	p[1]='B';
	p[2]='C';
	p[3]='D';
*/

	strcpy(p, "Copyright (c)  emu8086.com                       ");
	return 10;
}

/*
1.0.0.6
makes a singed displacement,
by copying the correct sign (+/-) into
sSign and placing correct value into disp8
*/
void setDisp8(unsigned char ud8)
{
	if (ud8 >= 128)
	{
		disp8 = 256 - ud8;
		strcpy(sSign, "- ");
	}
	else
	{
		disp8 = ud8;
		strcpy(sSign, "+ ");
	}
}



/*

  *recBuf  -  the receiver buffer (receives disassembled code strings).

  *recLocCounter - array that receives location counter for each disassembled line.

  *p - array of actual binary code (opcodes).

  iSize - size of *p.

  iStartOffset - starting offset (used to correctly decode relative JMPs).

  return - iLineCounter (number of disassembled lines).
*/

int _stdcall disassemble(char *recBuf, int *recLocCounter, unsigned char *p, int iSize, int iStartOffset)
{
	int i, iColumn, iRow;
	unsigned char c, k, c1, c2, c3, c4;
//	char d8, c8;
	char c8;
	short d16;
	int opCodeB1, opCodeB2;

	int iLineCounter=0;


	strcpy(recBuf, "");


	for (i=0; i<iSize; i++)
	{
		recLocCounter[iLineCounter] = i;

		c = p[i];

		opCodeB1 = opcodes[c].byte1;
		opCodeB2 = opcodes[c].byte2;

		switch (opCodeB1)
		{
		case c_0_to_4_S:  /* only for WORD type! ES, CS, SS, DS */
			sprintf(buffer1, "%s%s" , opcodes[c].sINSTRUCTION[0], opcodes[c].sPREFIX);
			strcat(recBuf, buffer1);
			strcpy(buffer1, "");

			i++;
			k = p[i];
			iColumn = eaByte[k].iColumn;
			iRow = eaByte[k].iRow;

			if (eaByte[k].iType == PLUS__d8)
			{
				i++;
				//d8 = p[i];

				setDisp8(p[i]);

				if (opcodes[c].r_e_dir)
					sprintf(buffer1, "%s, %s%s0%Xh", column_s[iColumn], eaRowsW[iRow], sSign, disp8);
				else
					sprintf(buffer1, "%s%s0%Xh, %s", eaRowsW[iRow], sSign, disp8, column_s[iColumn]);

			}
			else if (eaByte[k].iType == PLUS_d16)
			{
				i++;
				c1 = p[i];
				i++;
				c2 = p[i];

				if (opcodes[c].r_e_dir)
					sprintf(buffer1, "%s, %s0%02X%02Xh", column_s[iColumn], eaRowsW[iRow], c2, c1);
				else
					sprintf(buffer1, "%s0%02X%02Xh, %s", eaRowsW[iRow], c2, c1, column_s[iColumn]);

			}
			else if (eaByte[k].iType == VAR__d16)
			{
				i++;
				c1 = p[i];
				i++;
				c2 = p[i];

				if (opcodes[c].r_e_dir)
					sprintf(buffer1, "%s, [0%02X%02Xh]", column_s[iColumn], c2, c1);
				else
					sprintf(buffer1, "[0%02X%02Xh], %s", c2, c1, column_s[iColumn]);

			}
			else   // no displacement
			{
				if (opcodes[c].r_e_dir)
					sprintf(buffer1, "%s, %s", column_s[iColumn], eaRowsW[iRow]);
				else
					sprintf(buffer1, "%s, %s", eaRowsW[iRow], column_s[iColumn]);

			}
			break;


		case c_0_to_7:
			i++;
			k = p[i];






			//===================================================================== >> [FPU]
					// #400b20-diasm-more-fpu#
					//  corrections for irregulary encoded FPU instructions
					unsigned char STindex;
					unsigned char cmdFPUindex;

					if (c==0xD8) // D8
					{
						if (k>=0xC0 && k<=0xFF)
						{
							if (k<=0xC7)     // C0    C7
							{					
								STindex = k - 0xC0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FADD st0, st%d" , STindex);
							}
							else if (k<=0xCF) // C8   CF
							{
								STindex = k - 0xC8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FMUL st0, st%d" , STindex);
							}
							else if (k<=0xD7) // D0   D7
							{
								STindex = k - 0xD0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FCOM st0, st%d" , STindex);
							}
							else if (k<=0xDF) // D8   DF
							{
								STindex = k - 0xD8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FCOMP st0, st%d" , STindex);
							}
							else if (k<=0xE7) // E0   E7
							{
								STindex = k - 0xE0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FSUB st0, st%d" , STindex);
							}
							else if (k<=0xEF) // E8   EF
							{
								STindex = k - 0xE8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FSUBR st0, st%d" , STindex);
							}
							else if (k<=0xF7) // F0   F7
							{
								STindex = k - 0xF0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FDIV st0, st%d" , STindex);
							}
							else              // F8  FF
							{
								STindex = k - 0xF8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FDIVR st0, st%d" , STindex);
							}
						}
						else
							goto regular_encoding;
					}
					else if(c==0xD9) // D9
					{						
						if (k>=0xC0 && k<=0xFF)
						{
							if (k<=0xC7)     // C0    C7
							{					
								STindex = k - 0xC0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FLD st%d" , STindex);
							}
							else if (k<=0xCF) // C8   CF
							{
								STindex = k - 0xC8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FXCH st0, st%d" , STindex);
							}
							else if (k==0xD0)
							{
								strcpy(buffer1, "FNOP");											
							}
							else if (k<=0xD7) // D0   D7
							{
								// D1 to DF is not used
								strcpy(buffer1, "???");
							}
							else if (k<=0xDF) // D8   DF
							{
								// D1 to DF is not used 
								strcpy(buffer1, "???");

							}
							else              // E0   FF
							{								
								cmdFPUindex = k - 0xE0;
								char *cmdFPU_D9_E0_FF[] =  {"FCHS",   "FABS",   "FTST",   "FXAM",   "FLD1",   "FLDL2T",   "FLDL2E",   "FLDPI",   "FLDLG2",   "FLDLN2",   "FLDZ",   "F2XM1",   "FYL2X",   "FPTAN",   "FPATAN",   "FXTRACT",   "FPREM1",   "FDECSTP",   "FINCSTP",   "FPREM",   "FYL2XP1",   "FSQRT",   "FSINCOS",   "FRNDINT",   "FSCALE",   "FSIN",   "FCOS"};
								strcpy(buffer1, cmdFPU_D9_E0_FF[cmdFPUindex]);											
							}
						}
						else
							goto regular_encoding;
					}
					else if(c==0xDA) // DA
					{
						if (k>=0xC0 && k<=0xFF)
						{
							// only E9 is used
							if (k==0xE9)
								strcpy(buffer1, "FUCOMPP");
							else
								strcpy(buffer1, "???");
						}
						else
							goto regular_encoding;
					}
					else if(c==0xDB) // DB
					{
						if (k>=0xC0 && k<=0xFF)
						{
							// only E0 to E4 and E8, EA, EB, F1 are used
							if (k>=0xE0 && k<=0xE4)
							{
								cmdFPUindex = k - 0xE0;
								char *cmdFPU_DB_E0_E4[] =  {"FENI",   "FDISI",   "FCLEX",   "FINIT",   "FSETPM"};
								strcpy(buffer1, cmdFPU_DB_E0_E4[cmdFPUindex]);											
							}
							else if (k==0xE8)
								strcpy(buffer1, "FBANK 0");
							else if (k==0xEA)
								strcpy(buffer1, "FBANK 2");
							else if (k==0xEB)
								strcpy(buffer1, "FBANK 1");
							else if (k==0xF1)
								strcpy(buffer1, "F4X4");
							else
								strcpy(buffer1, "???");
						}
						else
							goto regular_encoding;
					}
					else if(c==0xDC) // DC
					{
						if (k>=0xC0 && k<=0xFF)
						{
							if (k<=0xC7)     // C0    C7
							{					
								STindex = k - 0xC0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FADD st%d, st0" , STindex);
							}
							else if (k<=0xCF) // C8   CF
							{
								STindex = k - 0xC8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FMUL st%d, st0" , STindex);
							}
							else if (k<=0xD7) // D0   D7  - not used
							{
								strcpy(buffer1, "???");											
							}
							else if (k<=0xDF) // D8   DF  - not used
							{
								strcpy(buffer1, "???");											
							}
							else if (k<=0xE7) // E0   E7
							{
								STindex = k - 0xE0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FSUBR st%d, st0" , STindex);
							}
							else if (k<=0xEF) // E8   EF
							{
								STindex = k - 0xE8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FSUB st%d, st0" , STindex);
							}
							else if (k<=0xF7) // F0   F7
							{
								STindex = k - 0xF0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FDIVR st%d, st0" , STindex);
							}
							else              // F8  FF
							{
								STindex = k - 0xF8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FDIV st%d, st0" , STindex);
							}
						}
						else
							goto regular_encoding;
					}
					else if(c==0xDD) // DD
					{
						if (k>=0xC0 && k<=0xFF)
						{
							if (k<=0xC7)     // C0    C7
							{					
								STindex = k - 0xC0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FFREE st%d" , STindex);
							}
							else if (k<=0xCF) // C8   CF
							{
								STindex = k - 0xC8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "??? st%d" , STindex);
							}
							else if (k<=0xD7) // D0   D7
							{
								STindex = k - 0xD0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FST st%d" , STindex);										
							}
							else if (k<=0xDF) // D8   DF
							{
								STindex = k - 0xD8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FSTP st%d" , STindex);										
							}
							else if (k<=0xE7) // E0   E7
							{
								STindex = k - 0xE0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FUCOM st%d" , STindex);
							}
							else if (k<=0xEF) // E8   EF
							{
								STindex = k - 0xE8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FUCOMP st%d" , STindex);
							}
							else if (k<=0xF7) // F0   F7
							{
								STindex = k - 0xF0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "F??? st%d" , STindex);
							}
							else              // F8  FF
							{
								STindex = k - 0xF8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "F??? st%d" , STindex);
							}
						}
						else
							goto regular_encoding;
					}		
					else if(c==0xDE) // DE
					{
						if (k>=0xC0 && k<=0xFF)
						{
							if (k<=0xC7)     // C0    C7
							{					
								STindex = k - 0xC0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FADDP st%d, st0" , STindex);
							}
							else if (k<=0xCF) // C8   CF
							{
								STindex = k - 0xC8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FMULP st%d, st0" , STindex);
							}
							else if (k<=0xD7) // D0   D7
							{
								STindex = k - 0xD0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "F??? st%d, st0" , STindex);										
							}
							else if (k<=0xDF) // D8   DF
							{
								if (k==0xD9)
								{
									strcpy(buffer1, "FCOMPP");	
								}
								else
								{
									STindex = k - 0xD8;
									strcpy(buffer1, "");	
									sprintf(buffer1, "F??? st%d" , STindex);
								}
							}
							else if (k<=0xE7) // E0   E7
							{
								STindex = k - 0xE0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FSUBRP st%d, st0" , STindex);
							}
							else if (k<=0xEF) // E8   EF
							{
								STindex = k - 0xE8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FSUBP st%d, st0" , STindex);
							}
							else if (k<=0xF7) // F0   F7
							{
								STindex = k - 0xF0;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FDIVRP st%d, st0" , STindex);
							}
							else              // F8  FF
							{
								STindex = k - 0xF8;
								strcpy(buffer1, "");			
								sprintf(buffer1, "FDIVP st%d, st0" , STindex);
							}
						}
						else
							goto regular_encoding;
					}	
					else if(c==0xDF) // DF
					{
						if (k>=0xC0 && k<=0xFF)
						{
							if (k==0xE0)
							{
								strcpy(buffer1, "FSTSW AX");
							}
							else
							{
								strcpy(buffer1, "F???");
							}
						}
						else
							goto regular_encoding;
					}	
					else
					{
			//===================================================================== << [FPU]
			regular_encoding:   /// start


						iRow = eaByte[k].iRow;
						iColumn = eaByte[k].iColumn ;

						sprintf(buffer1, "%s%s" , opcodes[c].sINSTRUCTION[iColumn], opcodes[c].sPREFIX);
						strcat(recBuf, buffer1);
						strcpy(buffer1, "");

						/* required to show BYTE PTR or WORD PTR only
						when there is an immidiate value and the
						recever isn't a register
						if ((opCodeB2 == -1) || (iRow >= 24))*/

						/* required to show BYTE PTR or WORD PTR only
						recever isn't a register */
						if (iRow >= 24)
						{
							if (opcodes[c].is_byte)
								sprintf(buffer1, "%s", eaRowsB[iRow]);
							else
								sprintf(buffer1, "%s", eaRowsW[iRow]);
						}
						else
						{
							if (opcodes[c].is_byte)
								sprintf(buffer1, "b.%s", eaRowsB[iRow]);
							else
								sprintf(buffer1, "w.%s", eaRowsW[iRow]);
						}

						strcat(recBuf, buffer1);
						strcpy(buffer1, "");

						if (eaByte[k].iType == PLUS__d8)
						{
							i++;
							setDisp8(p[i]);
							sprintf(buffer1, "%s0%Xh", sSign, disp8);
						}
						else if (eaByte[k].iType == PLUS_d16)
						{
							i++;
							c1 = p[i];
							i++;
							c2 = p[i];
							sprintf(buffer1, "0%02X%02Xh", c2, c1);
						}
						else if (eaByte[k].iType == VAR__d16)
						{
							i++;
							c1 = p[i];
							i++;
							c2 = p[i];
							sprintf(buffer1, "[0%02X%02Xh]", c2, c1);
						}

					} /// regular_encoding:   /// stop


			break;

		case c_r:
			sprintf(buffer1, "%s%s" , opcodes[c].sINSTRUCTION[0], opcodes[c].sPREFIX);
			strcat(recBuf, buffer1);
			strcpy(buffer1, "");

			i++;
			k = p[i];
			iColumn = eaByte[k].iColumn;
			iRow = eaByte[k].iRow;

			if (eaByte[k].iType == PLUS__d8)
			{
				i++;
				// d8 = p[i];

				setDisp8(p[i]);

				if (opcodes[c].r_e_dir)
					if (opcodes[c].is_byte)
						sprintf(buffer1, "%s, %s%s0%Xh", column_rb[iColumn], eaRowsB[iRow], sSign, disp8);
					else
						sprintf(buffer1, "%s, %s%s0%Xh", column_rw[iColumn], eaRowsW[iRow], sSign, disp8);
				else
					if (opcodes[c].is_byte)
						sprintf(buffer1, "%s%s0%Xh, %s", eaRowsB[iRow], sSign, disp8, column_rb[iColumn]);
					else
						sprintf(buffer1, "%s%s0%Xh, %s", eaRowsW[iRow], sSign, disp8, column_rw[iColumn]);

			}
			else if (eaByte[k].iType == PLUS_d16)
			{
				i++;
				c1 = p[i];
				i++;
				c2 = p[i];

				if (opcodes[c].r_e_dir)
					if (opcodes[c].is_byte)
						sprintf(buffer1, "%s, %s0%02X%02Xh", column_rb[iColumn], eaRowsB[iRow], c2, c1);
					else
						sprintf(buffer1, "%s, %s0%02X%02Xh", column_rw[iColumn], eaRowsW[iRow], c2, c1);
				else
					if (opcodes[c].is_byte)
						sprintf(buffer1, "%s0%02X%02Xh, %s", eaRowsB[iRow], c2, c1, column_rb[iColumn]);
					else
						sprintf(buffer1, "%s0%02X%02Xh, %s", eaRowsW[iRow], c2, c1, column_rw[iColumn]);

			}
			else if (eaByte[k].iType == VAR__d16)
			{
				i++;
				c1 = p[i];
				i++;
				c2 = p[i];

				if (opcodes[c].r_e_dir)
					if (opcodes[c].is_byte)
						sprintf(buffer1, "%s, [0%02X%02Xh]", column_rb[iColumn], c2, c1);
					else
						sprintf(buffer1, "%s, [0%02X%02Xh]", column_rw[iColumn], c2, c1);
				else
					if (opcodes[c].is_byte)
						sprintf(buffer1, "[0%02X%02Xh], %s", c2, c1, column_rb[iColumn]);
					else
						sprintf(buffer1, "[0%02X%02Xh], %s", c2, c1, column_rw[iColumn]);

			}
			else   // no displacement
			{
				if (opcodes[c].r_e_dir)
					if (opcodes[c].is_byte)
						sprintf(buffer1, "%s, %s", column_rb[iColumn], eaRowsB[iRow]);
					else
						sprintf(buffer1, "%s, %s", column_rw[iColumn], eaRowsW[iRow]);
				else
					if (opcodes[c].is_byte)
						sprintf(buffer1, "%s, %s", eaRowsB[iRow], column_rb[iColumn]);
					else
						sprintf(buffer1, "%s, %s", eaRowsW[iRow], column_rw[iColumn]);

			}
			break;

		case c_cb:
			i++;
			/* here we have a convertion from unsigned char to
			   signed char! */
			c8 = p[i];
			c8 = c8 + i + 1;

			// 1.29#400
			int dddd;
			dddd = (unsigned char)c8 + iStartOffset;

			sprintf(buffer1, "%s%s0%Xh" , opcodes[c].sINSTRUCTION[0], opcodes[c].sPREFIX, dddd);
			break;

		case c_ib:
			i++;
			sprintf(buffer1, "%s%s0%Xh" , opcodes[c].sINSTRUCTION[0], opcodes[c].sPREFIX, p[i]);
			break;

		case c_iw:
			i++;
			c1 = p[i];
			i++;
			c2 = p[i];
			sprintf(buffer1, "%s%s0%02X%02Xh" , opcodes[c].sINSTRUCTION[0], opcodes[c].sPREFIX, c2, c1);
			break;

		case c_cd:
			i++;
			c1 = p[i];
			i++;
			c2 = p[i];
			i++;
			c3 = p[i];
			i++;
			c4 = p[i];
			sprintf(buffer1, "%s%s0%02X%02Xh:0%02X%02Xh" , opcodes[c].sINSTRUCTION[0], opcodes[c].sPREFIX, c4, c3, c2, c1);
			break;

		case c_cw:
			i++;
			d16 = p[i];
			i++;
			d16 = d16 + (p[i]<<8);
			d16 = d16 + i + 1;
			sprintf(buffer1, "%s%s0%04Xh" , opcodes[c].sINSTRUCTION[0], opcodes[c].sPREFIX, d16 + iStartOffset);
			break;

		case c_1byte:
			sprintf(buffer1, "%s%s" , opcodes[c].sINSTRUCTION[0], opcodes[c].sPREFIX);
			break;

		/* 1.0.0.4 */
		case c_2bytes:
			sprintf(buffer1, "%s%s" , opcodes[c].sINSTRUCTION[0], opcodes[c].sPREFIX);
			i++; /* skip second 0A byte */
			// second byte ignored.
			break;

		case c_x:
			i++;
			c1 = p[i];
			i++;
			c2 = p[i];
			sprintf(buffer1, "%s%s[0%02X%02Xh]" , opcodes[c].sINSTRUCTION[0], opcodes[c].sPREFIX, c2, c1);
			break;


		// #400b20-jcc-word# 
		case c_EXTENDED:
			i++;
			if ((p[i] & 0xF0) == 0x80) 
			{
				char *cJCC_WORD_INSTRUCTIONS[] = {"JO", "JNO", "JC", "JNC", "JZ", "JNZ", "JNA", "JA", "JS", "JNS", "JP", "JNP", "JL", "JGE", "JLE", "JG"};
				c1 = p[i];
				c1 = c1 & 0x0F;
				i++;
				d16 = p[i];
				i++;
				d16 = d16 + (p[i]<<8);
				d16 = d16 + i + 1;
				sprintf(buffer1, "%s 0%04Xh" , cJCC_WORD_INSTRUCTIONS[c1], d16 + iStartOffset);
			}
			else
			{
				sprintf(buffer1, "EXT ???");
			}
			break;
		}

		strcat(recBuf, buffer1);
		strcpy(buffer1, "");

		switch (opCodeB2)
		{
		case -1:
			// second byte is not used in this command!
			break;

		case c_ib:
			i++;
			sprintf(buffer1, ", 0%Xh" , p[i]);
			break;

		case c_ib_only_0:
			if (eaByte[k].iColumn == 0)
			{
				i++;
				sprintf(buffer1, ", 0%Xh" , p[i]);
			}
			break;

		case c_iw:
			i++;
			c1 = p[i];
			i++;
			c2 = p[i];
			/* bug fix 1.07
				sprintf(buffer1, ", 0%Xh" , c2, c1); */
			sprintf(buffer1, ", 0%02X%02Xh" , c2, c1);
			break;

		case c_iw_only_0:
			if (eaByte[k].iColumn == 0)
			{
				i++;
				c1 = p[i];
				i++;
				c2 = p[i];
				/* bug fix 1.07 "0%Xh" replaced */
				sprintf(buffer1, ", 0%02X%02Xh" , c2, c1);
			}
			break;
		}




		strcat(recBuf, buffer1);
		
		strcpy(buffer1, "");			
		sprintf(buffer1, "%s\n" , opcodes[c].sSUFFIX);

		strcat(recBuf, buffer1);
		strcpy(buffer1, "");


		iLineCounter++;
	} /* end of for */

	return iLineCounter;
}

/* ----------------------------------------------------- */

/*    adding another math analyser
   v. 1.0.0.9
*/
#include "analyser.h"

/* YUR: this function should be called to
        initialize the calc, I assume taht
		this function should be called once
		before using DLL to calc().
		To prevent calling intitialize() twice,
		I will use a global flag.
*/
int _stdcall yur_init_analyser(void)
{
	if (fINIT_DONE==0)
	{
		initialize();
		fINIT_DONE = 1;
		return 1;  // done!
	}
	return 0;  // done previously!
}

int _stdcall analyse(char *exprBuf)
{
	char    buffer[100];

	strcpy(buffer, exprBuf);

	return eval(buffer);
}



/* 1.0.0.9 */
LPSTR _stdcall s_Last_analyse_ERROR()
{
	if ( Error )
		return sLastAnalyser_err;
	else
		return "ok";
}