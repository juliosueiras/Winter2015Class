/*
 * =====================================================================================
 *
 *       Filename:  tap_test.c
 *
 *    Description:
 *
 *        Version:  1.0
 *        Created:  2015-02-25 06:41:25 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (),
 *   Organization:
 *
 * =====================================================================================
 */
#include <string.h>
#include <ccan/tap/tap.h>

// Run some simple (but overly chatty) tests on strcmp().
int main(int argc, char *argv[])
{
        const char a[] = "a", another_a[] = "a";
        const char b[] = "b";
        const char ab[] = "ab";

        plan_tests(4);
        diag("Testing different pointers (%p/%p) with same contents",
             a, another_a);
        ok1(strcmp(a, another_a) == 0);

        diag("'a' comes before 'b'");
        ok1(strcmp(a, b) < 0);
        ok1(strcmp(b, a) > 0);

        diag("'ab' comes after 'a'");
        ok1(strcmp(ab, a) > 0);
        return exit_status();
}

