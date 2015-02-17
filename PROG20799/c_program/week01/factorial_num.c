/*
 * =====================================================================================
 *
 *       Filename:  factorial_num.c
 *
 *    Description:
 *
 *        Version:  1.0
 *        Created:  2015-01-21 04:10:12 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (),
 *   Organization:
 *
 * =====================================================================================
 */
#include <stdio.h>

void main(){

    long n = 0;
    long result = 1;
    printf("Enter the number for checking factorial:");
    scanf("%ld", &n);

    for ( long i = n; i > 1; i--) {
        printf("i:%ld \n", i);
        result =  result * i;
        printf("current result:%ld \n", result);
    }
    printf("final result:%ld", result);
}
