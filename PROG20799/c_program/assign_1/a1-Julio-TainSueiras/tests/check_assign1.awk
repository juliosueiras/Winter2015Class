#include <stdio.h>
#include <string.h>
#include "../src/assign1.h"

#suite assign1
#test test_convert_to_lower_case
    char test_value[] = "Hello";
    char correct_value[] = "hello";

    strcpy(test_value,convert_to_lower_case(test_value));

    ck_assert_str_eq(test_value,correct_value);

#test test_convert_to_lower_case_full_sentence
    char test_value[] = "HELlo WOrld";
    char correct_value[] = "hello world";

    strcpy(test_value,convert_to_lower_case(test_value));

    ck_assert_str_eq(test_value,correct_value);

#test test_convert_to_upper_case
    char test_value[] = "Hello";
    char correct_value[] = "HELLO";

    strcpy(test_value,convert_to_upper_case(test_value));

    ck_assert_str_eq(test_value,correct_value);

#test test_convert_to_upper_case_full_sentence
    char test_value[] = "HELlo WOrld";
    char correct_value[] = "HELLO WORLD";

    strcpy(test_value,convert_to_upper_case(test_value));

    ck_assert_str_eq(test_value,correct_value);

#test test_get_total_vowels_with_vowels
    char test_string[] = "hello";
    int correct_value = 2;
    int test_value;

    test_value = get_total_vowels(test_string);

    ck_assert_int_eq(test_value,correct_value);

#test test_get_total_vowels_all_vowels
    char test_string[] = "Aia";
    int correct_value = 3;
    int test_value;

    test_value = get_total_vowels(test_string);

    ck_assert_int_eq(test_value,correct_value);

#test test_get_total_vowels_without_vowels
    char test_string[] = "myth";
    int correct_value = 0;
    int test_value;

    test_value = get_total_vowels(test_string);

    ck_assert_int_eq(test_value,correct_value);


#test test_get_total_consonants_with_consonants
    char test_string[] = "hello";
    int correct_value = 3;
    int test_value;

    test_value = get_total_consonants(test_string);

    ck_assert_int_eq(test_value,correct_value);

#test test_get_total_consonants_all_consonants
    char test_string[] = "myth";
    int correct_value = 4;
    int test_value;

    test_value = get_total_consonants(test_string);

    ck_assert_int_eq(test_value,correct_value);

#test test_get_total_consonants_without_consonants
    char test_string[] = "Aia";
    int correct_value = 0;
    int test_value;

    test_value = get_total_consonants(test_string);

    ck_assert_int_eq(test_value,correct_value);

