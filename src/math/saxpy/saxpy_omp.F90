module saxpy_omp
  implicit none
contains
  subroutine saxpy_do_omp(X,Y,a,n)
    use omp_lib
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

  ! FIND OPENMP ARRAY SYNTAX
  subroutine saxpy_array_syntax_omp(X,Y,a,n)
    real, intent(IN) :: X(n), a
    real, intent(INOUT) :: Y(n)
    integer, intent(IN) :: n
    integer :: i
    Y = a*X + Y
  end subroutine saxpy_array_syntax_omp

end module saxpy_omp
