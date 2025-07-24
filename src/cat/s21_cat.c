#include "s21_cat.h"

int main(int argc, char *argv[]) {
  Flags options = {0};
  options.err = handle_header(argc, argv, &options);
  if (!options.err) {
    int line_count = 0;
    int after_empty_line = 0;
    if (optind == argc) {
      print_file(NULL, &options, &line_count, &after_empty_line);
    } else {
      for (; optind < argc; optind++) {
#ifdef __APPLE__
        line_count = 0;
        after_empty_line = 0;
#endif
        if (*argv[optind] == '-') {
          print_file(NULL, &options, &line_count, &after_empty_line);
        } else {
          print_file(argv[optind], &options, &line_count, &after_empty_line);
        }
      }
    }
  }
  return 0;
}

int handle_header(int argc, char *argv[], Flags *options) {
  int opt;
  struct option long_option[] = {{"number-nonblank", 0, NULL, 'b'},
                                 {"number", 0, NULL, 'n'},
                                 {"squeeze-blank", 0, NULL, 's'},
                                 {NULL, 0, NULL, 0}};
  opterr = 1;
  while ((opt = getopt_long(argc, argv, SHORT_OPTIONS, long_option, NULL)) !=
             -1 &&
         !options->err) {
    set_options(opt, options);
    if (opt == 'e' || opt == 't') options->v = 1;
  }
  if (options->b) options->n = 0;
  return options->err;
}

void print_file(char *filename, Flags *options, int *line_count,
                int *after_empty_line) {
  FILE *f;
  int flag = 1;
  int size = 2;
  char *line = calloc(size, sizeof(char));
  if (line == NULL) {
    flag = 0;
    fprintf(stderr, "Memory allocation error");
  }
  if (filename != NULL)
    f = fopen(filename, "r");
  else
    f = stdin;
  if (f == NULL) {
    flag = 0;
    fprintf(stderr, "%s: No such file\n", filename);
  }
  if (flag) {
    line = get_line(f, line, &size, 1);
    while (line != NULL && *line != EOF) {
      print_line(line, options, line_count, after_empty_line);
      line = get_line(f, line, &size, 1);
    }
    if (f != stdin) fclose(f);
    if (line != NULL) free(line);
  }
}

void print_line(char *line, Flags *options, int *line_count,
                int *after_empty_line) {
  if (!(*line == '\n' && *after_empty_line && options->s)) {
    if (options->n || (options->b && *line != '\n'))
      printf("%6d\t", ++(*line_count));
#ifdef __APPLE__
    if (options->b && options->e && *line == '\n') printf("      \t");
#endif
    if (*line == '\n') {
      *after_empty_line = 1;
    } else {
      *after_empty_line = 0;
    }
    char *ptr = line;
    while (*ptr) {
      print_char((unsigned char)*ptr, options);
      ptr++;
    }
  }
}

void print_char(unsigned char c, Flags *options) {
  if (c == '\t') {
    if (options->t) {
      printf("^I");
    } else {
      printf("%c", c);
    }
  } else if (c == '\n') {
    if (options->e) printf("$");
    printf("%c", c);
  } else if (options->v) {
    if (c >= 32) {
      if (c < 127) {
        printf("%c", c);
      } else if (c == 127 || c == 255) {
        printf("%s", "^?");
      } else {
        printf("%s", "M-");
        if (c >= 128 + 32) {
          if (c < 128 + 127) printf("%c", c - 128);
        } else {
          printf("%c%c", '^', c - 128 + 64);
        }
      }
    } else {
      printf("%c%c", '^', c + 64);
    }
  } else {
    printf("%c", c);
  }
}