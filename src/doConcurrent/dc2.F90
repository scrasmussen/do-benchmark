program dc1
  implicit none
  integer, parameter :: n=NINPUT, m=MINPUT
  real :: A(n,m)
  integer :: i,j
  character (len=12) :: form
  logical :: report

  report = .false.
#ifdef  OUTPUT
  report = .true.
#endif

  do concurrent(i=1:n, j=1:m)
        A(i,j) = (i-1) + (j-1) * n
  end do

  if (report) then
     write(form,*) "(",n,"F5.0)"
     print form, A
  end if

end program dc1
