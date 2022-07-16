# correction_rush01
pour les tests de fonctionnalites:
	./test.sh (^C au bout de 30 secondes)
	cat -e ./result.txt

pour les tests de fuites memoire (sous linux)
	./test_valgrind.sh (^C au bout de 30 secondes)
	cat result.txt | grep "alloc"
		si + d'alloc que de free alors le programme leaks
		(ne pas compter les dernierre ligne qui concerne
		le programme interompue par ^C)

pour les test d'opti:
	./test.sh (^C au bout de 5 minutes)
	cat -e ./result.txt
		si tous les tests sont ok alors on ajoute des points
		bonus en fonction des grille reussi
		si le test fini avant les 5 minutes et que tous est OK GG

NOTA: l'implementation des bonus varie d'un groupe a l'autre,
	le present testeur peut ne pas convenir et il faudra peut
	etre faire les tests a la main
