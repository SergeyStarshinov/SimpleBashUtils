#ifndef S21_CAT_H
#define S21_CAT_H
#include <getopt.h>
#include <stdio.h>

#include "../common/utils.h"

#define SHORT_OPTIONS "beEvnstT"

void print_file(char *filename, Flags *options, int *line_count,
                int *after_empty_line);
void print_line(char *line, Flags *options, int *line_count,
                int *after_empty_line);
void print_char(unsigned char c, Flags *options);
int handle_header(int argc, char *argv[], Flags *options);

#endif