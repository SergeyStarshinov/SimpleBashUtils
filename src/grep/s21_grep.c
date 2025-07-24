#include "s21_grep.h"

int main(int argc, char *argv[]) {
  Flags options = {0};
  regex_t regex_ptr;
  options.err = handle_header(argc, argv, &options, &regex_ptr);
  if (!options.err) {
    if (optind == argc) {
      print_file(NULL, &options, &regex_ptr);
    } else {
      for (; optind < argc; optind++) {
        if (argv[optind][0] == '-') {
          print_file(NULL, &options, &regex_ptr);
        } else {
          print_file(argv[optind], &options, &regex_ptr);
        }
      }
    }
  }
  regfree(&regex_ptr);
  return 0;
}

int handle_header(int argc, char *argv[], Flags *options, regex_t *regex_ptr) {
  int opt;
  char *pattern = NULL;
  opterr = 1;
  while ((opt = getopt(argc, argv, SHORT_OPTIONS)) != -1 && !options->err) {
    set_options(opt, options);
    if (opt == 'e' || opt == 'f') pattern = set_pattern(pattern, opt, options);
  }
  if (options->v) options->o = 0;
  if (!options->err) {
    if (pattern == NULL) {
      pattern = create_pattern(argv[optind++]);
    }
    int regex_res;
    regex_res = regcomp(regex_ptr, pattern,
                        (REG_EXTENDED | (options->i ? REG_ICASE : 0)));
    if (regex_res) {
      options->err = 1;
      fprintf(stderr, "Unrecognized pattern %s\n", pattern);
    }
  }
  if (optind >= argc - 1) options->h = 1;
  if (pattern != NULL) free(pattern);
  return options->err;
}

void print_file(char *filename, Flags *options, regex_t *regex_ptr) {
  FILE *f;
  int flag = 1;
  int size = 2;
  char *line = calloc(size, sizeof(char));
  if (line == NULL) {
    flag = 0;
    fprintf(stderr, "Memory allocation error");
  }
  if (filename != NULL && flag) {
    f = fopen(filename, "r");
  } else {
    f = stdin;
  }
  if (f == NULL) {
    flag = 0;
    if (!options->s) fprintf(stderr, "%s: No such file\n", filename);
  }
  if (flag) {
    int line_count_matched = 0;
    int line_number = 0;
    do {
      line = get_line(f, line, &size, 0);
      line_number++;
      if (line == NULL || *line == EOF) {
        flag = 0;
      } else {
        print_line(line, options, filename, regex_ptr, &line_count_matched,
                   line_number);
      }
    } while (flag);
#ifndef __APPLE__
    if (!options->l)
#endif
      if (options->c) {
        if (!options->h) printf("%s:", filename);
        printf("%d\n", options->l ? 1 : line_count_matched);
      }
    if (options->l && line_count_matched) printf("%s\n", filename);
    if (f != stdin) fclose(f);
  }
  if (line != NULL) free(line);
}

void print_line(char *line, Flags *options, char *filename, regex_t *regex_ptr,
                int *line_count_matched, int line_number) {
  int regex_res;
  regmatch_t pmatch[2];
  regex_res = regexec(regex_ptr, line, 2, pmatch, 0);
  if (options->v) regex_res = !regex_res;
  if (!regex_res && (options->c || options->l)) {
    (*line_count_matched)++;
  } else {
    if (options->o) {
      while (!regex_res) {
        if (!options->h) printf("%s:", filename);
        if (options->n) printf("%d:", line_number);
        printf("%.*s\n", (int)(pmatch[0].rm_eo - pmatch[0].rm_so),
               line + pmatch[0].rm_so);
        line += pmatch[0].rm_eo;
        regex_res = regexec(regex_ptr, line, 2, pmatch, 0);
      }
    } else if (!regex_res) {
      if (!options->h) printf("%s:", filename);
      if (options->n) printf("%d:", line_number);
      printf("%s\n", line);
    }
  }
}

char *create_pattern(char *source) {
  char *pattern = calloc(strlen(source) + 1, sizeof(char));
  pattern = strcpy(pattern, source);
  return pattern;
}

char *add_pattern(char *dest, char *source) {
  char *tmp = realloc(dest, (strlen(dest) + strlen(source) + 3) * sizeof(char));
  if (tmp == NULL) {
    free(dest);
  } else {
    tmp = strcat(tmp, "|");
    tmp = strcat(tmp, source);
  }
  return tmp;
}

char *add_patterns_from_file(char *pattern, char *filename) {
  FILE *f;
  int flag = 1;
  int size = 2;
  char *line = calloc(size, sizeof(char));
  if (line == NULL) {
    flag = 0;
    fprintf(stderr, "Memory allocation error");
  }
  if (flag) {
    f = fopen(filename, "r");
    if (f == NULL) {
      flag = 0;
      fprintf(stderr, "%s: No such file\n", filename);
    }
  }
  if (flag) {
    do {
      line = get_line(f, line, &size, 0);
      if (*line != EOF && *line != '\n') {
        if (pattern == NULL) {
          pattern = create_pattern(line);
        } else {
          pattern = add_pattern(pattern, line);
        }
      }
    } while (*line != EOF);
    fclose(f);
  }
  if (line != NULL) free(line);
  return pattern;
}

char *set_pattern(char *pattern, int opt, Flags *options) {
  if (opt == 'e') {
    if (pattern == NULL) {
      pattern = create_pattern(optarg);
    } else {
      pattern = add_pattern(pattern, optarg);
    }
    if (pattern == NULL) options->err = 1;
  }
  if (opt == 'f') {
    pattern = add_patterns_from_file(pattern, optarg);
    if (pattern == NULL) options->err = 1;
  }
  return pattern;
}