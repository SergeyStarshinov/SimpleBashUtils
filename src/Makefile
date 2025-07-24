FLAGS = -Wall -Werror -Wextra -std=c11

all: build
build: s21_grep s21_cat
s21_grep: grep/s21_grep.c grep/s21_grep.h common/utils.c common/utils.h
	gcc $(FLAGS) grep/s21_grep.c common/utils.c -o grep/s21_grep
s21_cat: cat/s21_cat.c cat/s21_cat.h common/utils.c common/utils.h
	gcc $(FLAGS) cat/s21_cat.c common/utils.c -o cat/s21_cat
rebuild: clean build
clean:
	rm -rf grep/s21_grep
	rm -rf cat/s21_cat