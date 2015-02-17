/*
 * =====================================================================================
 *
 *       Filename:  numOddOrEven.c
 *
 *    Description:
 *
 *        Version:  1.0
 *        Created:  2015-01-19 09:30:17 PM
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
    int a;

    printf("Enter a number:");
    scanf("%d", &a);

    if (a % 2 == 0) {
        printf("Number is even");
    }else{
        printf("Number is odd");
    }

}

