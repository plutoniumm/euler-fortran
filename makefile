dev:
	rm a.out
	echo "Cleaned!"

	gfortran ./add.f90
	echo "Compiled!"

	./a.out
	echo "Executed!"