program dc1
  implicit none
  integer, parameter :: n=NINPUT
  real :: A(n)
  integer :: i
  character (len=12) :: form
  logical :: report

  report = .false.
#ifdef  OUTPUT
  report = .true.
#endif

  do concurrent(i=1:n)
        A(i) = (i-1)
  end do

  if (report) then
     write(form,*) "(",n,"F5.0)"
     print form, A
  end if

end program dc1
