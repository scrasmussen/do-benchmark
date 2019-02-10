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
  use omp_lib
  implicit none
  real, intent(IN) :: X(n), a
  real, intent(INOUT) :: Y(n)
  integer, intent(IN) :: n
  integer :: i, w
  integer :: tid
!$OMP PARALLEL DO
  do i=1,n
     ! tid = omp_get_thread_num()
     ! print *, "tid =",tid
     Y(i) = a*X(i) + Y(i)
  end do
!$OMP END PARALLEL DO
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
  use tools
  implicit none
  integer, parameter :: n=SETN, RUN=SETRUN
  integer :: i, count
  real, dimension(n) :: X,Y
  real :: a

  print *, "===START PROGRAM==="
  ! In Fortran 2018, not yet implemented
  ! call random_init(.true.,.true.)
  call random_seed()
  call random_number(a)

  do i=1,RUN
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
