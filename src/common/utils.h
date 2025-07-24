#ifndef UTILS_H
#define UTILS_H

#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int b;
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  int h;
  int s;
  int f;
  int o;
  int t;
  int err;
} Flags;

void set_options(int opt, Flags *options);
char *get_line(FILE *filename, char *line, int *size, int newline);
char *resize(char *line, int *size);

#endif