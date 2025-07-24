FLAGS = -Wall -Werror -Wextra -std=c11

all: build
build: s21_grep
s21_grep: s21_grep.c s21_grep.h ../common/utils.c ../common/utils.h
	gcc $(FLAGS) s21_grep.c ../common/utils.c -o s21_grep
rebuild: clean build
clean:
	rm -rf s21_grep