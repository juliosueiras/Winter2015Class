/*
 * =====================================================================================
 *
 *       Filename:  circle.c
 *
 *    Description:
 *
 *        Version:  1.0
 *        Created:  2015-01-19 08:58:11 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (),
 *   Organization:
 *
 * =====================================================================================
 */
#include <stdio.h>
#define PI 3.14

void main ()
{
    float radius;
    float area;
    float perimeter;

    printf("Enter radius:");
    scanf("%f", &radius);

    area = PI*radius*radius;
    printf("Value of c : %f \n", area);

    perimeter = 2*PI*radius;
    printf("Value of f : %f \n", perimeter);
}
