#include "utils.h"

char *get_line(FILE *filename, char *line, int *size, int newline) {
  int i = 0;
  char c = fgetc(filename);
  if (c == EOF) line[i++] = c;
  while (c != EOF && c != '\n' && line != NULL) {
    if (i >= *size - 2) line = resize(line, size);
    if (line != NULL) {
      line[i++] = c;
      c = fgetc(filename);
    }
  }
  if (line != NULL) {
    if (c == '\n' && newline) line[i++] = c;
    line[i] = 0;
  }
  return line;
}

char *resize(char *line, int *size) {
  *size += 20;
  char *tmp = realloc(line, (*size) * sizeof(char));
  if (tmp == NULL) {
    free(line);
    printf("Memory allocation error\n");
  }
  return tmp;
}

void set_options(int opt, Flags *options) {
  switch (opt) {
    case 'b':
      options->b = 1;
      break;
    case 'e':
    case 'E':
      options->e = 1;
      break;
    case 'n':
      options->n = 1;
      break;
    case 's':
      options->s = 1;
      break;
    case 't':
    case 'T':
      options->t = 1;
      break;
    case 'i':
      options->i = 1;
      break;
    case 'v':
      options->v = 1;
      break;
    case 'c':
      options->c = 1;
      break;
    case 'l':
      options->l = 1;
      break;
    case 'h':
      options->h = 1;
      break;
    case 'f':
      options->f = 1;
      break;
    case 'o':
      options->o = 1;
      break;
    default:
      options->err = 1;
      break;
  }
}