program run_saxpy
  use tools
  use saxpy
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
     call random_number(X)
     call random_number(Y)
     call clearCache(count)
     call saxpy(X,Y,a,n)

     call random_number(X)
     call random_number(Y)
     call clearCache(count)
     call saxpy_do(X,Y,a,n)

     call random_number(X)
     call random_number(Y)
     call clearCache(count)
     call saxpy_do_concurrent(X,Y,a,n)

     call random_number(X)
     call random_number(Y)
     call clearCache(count)
     call saxpy_do_omp(X,Y,a,n)
  end do
  print *, "===Fin==="
end program run_saxpy
