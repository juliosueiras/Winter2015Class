/*
 * =====================================================================================
 *
 *       Filename:  operator.c
 *
 *    Description:
 *
 *        Version:  1.0
 *        Created:  2015-01-21 06:22:32 PM
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
    int a = 21, b = 10,c;

    c = a + b;
    printf("Value of C is %d\n", c);

    c = a - b;
    printf("Value of C is %d\n", c);

    c = a * b;
    printf("Value of C is %d\n", c);

    c = a / b;
    printf("Value of C is %d\n", c);

    c = a % b;
    printf("Value of C is %d\n", c);

    c = a++;
    printf("Value of C is %d\n", c);

    c = a--;
    printf("Value of C is %d\n", c);
}

