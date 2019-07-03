program run_saxpy_omp
  use tools
  use saxpy
  use saxpy_omp
  use saxpy_openacc
  implicit none
  integer, parameter :: n=SETN, iter=SETLOOP
  integer :: i, count
  real, dimension(n) :: X,Y
  real :: a

  print *, "===START PROGRAM==="
  ! In Fortran 2018, not yet implemented
  ! call random_init(.true.,.true.)
  call random_seed()
  call random_number(a)

  do i=1,iter
     count = 0
     ! saxpy
     call randomNumber(X,Y)
     call clearCache(count)
     call saxpy_array_syntax_omp(X,Y,a,n)

     call randomNumber(X,Y)
     call clearCache(count)
     call saxpy_do_omp(X,Y,a,n)
  end do
  print *, "===Fin==="
end program run_saxpy_omp
