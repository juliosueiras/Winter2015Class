/*
 * DO NOT EDIT THIS FILE. Generated by checkmk.
 * Edit the original source file "tests/check_assign1.awk" instead.
 */

#include <check.h>

#line 1 "tests/check_assign1.awk"
#include <stdio.h>
#include <string.h>
#include "../src/assign1.h"

START_TEST(test_convert_to_lower_case)
{
#line 7
    char test_value[] = "Hello";
    char correct_value[] = "hello";

    strcpy(test_value,convert_to_lower_case(test_value));

    ck_assert_str_eq(test_value,correct_value);

}
END_TEST

START_TEST(test_convert_to_lower_case_full_sentence)
{
#line 15
    char test_value[] = "HELlo WOrld";
    char correct_value[] = "hello world";

    strcpy(test_value,convert_to_lower_case(test_value));

    ck_assert_str_eq(test_value,correct_value);

}
END_TEST

START_TEST(test_convert_to_upper_case)
{
#line 23
    char test_value[] = "Hello";
    char correct_value[] = "HELLO";

    strcpy(test_value,convert_to_upper_case(test_value));

    ck_assert_str_eq(test_value,correct_value);

}
END_TEST

START_TEST(test_convert_to_upper_case_full_sentence)
{
#line 31
    char test_value[] = "HELlo WOrld";
    char correct_value[] = "HELLO WORLD";

    strcpy(test_value,convert_to_upper_case(test_value));

    ck_assert_str_eq(test_value,correct_value);

}
END_TEST

START_TEST(test_get_total_vowels_with_vowels)
{
#line 39
    char test_string[] = "hello";
    int correct_value = 2;
    int test_value;

    test_value = get_total_vowels(test_string);

    ck_assert_int_eq(test_value,correct_value);

}
END_TEST

START_TEST(test_get_total_vowels_all_vowels)
{
#line 48
    char test_string[] = "Aia";
    int correct_value = 3;
    int test_value;

    test_value = get_total_vowels(test_string);

    ck_assert_int_eq(test_value,correct_value);

}
END_TEST

START_TEST(test_get_total_vowels_without_vowels)
{
#line 57
    char test_string[] = "myth";
    int correct_value = 0;
    int test_value;

    test_value = get_total_vowels(test_string);

    ck_assert_int_eq(test_value,correct_value);


}
END_TEST

START_TEST(test_get_total_consonants_with_consonants)
{
#line 67
    char test_string[] = "hello";
    int correct_value = 3;
    int test_value;

    test_value = get_total_consonants(test_string);

    ck_assert_int_eq(test_value,correct_value);

}
END_TEST

START_TEST(test_get_total_consonants_all_consonants)
{
#line 76
    char test_string[] = "myth";
    int correct_value = 4;
    int test_value;

    test_value = get_total_consonants(test_string);

    ck_assert_int_eq(test_value,correct_value);

}
END_TEST

START_TEST(test_get_total_consonants_without_consonants)
{
#line 85
    char test_string[] = "Aia";
    int correct_value = 0;
    int test_value;

    test_value = get_total_consonants(test_string);

    ck_assert_int_eq(test_value,correct_value);



}
END_TEST

int main(void)
{
    Suite *s1 = suite_create("assign1");
    TCase *tc1_1 = tcase_create("assign1");
    SRunner *sr = srunner_create(s1);
    int nf;

    suite_add_tcase(s1, tc1_1);
    tcase_add_test(tc1_1, test_convert_to_lower_case);
    tcase_add_test(tc1_1, test_convert_to_lower_case_full_sentence);
    tcase_add_test(tc1_1, test_convert_to_upper_case);
    tcase_add_test(tc1_1, test_convert_to_upper_case_full_sentence);
    tcase_add_test(tc1_1, test_get_total_vowels_with_vowels);
    tcase_add_test(tc1_1, test_get_total_vowels_all_vowels);
    tcase_add_test(tc1_1, test_get_total_vowels_without_vowels);
    tcase_add_test(tc1_1, test_get_total_consonants_with_consonants);
    tcase_add_test(tc1_1, test_get_total_consonants_all_consonants);
    tcase_add_test(tc1_1, test_get_total_consonants_without_consonants);

    srunner_run_all(sr, CK_ENV);
    nf = srunner_ntests_failed(sr);
    srunner_free(sr);

    return nf == 0 ? 0 : 1;
}
