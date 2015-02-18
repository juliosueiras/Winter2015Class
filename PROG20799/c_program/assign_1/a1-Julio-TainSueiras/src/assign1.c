/*
 * =====================================================================================
 *
 *       Filename:  assign1.c
 *
 *    Description:  A Program that display a menu and let the user pick among some basic
 *                  string manipulation.
 *
 *        Version:  1.0
 *        Created:  2015-02-15 01:23:00 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Julio Tain Sueiras
 *   Organization:
 *
 * =====================================================================================
 */
#include <stdio.h>
#include <string.h>

#include "assign1.h"

int is_vowels(char input_char){
    return strchr("AEIOUaeiou",input_char);
}

int is_consonants(char input_char){
    return strchr("BCDFGHJKLMNPQRSTVXZWYbcdfghjklmnpqrstvxzwy",input_char);
}

int get_total_vowels(char input_string[]){

    int total_vowels = 0;
    int char_index;

    for (char_index = 0; char_index < strlen(input_string); char_index++) {
        total_vowels += (is_vowels(input_string[char_index]))? 1 : 0;
    }


    return total_vowels;
}

int get_total_consonants(char input_string[]){
    int total_consonants= 0;
    int char_index;

    for (char_index = 0; char_index < strlen(input_string); char_index++) {
        total_consonants += (is_consonants(input_string[char_index]))? 1 : 0;
    }

    return total_consonants;

}

char* convert_to_lower_case(char input_string[]){
    //Linux C Compiler does not have struwc in the library
    char result_string[strlen(input_string) - 1];
    strcpy(result_string,input_string);
    int i;

    for (i = 0; i < strlen(input_string); i++) {
        result_string[i] = tolower(result_string[i]);
    }

    return result_string;
}

const char* convert_to_upper_case(char input_string[]){
    //Linux C Compiler does not have strlwr in the library
    char result_string[strlen(input_string) - 1];
    strcpy(result_string,input_string);

    int i;
    for (i = 0; i < strlen(input_string); i++) {
        result_string[i] = toupper(result_string[i]);
    }

    return result_string;
}

void display_string(char input_string[]){
    printf("%s\n", input_string);
}

void display_menu(){
    printf("A) Count the number of vowels in the string\n"
            "B) Count the number of consonants in the string\n"
            "C) Convert the string to uppercase\n"
            "D) Convert the string to lowercase\n"
            "E) Display the current string\n"
            "F) Enter another string\n"
            "\n"
            "M) Display this menu\n"
            "X) Exit the program\n");

}

char* ask_to_input_string(){
    char result_string[200];
    printf("Please enter String:\n");

    fflush(stdin);
    fgets(result_string,sizeof(result_string),stdin);
    fflush(stdin);

    return result_string;
}


void option_selection_for(char user_input, char user_string[]){

    /* char* original_user_string = user_string; */

    do{

        printf("Enter the option(lower or upper case letter):");


        user_input = toupper(fgetc(stdin));

        switch (user_input) {

            case 'A':
                printf("Total Vowels:%d\n", get_total_vowels(user_string));
                break;

            case 'B':
                printf("Total Consonants:%d\n", get_total_consonants(user_string));
                break;

            case 'C':
                printf("Upper Case Converted:%s\n", convert_to_upper_case(user_string));
                break;

            case 'D':
                printf("Lower Case Converted:%s\n", convert_to_lower_case(user_string));
                break;

            case 'E':
                printf("Current String:%s\n", user_string);
                fflush(stdin);
                break;

            case 'F':
                strcpy(user_string,ask_to_input_string());
                break;

            case 'M':
                display_menu;
                break;

            case 'X':
                break;

            default:
                printf("The Option is not valid please enter it again\n");
                break;
        }

        getchar();

    }while(user_input != 'X');
}
