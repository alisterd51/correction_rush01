#!/bin/zsh

rm -f result.txt
touch result.txt

echo "=============================================" &>> result.txt
echo "|             auteurs                       |" &>> result.txt
echo "=============================================" &>> result.txt

grep -rF "by" . | grep -v "./test.sh" &>> result.txt
git log  --all | grep "Author:" &>> result.txt

echo "=============================================" &>> result.txt
echo "|             logs                          |" &>> result.txt
echo "=============================================" &>> result.txt

git log --all --oneline &>> result.txt

echo "=============================================" &>> result.txt
echo "|             norminette                    |" &>> result.txt
echo "=============================================" &>> result.txt

norminette &>> result.txt

echo "=============================================" &>> result.txt
echo "|             compilation                   |" &>> result.txt
echo "=============================================" &>> result.txt

cc -Wall -Wextra -Werror -g3 -fsanitize=undefined -fsanitize=address *.c -o rush-01 &>> result.txt
cc -Wall -Wextra -Werror -g3 -fsanitize=leak -fsanitize=undefined -fsanitize=address *.c -o rush-01 &>> result.txt

echo "=============================================" &>> result.txt
echo "|             fonctions utilise             |" &>> result.txt
echo "=============================================" &>> result.txt

nm -u rush-01 &>> result.txt

echo "=============================================" &>> result.txt
echo "|             test Error                    |" &>> result.txt
echo "=============================================" &>> result.txt

echo "./rush-01" &>> result.txt
./rush-01 &>> result.txt
echo "./rush-01 \"4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2\" \"4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2\"" &>> result.txt
./rush-01 "4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2" "4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2" &>> result.txt
echo "./rush-01 \"\"" &>> result.txt
./rush-01 "" &>> result.txt
echo "./rush-01 \"4 3 2 1 1 2 2 2 4 d 2 1 1 2 2 2\"" &>> result.txt
./rush-01 "4 3 2 1 1 2 2 2 4 d 2 1 1 2 2 2" &>> result.txt
echo "./rush-01 \"4 3 2 0 1 2 2 2 4 3 2 1 1 2 2 2\"" &>> result.txt
./rush-01 "4 3 2 0 1 2 2 2 4 3 2 1 1 2 2 2" &>> result.txt
echo "./rush-01 \"-4 -3 -2 -1 -1 -2 -2 -2 -4 -3 -2 -1 -1 -2 -2 -2\"" &>> result.txt
./rush-01 "-4 -3 -2 -1 -1 -2 -2 -2 -4 -3 -2 -1 -1 -2 -2 -2" &>> result.txt
echo "./rush-01 \" 4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2\"" &>> result.txt
./rush-01 " 4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2" &>> result.txt
echo "./rush-01 \"4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2 \"" &>> result.txt
./rush-01 "4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2 " &>> result.txt
echo "./rush-01 \"3321123333211233               \"" &>> result.txt
./rush-01 "3321123333211233               " &>> result.txt
echo "./rush-01 \"3321123333211233\"" &>> result.txt
./rush-01 "3321123333211233" &>> result.txt
echo "./rush-01 \" 4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 \"" &>> result.txt
./rush-01 " 4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 " &>> result.txt
echo "./rush-01 \"4 3 2 1  1 2 2 2 4 3 2 1 1 2 2 2\"" &>> result.txt
./rush-01 "4 3 2 1  1 2 2 2 4 3 2 1 1 2 2 2" &>> result.txt
echo "./rush-01 \"2 1 2 4 224 2 1 2 1 3 2 3 3 2 1\"" &>> result.txt
./rush-01 "2 1 2 4 224 2 1 2 1 3 2 3 3 2 1" &>> result.txt
echo "./rush-01 \"2 1 2 4 2	4 2 1 2 1 3 2 3 3 2 1\"" &>> result.txt
./rush-01 "2 1 2 4 2	4 2 1 2 1 3 2 3 3 2 1" &>> result.txt
echo "./rush-01 \"                               \"" &>> result.txt
./rush-01 "                               " &>> result.txt
echo "./rush-01 \"1111111111111111111111111111111\"" &>> result.txt
./rush-01 "1111111111111111111111111111111" &>> result.txt
echo "./rush-01 \"4 2 1 1 2 2 24 3 3 2 1 1 2 2 2 2\"" &>> result.txt
./rush-01 "4 2 1 1 2 2 24 3 3 2 1 1 2 2 2 2" &>> result.txt
echo "./rush-01 \"4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2 2\"" &>> result.txt
./rush-01 "4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2 2" &>> result.txt
echo "./rush-01 \"4 3 2 1 1 2 2 2 4 3 2 2 2 2\"" &>> result.txt
./rush-01 "4 3 2 1 1 2 2 2 4 3 2 2 2 2" &>> result.txt
echo "./rush-01 \"4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4\"" &>> result.txt
./rush-01 "4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4" &>> result.txt
echo "./rush-01 \"2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2\"" &>> result.txt
./rush-01 "2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2" &>> result.txt
echo "./rush-01 \"3 1 2 2 2 3 3 1 2 3 1 2 2 1 3 2\"" &>> result.txt
./rush-01 "3 1 2 2 2 3 3 1 2 3 1 2 2 1 3 2" &>> result.txt
echo "./rush-01 \"1 4 2 2 3 2 1 2 1 3 2 2 3 1 2 2\"" &>> result.txt
./rush-01 "1 4 2 2 3 2 1 2 1 3 2 2 3 1 2 2" &>> result.txt
echo "./rush-01 \"4 3 2 1 1	2 2 2 4 3 2 1 1 2 2 2\"" &>> result.txt
./rush-01 "4 3 2 1 1	2 2 2 4 3 2 1 1 2 2 2" &>> result.txt

echo "=============================================" &>> result.txt
echo "|             test OK                       |" &>> result.txt
echo "=============================================" &>> result.txt

echo "./rush-01 \"1 2 2 3 3 2 2 1 1 3 2 3 4 2 2 1\"" &>> result.txt
./rush-01 "1 2 2 3 3 2 2 1 1 3 2 3 4 2 2 1" &>> result.txt
echo "./rush-01 \"1 2 3 2 3 1 2 2 1 4 2 2 4 1 2 2\"" &>> result.txt
./rush-01 "1 2 3 2 3 1 2 2 1 4 2 2 4 1 2 2" &>> result.txt
echo "./rush-01 \"1 3 3 2 4 1 2 2 1 2 3 2 2 1 2 3\"" &>> result.txt
./rush-01 "1 3 3 2 4 1 2 2 1 2 3 2 2 1 2 3" &>> result.txt
echo "./rush-01 \"1 4 2 2 4 1 2 2 1 2 3 2 2 1 2 3\"" &>> result.txt
./rush-01 "1 4 2 2 4 1 2 2 1 2 3 2 2 1 2 3" &>> result.txt
echo "./rush-01 \"2 3 1 2 2 1 3 2 3 1 3 2 2 4 1 2\"" &>> result.txt
./rush-01 "2 3 1 2 2 1 3 2 3 1 3 2 2 4 1 2" &>> result.txt
echo "./rush-01 \"2 1 2 3 2 3 2 1 2 3 1 2 3 2 3 1\"" &>> result.txt
./rush-01 "2 1 2 3 2 3 2 1 2 3 1 2 3 2 3 1" &>> result.txt
echo "./rush-01 \"2 1 2 4 2 4 2 1 2 1 3 2 3 3 2 1\"" &>> result.txt
./rush-01 "2 1 2 4 2 4 2 1 2 1 3 2 3 3 2 1" &>> result.txt
echo "./rush-01 \"2 4 1 2 2 1 3 3 2 4 1 2 2 1 3 3\"" &>> result.txt
./rush-01 "2 4 1 2 2 1 3 3 2 4 1 2 2 1 3 3" &>> result.txt
echo "./rush-01 \"2 2 1 3 2 3 2 1 2 2 1 3 2 2 3 1\"" &>> result.txt
./rush-01 "2 2 1 3 2 3 2 1 2 2 1 3 2 2 3 1" &>> result.txt
echo "./rush-01 \"2 3 2 1 3 1 2 2 3 1 2 2 1 3 2 2\"" &>> result.txt
./rush-01 "2 3 2 1 3 1 2 2 3 1 2 2 1 3 2 2" &>> result.txt
echo "./rush-01 \"2 2 2 1 2 1 3 4 3 3 1 2 1 2 3 3\"" &>> result.txt
./rush-01 "2 2 2 1 2 1 3 4 3 3 1 2 1 2 3 3" &>> result.txt
echo "./rush-01 \"2 4 2 1 2 1 2 4 2 1 3 2 1 2 2 3\"" &>> result.txt
./rush-01 "2 4 2 1 2 1 2 4 2 1 3 2 1 2 2 3" &>> result.txt
echo "./rush-01 \"2 2 1 3 3 2 2 1 3 1 2 4 2 2 2 1\"" &>> result.txt
./rush-01 "2 2 1 3 3 2 2 1 3 1 2 4 2 2 2 1" &>> result.txt
echo "./rush-01 \"3 2 1 2 1 2 3 2 3 2 2 1 2 1 3 3\"" &>> result.txt
./rush-01 "3 2 1 2 1 2 3 2 3 2 2 1 2 1 3 3" &>> result.txt
echo "./rush-01 \"3 1 2 3 2 2 3 1 2 2 1 3 3 2 2 1\"" &>> result.txt
./rush-01 "3 1 2 3 2 2 3 1 2 2 1 3 3 2 2 1" &>> result.txt
echo "./rush-01 \"3 2 2 1 2 2 1 3 4 2 1 3 1 2 2 2\"" &>> result.txt
./rush-01 "3 2 2 1 2 2 1 3 4 2 1 3 1 2 2 2" &>> result.txt
echo "./rush-01 \"3 1 2 2 2 3 2 1 2 2 1 4 2 2 4 1\"" &>> result.txt
./rush-01 "3 1 2 2 2 3 2 1 2 2 1 4 2 2 4 1" &>> result.txt
echo "./rush-01 \"3 1 3 2 2 4 1 2 2 3 1 2 2 1 3 2\"" &>> result.txt
./rush-01 "3 1 3 2 2 4 1 2 2 3 1 2 2 1 3 2" &>> result.txt
echo "./rush-01 \"4 2 1 2 1 2 3 3 3 3 2 1 2 1 2 4\"" &>> result.txt
./rush-01 "4 2 1 2 1 2 3 3 3 3 2 1 2 1 2 4" &>> result.txt
echo "./rush-01 \"4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2\"" &>> result.txt
./rush-01 "4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2" &>> result.txt

echo "=============================================" &>> result.txt
echo "|             Partie bonus                  |" &>> result.txt
echo "=============================================" &>> result.txt

echo "=============================================" &>> result.txt
echo "|             test Erreur 1 x 1             |" &>> result.txt
echo "=============================================" &>> result.txt

echo "./rush-01 \"1 1 1 1 1\"" &>> result.txt
./rush-01 "1 1 1 1 1" &>> result.txt
echo "./rush-01 \"1 1 1\"" &>> result.txt
./rush-01 "1 1 1" &>> result.txt
echo "./rush-01 \"1 1 1 1 \"" &>> result.txt
./rush-01 "1 1 1 1 " &>> result.txt
echo "./rush-01 \" 1 1 1 1\"" &>> result.txt
./rush-01 " 1 1 1 1" &>> result.txt
echo "./rush-01 \" 1 1 1 1 \"" &>> result.txt
./rush-01 " 1 1 1 1 " &>> result.txt
echo "./rush-01 \"1111111\"" &>> result.txt
./rush-01 "1111111" &>> result.txt
echo "./rush-01 \"       \"" &>> result.txt
./rush-01 "       " &>> result.txt
echo "./rush-01 \"1 111 1\"" &>> result.txt
./rush-01 "1 111 1" &>> result.txt
echo "./rush-01 \"1 1	1 1\"" &>> result.txt
./rush-01 "1 1	1 1" &>> result.txt
echo "./rush-01 \"1 a 1 1\"" &>> result.txt
./rush-01 "1 a 1 1" &>> result.txt
echo "./rush-01 \"1 2 1 1\"" &>> result.txt
./rush-01 "1 2 1 1" &>> result.txt

echo "=============================================" &>> result.txt
echo "|             test OK 1 x 1                 |" &>> result.txt
echo "=============================================" &>> result.txt

echo "./rush-01 \"1 1 1 1\"" &>> result.txt
./rush-01 "1 1 1 1" &>> result.txt

echo "=============================================" &>> result.txt
echo "|             test Erreur 2 x 2             |" &>> result.txt
echo "=============================================" &>> result.txt

echo "./rush-01 \"2 1 1 2 2 1 1 2 1\"" &>> result.txt
./rush-01 "2 1 1 2 2 1 1 2 1" &>> result.txt
echo "./rush-01 \"2 1 1 2 2 1 1\"" &>> result.txt
./rush-01 "2 1 1 2 2 1 1" &>> result.txt
echo "./rush-01 \"2 1 1 2 2 1 1 2 \"" &>> result.txt
./rush-01 "2 1 1 2 2 1 1 2 " &>> result.txt
echo "./rush-01 \" 2 1 1 2 2 1 1 2\"" &>> result.txt
./rush-01 " 2 1 1 2 2 1 1 2" &>> result.txt
echo "./rush-01 \" 2 1 1 2 2 1 1 2 \"" &>> result.txt
./rush-01 " 2 1 1 2 2 1 1 2 " &>> result.txt
echo "./rush-01 \"221111222211112\"" &>> result.txt
./rush-01 "221111222211112" &>> result.txt
echo "./rush-01 \"               \"" &>> result.txt
./rush-01 "               " &>> result.txt
echo "./rush-01 \"2 1 1 212 1 1 2\"" &>> result.txt
./rush-01 "2 1 1 212 1 1 2" &>> result.txt
echo "./rush-01 \"2 1 1 2	2 1 1 2\"" &>> result.txt
./rush-01 "2 1 1 2	2 1 1 2" &>> result.txt
echo "./rush-01 \"2 1 a 2 2 1 1 2\"" &>> result.txt
./rush-01 "2 1 a 2 2 1 1 2" &>> result.txt
echo "./rush-01 \"2 1 3 2 2 1 1 2\"" &>> result.txt
./rush-01 "2 1 3 2 2 1 1 2" &>> result.txt
echo "./rush-01 \"2 1 2 1 2 1 1 2\"" &>> result.txt
./rush-01 "2 1 2 1 2 1 1 2" &>> result.txt

echo "=============================================" &>> result.txt
echo "|             test OK 2 x 2                 |" &>> result.txt
echo "=============================================" &>> result.txt

echo "./rush-01 \"2 1 1 2 2 1 1 2\"" &>> result.txt
./rush-01 "2 1 1 2 2 1 1 2" &>> result.txt
echo "./rush-01 \"1 2 2 1 1 2 2 1\"" &>> result.txt
./rush-01 "1 2 2 1 1 2 2 1" &>> result.txt

echo "=============================================" &>> result.txt
echo "|             test Erreur 3 x 3             |" &>> result.txt
echo "=============================================" &>> result.txt

echo "./rush-01 \"2 2 1 2 1 3 3 1 2 1 2 2 1\"" &>> result.txt
./rush-01 "2 2 1 2 1 3 3 1 2 1 2 2 1" &>> result.txt
echo "./rush-01 \"2 2 1 2 1 3 3 1 2 1 2\"" &>> result.txt
./rush-01 "2 2 1 2 1 3 3 1 2 1 2" &>> result.txt
echo "./rush-01 \"2 2 1 2 1 3 3 1 2 1 2 2 \"" &>> result.txt
./rush-01 "2 2 1 2 1 3 3 1 2 1 2 2 " &>> result.txt
echo "./rush-01 \" 2 2 1 2 1 3 3 1 2 1 2 2\"" &>> result.txt
./rush-01 " 2 2 1 2 1 3 3 1 2 1 2 2" &>> result.txt
echo "./rush-01 \" 2 2 1 2 1 3 3 1 2 1 2 2 \"" &>> result.txt
./rush-01 " 2 2 1 2 1 3 3 1 2 1 2 2 " &>> result.txt
echo "./rush-01 \"22221122113333112211222\"" &>> result.txt
./rush-01 "22221122113333112211222" &>> result.txt
echo "./rush-01 \"                       \"" &>> result.txt
./rush-01 "                       " &>> result.txt
echo "./rush-01 \"2 2 1 211 3 3 1 2 1 2 2\"" &>> result.txt
./rush-01 "2 2 1 211 3 3 1 2 1 2 2" &>> result.txt
echo "./rush-01 \"2 2 1 2 1 3 3	1 2 1 2 2\"" &>> result.txt
./rush-01 "2 2 1 2 1 3 3	1 2 1 2 2" &>> result.txt
echo "./rush-01 \"2 2 1 2 a 3 3 1 2 1 2 2\"" &>> result.txt
./rush-01 "2 2 1 2 a 3 3 1 2 1 2 2" &>> result.txt
echo "./rush-01 \"2 2 1 2 1 3 3 1 4 1 2 2\"" &>> result.txt
./rush-01 "2 2 1 2 1 3 3 1 4 1 2 2" &>> result.txt
echo "./rush-01 \"2 2 1 2 1 2 3 1 2 1 2 2\"" &>> result.txt
./rush-01 "2 2 1 2 1 2 3 1 2 1 2 2" &>> result.txt


echo "=============================================" &>> result.txt
echo "|             test OK 3 x 3                 |" &>> result.txt
echo "=============================================" &>> result.txt

echo "./rush-01 \"2 2 1 2 1 3 3 1 2 1 2 2\"" &>> result.txt
./rush-01 "2 2 1 2 1 3 3 1 2 1 2 2" &>> result.txt
echo "./rush-01 \"1 2 2 3 1 2 1 2 2 3 1 2\"" &>> result.txt
./rush-01 "1 2 2 3 1 2 1 2 2 3 1 2" &>> result.txt
echo "./rush-01 \"3 1 2 1 2 2 2 2 1 2 1 3\"" &>> result.txt
./rush-01 "3 1 2 1 2 2 2 2 1 2 1 3" &>> result.txt
echo "./rush-01 \"2 1 3 2 2 1 2 1 3 2 2 1\"" &>> result.txt
./rush-01 "2 1 3 2 2 1 2 1 3 2 2 1" &>> result.txt
echo "./rush-01 \"2 3 1 2 1 2 2 1 2 1 3 2\"" &>> result.txt
./rush-01 "2 3 1 2 1 2 2 1 2 1 3 2" &>> result.txt
echo "./rush-01 \"1 3 2 2 1 2 1 3 2 2 1 2\"" &>> result.txt
./rush-01 "1 3 2 2 1 2 1 3 2 2 1 2" &>> result.txt
echo "./rush-01 \"2 1 2 1 3 2 2 3 1 2 1 2\"" &>> result.txt
./rush-01 "2 1 2 1 3 2 2 3 1 2 1 2" &>> result.txt
echo "./rush-01 \"2 1 2 2 3 1 2 1 2 2 3 1\"" &>> result.txt
./rush-01 "2 1 2 2 3 1 2 1 2 2 3 1" &>> result.txt
echo "./rush-01 \"1 2 2 3 2 1 1 2 3 2 2 1\"" &>> result.txt
./rush-01 "1 2 2 3 2 1 1 2 3 2 2 1" &>> result.txt
echo "./rush-01 \"3 2 1 1 2 2 3 2 1 1 2 2\"" &>> result.txt
./rush-01 "3 2 1 1 2 2 3 2 1 1 2 2" &>> result.txt
echo "./rush-01 \"1 2 3 2 2 1 1 2 2 3 2 1\"" &>> result.txt
./rush-01 "1 2 3 2 2 1 1 2 2 3 2 1" &>> result.txt
echo "./rush-01 \"2 2 1 1 2 3 2 2 1 1 2 3\"" &>> result.txt
./rush-01 "2 2 1 1 2 3 2 2 1 1 2 3" &>> result.txt

echo "=============================================" &>> result.txt
echo "|             test Erreur 5 x 5             |" &>> result.txt
echo "=============================================" &>> result.txt

# a faire

echo "=============================================" &>> result.txt
echo "|             test OK 5 x 5                 |" &>> result.txt
echo "=============================================" &>> result.txt

echo "./rush-01 \"3 2 1 2 4 2 4 4 2 1 3 2 3 1 2 3 4 2 2 1\"" &>> result.txt
./rush-01 "3 2 1 2 4 2 4 4 2 1 3 2 3 1 2 3 4 2 2 1" &>> result.txt
echo "./rush-01 \"5 2 1 3 2 1 4 2 2 2 3 2 3 2 1 2 3 2 1 3\"" &>> result.txt
./rush-01 "5 2 1 3 2 1 4 2 2 2 3 2 3 2 1 2 3 2 1 3" &>> result.txt
echo "./rush-01 \"2 1 2 3 3 2 4 2 3 1 2 2 3 1 2 4 2 2 3 1\"" &>> result.txt
./rush-01 "2 1 2 3 3 2 4 2 3 1 2 2 3 1 2 4 2 2 3 1" &>> result.txt
echo "./rush-01 \"3 2 3 1 2 2 1 2 5 3 3 3 1 3 2 2 1 4 2 2\"" &>> result.txt
./rush-01 "3 2 3 1 2 2 1 2 5 3 3 3 1 3 2 2 1 4 2 2" &>> result.txt
echo "./rush-01 \"2 5 2 1 2 2 1 2 3 4 2 3 1 3 2 2 1 2 2 4\"" &>> result.txt
./rush-01 "2 5 2 1 2 2 1 2 3 4 2 3 1 3 2 2 1 2 2 4" &>> result.txt

echo "=============================================" &>> result.txt
echo "|             test Erreur 6 x 6             |" &>> result.txt
echo "=============================================" &>> result.txt

# a faire

echo "=============================================" &>> result.txt
echo "|             test OK 6 x 6                 |" &>> result.txt
echo "=============================================" &>> result.txt

echo "./rush-01 \"4 4 2 2 1 3 1 2 3 3 4 2 3 4 3 2 2 1 2 2 3 3 1 5\"" &>> result.txt
./rush-01 "4 4 2 2 1 3 1 2 3 3 4 2 3 4 3 2 2 1 2 2 3 3 1 5" &>> result.txt
echo "./rush-01 \"4 3 2 2 1 4 1 2 4 4 3 2 4 3 2 4 2 1 2 2 2 1 3 2\"" &>> result.txt
./rush-01 "4 3 2 2 1 4 1 2 4 4 3 2 4 3 2 4 2 1 2 2 2 1 3 2" &>> result.txt
echo "./rush-01 \"4 1 3 2 2 3 2 3 2 1 4 3 2 3 3 1 3 2 3 2 1 5 2 2\"" &>> result.txt
./rush-01 "4 1 3 2 2 3 2 3 2 1 4 3 2 3 3 1 3 2 3 2 1 5 2 2" &>> result.txt
echo "./rush-01 \"3 3 3 2 1 2 2 4 2 3 4 1 3 4 2 1 3 2 2 3 3 3 4 1\"" &>> result.txt
./rush-01 "3 3 3 2 1 2 2 4 2 3 4 1 3 4 2 1 3 2 2 3 3 3 4 1" &>> result.txt
echo "./rush-01 \"3 2 2 2 1 3 1 2 3 3 3 2 3 3 3 2 4 1 2 2 2 3 1 4\"" &>> result.txt
./rush-01 "3 2 2 2 1 3 1 2 3 3 3 2 3 3 3 2 4 1 2 2 2 3 1 4" &>> result.txt

echo "=============================================" &>> result.txt
echo "|             test Erreur 7 x 7             |" &>> result.txt
echo "=============================================" &>> result.txt

# a faire

echo "=============================================" &>> result.txt
echo "|             test OK 7 x 7                 |" &>> result.txt
echo "=============================================" &>> result.txt

echo "./rush-01 \"4 6 2 1 4 3 2 1 2 2 4 2 3 5 3 7 5 4 3 2 1 2 1 2 2 3 3 5\"" &>> result.txt
./rush-01 "4 6 2 1 4 3 2 1 2 2 4 2 3 5 3 7 5 4 3 2 1 2 1 2 2 3 3 5" &>> result.txt
echo "./rush-01 \"7 2 1 4 5 2 3 1 2 3 2 3 3 3 3 4 3 2 3 2 1 3 2 1 3 3 3 4\"" &>> result.txt
./rush-01 "7 2 1 4 5 2 3 1 2 3 2 3 3 3 3 4 3 2 3 2 1 3 2 1 3 3 3 4" &>> result.txt
echo "./rush-01 \"5 2 2 3 3 1 2 1 2 2 4 3 5 4 4 7 3 2 2 2 1 2 1 2 3 4 4 5\"" &>> result.txt
./rush-01 "5 2 2 3 3 1 2 1 2 2 4 3 5 4 4 7 3 2 2 2 1 2 1 2 3 4 4 5" &>> result.txt
echo "./rush-01 \"5 2 4 2 3 2 1 1 2 2 3 3 5 4 3 6 3 2 2 2 1 1 2 3 4 4 4 3\"" &>> result.txt
./rush-01 "5 2 4 2 3 2 1 1 2 2 3 3 5 4 3 6 3 2 2 2 1 1 2 3 4 4 4 3" &>> result.txt
echo "./rush-01 \"5 5 1 2 3 3 2 1 2 3 2 3 3 4 2 6 4 3 3 2 1 4 1 2 3 3 2 5\"" &>> result.txt
./rush-01 "5 5 1 2 3 3 2 1 2 3 2 3 3 4 2 6 4 3 3 2 1 4 1 2 3 3 2 5" &>> result.txt

echo "=============================================" &>> result.txt
echo "|             test Erreur 8 x 8             |" &>> result.txt
echo "=============================================" &>> result.txt

# a faire

echo "=============================================" &>> result.txt
echo "|             test OK 8 x 8                 |" &>> result.txt
echo "=============================================" &>> result.txt

echo "./rush-01 \"2 4 3 1 3 2 2 3 2 1 3 3 3 2 4 2 2 4 3 2 1 2 4 2 4 2 2 4 4 3 1 3\"" &>> result.txt
./rush-01 "2 4 3 1 3 2 2 3 2 1 3 3 3 2 4 2 2 4 3 2 1 2 4 2 4 2 2 4 4 3 1 3" &>> result.txt
echo "./rush-01 \"2 1 2 4 3 2 3 4 3 3 2 1 4 2 2 5 2 1 3 4 3 2 3 3 4 3 2 1 3 2 2 4\"" &>> result.txt
./rush-01 "2 1 2 4 3 2 3 4 3 3 2 1 4 2 2 5 2 1 3 4 3 2 3 3 4 3 2 1 3 2 2 4" &>> result.txt
echo "./rush-01 \"3 2 4 3 2 3 2 1 5 4 1 4 2 2 4 3 5 2 3 1 2 2 3 3 1 2 3 4 2 3 3 3\"" &>> result.txt
./rush-01 "3 2 4 3 2 3 2 1 5 4 1 4 2 2 4 3 5 2 3 1 2 2 3 3 1 2 3 4 2 3 3 3" &>> result.txt
echo "./rush-01 \"3 2 3 2 3 3 2 1 2 2 3 3 2 1 5 4 3 2 3 2 4 2 1 4 1 2 3 2 3 4 3 3\"" &>> result.txt
./rush-01 "3 2 3 2 3 3 2 1 2 2 3 3 2 1 5 4 3 2 3 2 4 2 1 4 1 2 3 2 3 4 3 3" &>> result.txt
echo "./rush-01 \"1 4 2 3 3 3 2 3 2 1 3 3 4 2 4 3 1 3 3 3 2 4 3 2 5 2 3 2 3 1 3 4\"" &>> result.txt
./rush-01 "1 4 2 3 3 3 2 3 2 1 3 3 4 2 4 3 1 3 3 3 2 4 3 2 5 2 3 2 3 1 3 4" &>> result.txt

echo "=============================================" &>> result.txt
echo "|             test Erreur 9 x 9             |" &>> result.txt
echo "=============================================" &>> result.txt

# a faire

echo "=============================================" &>> result.txt
echo "|             test OK 9 x 9                 |" &>> result.txt
echo "=============================================" &>> result.txt

echo "./rush-01 \"2 3 3 5 3 1 3 2 5 4 2 3 2 1 4 3 4 2 2 4 2 2 1 5 3 3 3 4 2 3 2 3 3 1 3 3\"" &>> result.txt
./rush-01 "2 3 3 5 3 1 3 2 5 4 2 3 2 1 4 3 4 2 2 4 2 2 1 5 3 3 3 4 2 3 2 3 3 1 3 3" &>> result.txt
echo "./rush-01 \"4 2 2 2 2 4 5 1 2 1 3 2 3 2 2 2 5 2 4 3 2 2 2 3 3 3 1 2 2 2 4 3 1 3 2 3\"" &>> result.txt
./rush-01 "4 2 2 2 2 4 5 1 2 1 3 2 3 2 2 2 5 2 4 3 2 2 2 3 3 3 1 2 2 2 4 3 1 3 2 3" &>> result.txt
