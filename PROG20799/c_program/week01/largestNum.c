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
    int b;
    int c;

    printf("Enter three number:");
    scanf("%d %d %d", &a, &b, &c);

    if (a > b && a > c) {
        printf("First Number is the largest");
    }else if(b > a && b > c){
        printf("Second Number is the largest");
    }else if(c > a && c > b){
        printf("Third Number is the largest");
    }else{
        printf("There is no largest number");
    }

}

