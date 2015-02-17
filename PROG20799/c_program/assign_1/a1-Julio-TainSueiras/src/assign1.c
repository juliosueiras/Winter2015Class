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
    return !strchr("AEIOUaeiou",input_char);
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
    int i;
    for (i = 0; i < strlen(input_string); i++) {
        input_string[i] = tolower(input_string[i]);
    }
    return input_string;
}

char* convert_to_upper_case(char input_string[]){
    //Linux C Compiler does not have strlwr in the library
    int i;
    for (i = 0; i < strlen(input_string); i++) {
        input_string[i] = toupper(input_string[i]);
    }
    return input_string;
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
    char result_string[100];
    printf("Please enter String:\n");
    fgets(result_string,sizeof(result_string),stdin);
    return (const char *)result_string;
}

