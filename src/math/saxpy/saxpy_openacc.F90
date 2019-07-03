module saxpy_openacc
  implicit none
contains
  subroutine saxpy_array_syntax_openacc(X,Y,a,n)
    real, intent(IN) :: X(n), a
    real, intent(INOUT) :: Y(n)
    integer, intent(IN) :: n
    integer :: i
    Y = a*X + Y
  end subroutine saxpy_array_syntax_openacc

  subroutine saxpy_do_openacc(X,Y,a,n)
    real, intent(IN) :: X(n), a
    real, intent(INOUT) :: Y(n)
    integer, intent(IN) :: n
    integer :: i
    do i=1,n
       Y(i) = a*X(i) + Y(i)
    end do
  end subroutine saxpy_do_openacc

  subroutine saxpy_do_concurrent_openacc(X,Y,a,n)
    real, intent(IN) :: X(n), a
    real, intent(INOUT) :: Y(n)
    integer, intent(IN) :: n
    integer :: i
    do concurrent (i=1:n)
       Y(i) = a*X(i) + Y(i)
    end do
  end subroutine saxpy_do_concurrent_openacc
end module saxpy_openacc
