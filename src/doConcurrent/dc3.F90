program dc1
  implicit none
  integer, parameter :: n=NINPUT, m=MINPUT, l=LINPUT
  real :: A(n,m,l)
  integer :: i,j,k
  character (len=12) :: form
  logical :: report

  report = .false.
#ifdef  OUTPUT
  report = .true.
#endif

  do concurrent(i=1:n, j=1:m, k=1:l)
        A(i,j,k) = (i-1) + (j-1) * n + (k-1) * m * n
  end do

  if (report) then
     write(form,*) "(",n,"F5.0)"
     print form, A
  end if

end program dc1
