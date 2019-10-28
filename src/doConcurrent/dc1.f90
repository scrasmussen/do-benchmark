program dc1
  implicit none
  integer, parameter :: n=10
  real :: A(n)
  integer :: i

  do concurrent(i=1:n)
     A(i) = i
  end do

  print *, A
end program dc1
