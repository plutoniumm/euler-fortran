dev:
	rm a.out

	gfortran ./add.f90
	echo "Compiled!"

	./a.out