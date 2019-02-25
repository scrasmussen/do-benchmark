program runMatVecProd
  use matrix_product
  implicit none
  integer, parameter :: n=2,k=2,m=3
  real :: A(n,k), B(k,m), C(n,m)

  A(1,1) = 1
  A(1,2) = 2
  A(2,1) = 3
  A(2,2) = 4

  B=1
  B(1,2) = 0
  B(2,1) = 0
  ! C=matmul(A,B)

  print *, "-------"
  call test_func(mat_mat_product_do_concurrent,A,B,C,n,k,m)
  call print_matrix(A,n,k)
  print *, "*"
  call print_matrix(B,k,m)
  print *, "="
  call print_matrix(C,n,m)
  print *, "----C---"
  print *, C
  print *, "FIN"
end program runMatVecProd

! https://stackoverflow.com/questions/32809769/how-to-pass-subroutine-names-as-arguments-in-fortran
subroutine test_func(func,A,B,C,n,k,m)
  implicit none
  interface
     function func(A1,B1,n1,k1,m1)
       integer, intent(IN) :: n1,k1,m1
       real, intent(IN):: A1(n1,k1), B1(k1,m1)
       real :: func(n1,m1)
     end function func
  end interface
  integer, intent(IN) :: n,k,m
  real, intent(IN)    :: A(n,k), B(k,m)
  real, intent(OUT)   :: C(n,m)
  C = func(A,B,n,k,m)
end subroutine test_func

subroutine print_matrix(A,n,m)
  implicit none
  real, intent(IN) :: A(n,m)
  integer, intent(IN) :: n,m
  integer :: i,j
  do i=1,n
     do j=1,m
        write(*,fmt="(F5.2)",advance="no") A(i,j)
     end do
     print *
  end do
end subroutine print_matrix
