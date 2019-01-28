subroutine saxpy_do_concurrent(X,Y,a,n)
  implicit none
  real, intent(IN) :: X(n), a
  real, intent(INOUT) :: Y(n)
  integer, intent(IN) :: n
  integer :: i
  do concurrent (i=1:n)
     Y(i) = a*X(i) + Y(i)
  end do
end subroutine saxpy_do_concurrent

subroutine saxpy_do_omp(X,Y,a,n)
  implicit none
  real, intent(IN) :: X(n), a
  real, intent(INOUT) :: Y(n)
  integer, intent(IN) :: n
  integer :: i

  do i=1,n
     Y(i) = a*X(i) + Y(i)
  end do
end subroutine saxpy_do_omp

subroutine saxpy_do(X,Y,a,n)
  implicit none
  real, intent(IN) :: X(n), a
  real, intent(INOUT) :: Y(n)
  integer, intent(IN) :: n
  integer :: i
  do i=1,n
     Y(i) = a*X(i) + Y(i)
  end do
end subroutine saxpy_do


subroutine saxpy(X,Y,a,n)
  implicit none
  real, intent(IN) :: X(n), a
  real, intent(INOUT) :: Y(n)
  integer, intent(IN) :: n
  integer :: i
  Y = a*X + Y
end subroutine saxpy

program run_saxpy
  implicit none
  integer, parameter :: N=400000, RUN=1000
  integer :: i
  real, dimension(N) :: X,Y
  real :: a

  ! In Fortran 2018, not yet implemented
  ! call random_init(.true.,.true.)
  call random_seed()
  call random_number(a)


  do i=1,RUN
     call random_number(X)
     call random_number(Y)
     call saxpy(X,Y,a,n)

     call random_number(X)
     call random_number(Y)
     call saxpy_do(X,Y,a,n)

     call random_number(X)
     call random_number(Y)
     call saxpy_do_concurrent(X,Y,a,n)
  end do

  print *, "Fin"
end program run_saxpy
