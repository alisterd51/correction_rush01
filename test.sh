#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

function to_print() {
	echo "$@"
}

function to_exec_print() {
	to_print "$@"
	"$@"
}

function to_check_exec_print() {
	to_print "$@"
	"$@" > result
	if < result ./checker_rush01 "$2"; then
		echo -n -e "${GREEN}"
	else
		echo -n -e "${RED}"
	fi
	cat -e result
	echo -n -e "${NC}"
	rm result
}

function get_authors() {
	grep -rF "by" . |& grep -v "./test.sh"
	git log --all |& grep "Author:"
}

to_print "============================================="
to_print "|             Setup                         |"
to_print "============================================="

to_exec_print rm ./checker_rush01
to_exec_print wget https://github.com/alisterd51/checker_rush01/releases/download/v1.0.3/checker_rush01
to_exec_print chmod +x ./checker_rush01

to_print "============================================="
to_print "|             auteurs                       |"
to_print "============================================="

get_authors

to_print "============================================="
to_print "|             logs                          |"
to_print "============================================="

to_exec_print git log --all --oneline | cat -e

to_print "============================================="
to_print "|             norminette                    |"
to_print "============================================="

to_exec_print norminette --version
to_exec_print norminette

to_print "============================================="
to_print "|             fonctions utilise             |"
to_print "============================================="

to_exec_print cc -O0 ./*.c -o rush-01
to_exec_print nm -u rush-01

to_print "============================================="
to_print "|             compilation                   |"
to_print "============================================="

to_exec_print clang -Wall -Wextra -Werror ./*.c -o rush-01
to_exec_print gcc -Wall -Wextra -Werror ./*.c -o rush-01
to_exec_print cc -Wall -Wextra -Werror -g3 -fsanitize=leak,undefined,address ./*.c -o rush-01

to_print "============================================="
to_print "|             test mandatory Error 4 x 4    |"
to_print "============================================="

to_exec_print ./rush-01
to_exec_print ./rush-01 "4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2" "4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2"
to_exec_print ./rush-01 ""
to_exec_print ./rush-01 "4 3 2 1 1 2 2 2 4 d 2 1 1 2 2 2"
to_exec_print ./rush-01 "4 3 2 0 1 2 2 2 4 3 2 1 1 2 2 2"
to_exec_print ./rush-01 "-4 -3 -2 -1 -1 -2 -2 -2 -4 -3 -2 -1 -1 -2 -2 -2"
to_exec_print ./rush-01 " 4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2"
to_exec_print ./rush-01 "4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2 "
to_exec_print ./rush-01 "3321123333211233               "
to_exec_print ./rush-01 "3321123333211233"
to_exec_print ./rush-01 " 4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 "
to_exec_print ./rush-01 "4 3 2 1  1 2 2 2 4 3 2 1 1 2 2 2"
to_exec_print ./rush-01 "2 1 2 4 224 2 1 2 1 3 2 3 3 2 1"
to_exec_print ./rush-01 "2 1 2 4 2	4 2 1 2 1 3 2 3 3 2 1"
to_exec_print ./rush-01 "                               "
to_exec_print ./rush-01 "1111111111111111111111111111111"
to_exec_print ./rush-01 "4 2 1 1 2 2 24 3 3 2 1 1 2 2 2 2"
to_exec_print ./rush-01 "4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2 2"
to_exec_print ./rush-01 "4 3 2 1 1 2 2 2 4 3 2 2 2 2"
to_exec_print ./rush-01 "4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4"
to_exec_print ./rush-01 "2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2"
to_exec_print ./rush-01 "3 1 2 2 2 3 3 1 2 3 1 2 2 1 3 2"
to_exec_print ./rush-01 "1 4 2 2 3 2 1 2 1 3 2 2 3 1 2 2"
to_exec_print ./rush-01 "4 3 2 1 1	2 2 2 4 3 2 1 1 2 2 2"

to_print "============================================="
to_print "|             test mandatory OK 4 x 4       |"
to_print "============================================="

to_check_exec_print ./rush-01 "1 2 2 3 3 2 2 1 1 3 2 3 4 2 2 1"
to_check_exec_print ./rush-01 "1 2 3 2 3 1 2 2 1 4 2 2 4 1 2 2"
to_check_exec_print ./rush-01 "1 3 3 2 4 1 2 2 1 2 3 2 2 1 2 3"
to_check_exec_print ./rush-01 "1 4 2 2 4 1 2 2 1 2 3 2 2 1 2 3"
to_check_exec_print ./rush-01 "2 3 1 2 2 1 3 2 3 1 3 2 2 4 1 2"
to_check_exec_print ./rush-01 "2 1 2 3 2 3 2 1 2 3 1 2 3 2 3 1"
to_check_exec_print ./rush-01 "2 1 2 4 2 4 2 1 2 1 3 2 3 3 2 1"
to_check_exec_print ./rush-01 "2 4 1 2 2 1 3 3 2 4 1 2 2 1 3 3"
to_check_exec_print ./rush-01 "2 2 1 3 2 3 2 1 2 2 1 3 2 2 3 1"
to_check_exec_print ./rush-01 "2 3 2 1 3 1 2 2 3 1 2 2 1 3 2 2"
to_check_exec_print ./rush-01 "2 2 2 1 2 1 3 4 3 3 1 2 1 2 3 3"
to_check_exec_print ./rush-01 "2 4 2 1 2 1 2 4 2 1 3 2 1 2 2 3"
to_check_exec_print ./rush-01 "2 2 1 3 3 2 2 1 3 1 2 4 2 2 2 1"
to_check_exec_print ./rush-01 "3 2 1 2 1 2 3 2 3 2 2 1 2 1 3 3"
to_check_exec_print ./rush-01 "3 1 2 3 2 2 3 1 2 2 1 3 3 2 2 1"
to_check_exec_print ./rush-01 "3 2 2 1 2 2 1 3 4 2 1 3 1 2 2 2"
to_check_exec_print ./rush-01 "3 1 2 2 2 3 2 1 2 2 1 4 2 2 4 1"
to_check_exec_print ./rush-01 "3 1 3 2 2 4 1 2 2 3 1 2 2 1 3 2"
to_check_exec_print ./rush-01 "4 2 1 2 1 2 3 3 3 3 2 1 2 1 2 4"
to_check_exec_print ./rush-01 "4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2"

to_print "============================================="
to_print "|             Partie bonus                  |"
to_print "============================================="

to_print "============================================="
to_print "|             test Erreur 1 x 1             |"
to_print "============================================="

to_exec_print ./rush-01 "1 1 1 1 1"
to_exec_print ./rush-01 "1 1 1"
to_exec_print ./rush-01 "1 1 1 1 "
to_exec_print ./rush-01 " 1 1 1 1"
to_exec_print ./rush-01 " 1 1 1 1 "
to_exec_print ./rush-01 "1111111"
to_exec_print ./rush-01 "       "
to_exec_print ./rush-01 "1 111 1"
to_exec_print ./rush-01 "1 1	1 1"
to_exec_print ./rush-01 "1 a 1 1"
to_exec_print ./rush-01 "1 2 1 1"

to_print "============================================="
to_print "|             test OK 1 x 1                 |"
to_print "============================================="

to_check_exec_print ./rush-01 "1 1 1 1"

to_print "============================================="
to_print "|             test Erreur 2 x 2             |"
to_print "============================================="

to_exec_print ./rush-01 "2 1 1 2 2 1 1 2 1"
to_exec_print ./rush-01 "2 1 1 2 2 1 1"
to_exec_print ./rush-01 "2 1 1 2 2 1 1 2 "
to_exec_print ./rush-01 " 2 1 1 2 2 1 1 2"
to_exec_print ./rush-01 " 2 1 1 2 2 1 1 2 "
to_exec_print ./rush-01 "221111222211112"
to_exec_print ./rush-01 "               "
to_exec_print ./rush-01 "2 1 1 212 1 1 2"
to_exec_print ./rush-01 "2 1 1 2	2 1 1 2"
to_exec_print ./rush-01 "2 1 a 2 2 1 1 2"
to_exec_print ./rush-01 "2 1 3 2 2 1 1 2"
to_exec_print ./rush-01 "2 1 2 1 2 1 1 2"

to_print "============================================="
to_print "|             test OK 2 x 2                 |"
to_print "============================================="

to_check_exec_print ./rush-01 "2 1 1 2 2 1 1 2"
to_check_exec_print ./rush-01 "1 2 2 1 1 2 2 1"

to_print "============================================="
to_print "|             test Erreur 3 x 3             |"
to_print "============================================="

to_exec_print ./rush-01 "2 2 1 2 1 3 3 1 2 1 2 2 1"
to_exec_print ./rush-01 "2 2 1 2 1 3 3 1 2 1 2"
to_exec_print ./rush-01 "2 2 1 2 1 3 3 1 2 1 2 2 "
to_exec_print ./rush-01 " 2 2 1 2 1 3 3 1 2 1 2 2"
to_exec_print ./rush-01 " 2 2 1 2 1 3 3 1 2 1 2 2 "
to_exec_print ./rush-01 "22221122113333112211222"
to_exec_print ./rush-01 "                       "
to_exec_print ./rush-01 "2 2 1 211 3 3 1 2 1 2 2"
to_exec_print ./rush-01 "2 2 1 2 1 3 3	1 2 1 2 2"
to_exec_print ./rush-01 "2 2 1 2 a 3 3 1 2 1 2 2"
to_exec_print ./rush-01 "2 2 1 2 1 3 3 1 4 1 2 2"
to_exec_print ./rush-01 "2 2 1 2 1 2 3 1 2 1 2 2"

to_print "============================================="
to_print "|             test OK 3 x 3                 |"
to_print "============================================="

to_check_exec_print ./rush-01 "2 2 1 2 1 3 3 1 2 1 2 2"
to_check_exec_print ./rush-01 "1 2 2 3 1 2 1 2 2 3 1 2"
to_check_exec_print ./rush-01 "3 1 2 1 2 2 2 2 1 2 1 3"
to_check_exec_print ./rush-01 "2 1 3 2 2 1 2 1 3 2 2 1"
to_check_exec_print ./rush-01 "2 3 1 2 1 2 2 1 2 1 3 2"
to_check_exec_print ./rush-01 "1 3 2 2 1 2 1 3 2 2 1 2"
to_check_exec_print ./rush-01 "2 1 2 1 3 2 2 3 1 2 1 2"
to_check_exec_print ./rush-01 "2 1 2 2 3 1 2 1 2 2 3 1"
to_check_exec_print ./rush-01 "1 2 2 3 2 1 1 2 3 2 2 1"
to_check_exec_print ./rush-01 "3 2 1 1 2 2 3 2 1 1 2 2"
to_check_exec_print ./rush-01 "1 2 3 2 2 1 1 2 2 3 2 1"
to_check_exec_print ./rush-01 "2 2 1 1 2 3 2 2 1 1 2 3"

to_print "============================================="
to_print "|             test Erreur 5 x 5             |"
to_print "============================================="

# TODO

to_print "============================================="
to_print "|             test OK 5 x 5                 |"
to_print "============================================="

to_check_exec_print ./rush-01 "3 2 1 2 4 2 4 4 2 1 3 2 3 1 2 3 4 2 2 1"
to_check_exec_print ./rush-01 "5 2 1 3 2 1 4 2 2 2 3 2 3 2 1 2 3 2 1 3"
to_check_exec_print ./rush-01 "2 1 2 3 3 2 4 2 3 1 2 2 3 1 2 4 2 2 3 1"
to_check_exec_print ./rush-01 "3 2 3 1 2 2 1 2 5 3 3 3 1 3 2 2 1 4 2 2"
to_check_exec_print ./rush-01 "2 5 2 1 2 2 1 2 3 4 2 3 1 3 2 2 1 2 2 4"

to_print "============================================="
to_print "|             test Erreur 6 x 6             |"
to_print "============================================="

# TODO

to_print "============================================="
to_print "|             test OK 6 x 6                 |"
to_print "============================================="

to_check_exec_print ./rush-01 "4 4 2 2 1 3 1 2 3 3 4 2 3 4 3 2 2 1 2 2 3 3 1 5"
to_check_exec_print ./rush-01 "4 3 2 2 1 4 1 2 4 4 3 2 4 3 2 4 2 1 2 2 2 1 3 2"
to_check_exec_print ./rush-01 "4 1 3 2 2 3 2 3 2 1 4 3 2 3 3 1 3 2 3 2 1 5 2 2"
to_check_exec_print ./rush-01 "3 3 3 2 1 2 2 4 2 3 4 1 3 4 2 1 3 2 2 3 3 3 4 1"
to_check_exec_print ./rush-01 "3 2 2 2 1 3 1 2 3 3 3 2 3 3 3 2 4 1 2 2 2 3 1 4"

to_print "============================================="
to_print "|             test Erreur 7 x 7             |"
to_print "============================================="

# TODO

to_print "============================================="
to_print "|             test OK 7 x 7                 |"
to_print "============================================="

to_check_exec_print ./rush-01 "4 6 2 1 4 3 2 1 2 2 4 2 3 5 3 7 5 4 3 2 1 2 1 2 2 3 3 5"
to_check_exec_print ./rush-01 "7 2 1 4 5 2 3 1 2 3 2 3 3 3 3 4 3 2 3 2 1 3 2 1 3 3 3 4"
to_check_exec_print ./rush-01 "5 2 2 3 3 1 2 1 2 2 4 3 5 4 4 7 3 2 2 2 1 2 1 2 3 4 4 5"
to_check_exec_print ./rush-01 "5 2 4 2 3 2 1 1 2 2 3 3 5 4 3 6 3 2 2 2 1 1 2 3 4 4 4 3"
to_check_exec_print ./rush-01 "5 5 1 2 3 3 2 1 2 3 2 3 3 4 2 6 4 3 3 2 1 4 1 2 3 3 2 5"

to_print "============================================="
to_print "|             test Erreur 8 x 8             |"
to_print "============================================="

# TODO

to_print "============================================="
to_print "|             test OK 8 x 8                 |"
to_print "============================================="

to_check_exec_print ./rush-01 "2 4 3 1 3 2 2 3 2 1 3 3 3 2 4 2 2 4 3 2 1 2 4 2 4 2 2 4 4 3 1 3"
to_check_exec_print ./rush-01 "2 1 2 4 3 2 3 4 3 3 2 1 4 2 2 5 2 1 3 4 3 2 3 3 4 3 2 1 3 2 2 4"
to_check_exec_print ./rush-01 "3 2 4 3 2 3 2 1 5 4 1 4 2 2 4 3 5 2 3 1 2 2 3 3 1 2 3 4 2 3 3 3"
to_check_exec_print ./rush-01 "3 2 3 2 3 3 2 1 2 2 3 3 2 1 5 4 3 2 3 2 4 2 1 4 1 2 3 2 3 4 3 3"
to_check_exec_print ./rush-01 "1 4 2 3 3 3 2 3 2 1 3 3 4 2 4 3 1 3 3 3 2 4 3 2 5 2 3 2 3 1 3 4"

to_print "============================================="
to_print "|             test Erreur 9 x 9             |"
to_print "============================================="

# TODO

to_print "============================================="
to_print "|             test OK 9 x 9                 |"
to_print "============================================="

to_check_exec_print ./rush-01 "2 3 3 5 3 1 3 2 5 4 2 3 2 1 4 3 4 2 2 4 2 2 1 5 3 3 3 4 2 3 2 3 3 1 3 3"
to_check_exec_print ./rush-01 "4 2 2 2 2 4 5 1 2 1 3 2 3 2 2 2 5 2 4 3 2 2 2 3 3 3 1 2 2 2 4 3 1 3 2 3"
