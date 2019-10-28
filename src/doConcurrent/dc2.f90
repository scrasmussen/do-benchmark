program dc1
  implicit none
  integer, parameter :: n=4, m=4
  real :: A(n,m)
  integer :: i,j

  ! do concurrent(i=1:n, j=1:m)
  !    A(i,j) = i * n + j
  ! end do

  do j=1,m
     do i=1,n
        A(i,j) = i * n + j
        A(i,j) = -1
     end do
  end do

  ! print "(F4.1)", A
  print *, A
end program dc1
