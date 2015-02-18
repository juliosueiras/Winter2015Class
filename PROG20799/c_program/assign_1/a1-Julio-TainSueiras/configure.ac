#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.
CFLAGS=-Wall -Wextra
AM_CFLAGS=-g
LIBS=-lcheck

AC_PREREQ([2.69])
AC_INIT([assign1_julio_tain], [0.1],[juliosueiras@gmail.com])
AC_CONFIG_SRCDIR([config.h.in])
AC_CONFIG_HEADERS([config.h])
AM_INIT_AUTOMAKE
LT_INIT
PKG_CHECK_MODULES([CHECK], [check >= 0.9.6])
AC_CONFIG_MACRO_DIR([m4])

# Checks for programs.
AC_PROG_CC

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([string.h])

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile
                 src/Makefile
                 tests/Makefile])
AC_OUTPUT
