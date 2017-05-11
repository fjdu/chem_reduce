FC=gfortran
SOURCE=rate06_reduce_20120328

reduce: $(SOURCE).o
	$(FC) -o reduce -lm $(SOURCE).o common.o analyse_reduce.o subroutines_share_triv.o opkd*.o

$(SOURCE).o: $(SOURCE).f90 common.o analyse_reduce.o subroutines_share_triv.o opkd*.o
	$(FC) -c $(SOURCE).f90

common.o: common.f90
	$(FC) -c common.f90

analyse_reduce.o: analyse_reduce.f90
	$(FC) -c analyse_reduce.f90

subroutines_share_triv.o: subroutines_share_triv.f90
	$(FC) -c subroutines_share_triv.f90

opkd*.o: opkd*.f
	$(FC) -c opkd*.f

clean:
	rm *.o *.mod
