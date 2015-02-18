/*
 * =====================================================================================
 *
 *       Filename:  main.c
 *
 *    Description:  The main program to execute
 *
 *        Version:  1.0
 *        Created:  2015-02-15 09:10:37 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Julio Tain Sueiras
 *   Organization:
 *
 * =====================================================================================
 */
#include <stdio.h>
#include "assign1.h"

int main(void){
    char user_string[100];
    char user_input;

    strcpy(user_string,ask_to_input_string());

    display_menu();

    option_selection_for(user_input,user_string);

    return 0;
}
