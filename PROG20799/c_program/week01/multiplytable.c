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

    int n;
    printf("Enter a number:");
    scanf("%d", &n);

    for ( int i = 1; i <= 10; ++i) {
            printf(" %d x %d = %d\n",n,i,n*i);
    }

}

