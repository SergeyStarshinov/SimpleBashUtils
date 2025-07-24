#ifndef S21_GREP_H
#define S21_GREP_H
#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <string.h>

#include "../common/utils.h"

#define SHORT_OPTIONS "e:ivclnhsf:o"

void print_file(char *filename, Flags *options, regex_t *regex_ptr);
void print_line(char *line, Flags *options, char *filename, regex_t *regex_ptr,
                int *line_count_matched, int line_number);
char *create_pattern(char *source);
char *add_pattern(char *dest, char *source);
char *add_patterns_from_file(char *pattern, char *filename);
char *set_pattern(char *pattern, int opt, Flags *options);
int handle_header(int argc, char *argv[], Flags *options, regex_t *regex_ptr);

#endif