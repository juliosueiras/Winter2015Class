/*
 * =====================================================================================
 *
 *       Filename:  assign1.h
 *
 *    Description:  Header for assign1
 *
 *        Version:  1.0
 *        Created:  2015-02-15 02:03:54 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Julio Tain Sueiras
 *         Organization:
 *
 * =====================================================================================
 */
int is_vowels(char input_char);
int is_consonants(char input_char);
int get_total_vowels(char input_string[]);
int get_total_consonants(char input_string[]);
char* ask_to_input_string();
const char* convert_to_lower_case(char input_string[]);
const char* convert_to_upper_case(char input_string[]);
void display_menu();
void display_string(char input_string[]);
int is_true(char value_1, char value_2);
int is_false(char value_1, char value_2);
void program_run();
void process_selected_option(char user_option, char user_string[]);

