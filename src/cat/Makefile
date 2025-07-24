FLAGS = -Wall -Werror -Wextra -std=c11

all: build
build: s21_cat
s21_cat: s21_cat.c s21_cat.h ../common/utils.c ../common/utils.h
	gcc $(FLAGS) s21_cat.c ../common/utils.c -o s21_cat
rebuild: clean build
clean:
	rm -rf s21_cat