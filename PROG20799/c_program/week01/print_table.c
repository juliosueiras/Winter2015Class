/*
 * =====================================================================================
 *
 *       Filename:  print_table.c
 *
 *    Description:  Print a table of any number
 *
 *        Version:  1.0
 *        Created:  2015-01-21 03:29:08 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Julio Tain Sueiras,
 *   Organization:  Sheridan College
 *
 * =====================================================================================
 */
#include <stdio.h>

void main(){

    for ( int i = 0; i <= 10; ++i) {
        printf("\n------\n");
        printf("|");
        for ( int j = 0; j <= 10; ++j) {
            printf(" %d |",j);
        printf("-----");
        }
        printf("\n-----");
    }

}

