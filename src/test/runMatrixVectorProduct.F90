
program runMatVecProd
  use matrix_product
  implicit none
  integer, parameter :: n=SETN, m=n, iter=SETLOOP
  real :: A(n,m), x(m), b(m), y
  integer :: i, count
  ! x = 1
  ! A = 0.25
  ! A(1,1) = .5
  ! A(1,2) = 1
  ! A(2,2) = .1
  ! A(3,3) = .25
  ! do i=1,m
  !    x(i) = i
  ! end do
  ! print *, "-------"
  ! call test_func(mat_vec_product_omp,A,x,b,n,m)
  ! call print_matrix(A,n,m)
  ! print *, "*"
  ! call print_vector(x,m)
  ! print *, "="
  ! call print_vector(b,m)
  ! print *, "-------"
  ! print *, A
  ! print *, "FIN"
  print *, "---START PROGRAM---"
  call random_seed()
  call random_number(y)
  do i=1,iter
     count=0
     call random_number(A)
     call random_number(x)
     call clearCache(count)
     call test_func(mat_vec_product_do,A,x,b,n,m)

      call random_number(A)
     call random_number(x)
     call clearCache(count)
     call test_func(mat_vec_product_do_concurrent,A,x,b,n,m)

     call random_number(A)
     call random_number(x)
     call clearCache(count)
     call test_func(mat_vec_product_omp,A,x,b,n,m)
  end do



end program runMatVecProd

! https://stackoverflow.com/questions/32809769/how-to-pass-subroutine-names-as-arguments-in-fortran
subroutine test_func(func,A,x,b,n,m)
  implicit none
  interface
     function func(A1,x1,n1,m1)
       integer, intent(IN) :: n1, m1
       real, intent(IN):: A1(n1,m1), x1(m1)
       real :: func(m1)
     end function func
  end interface
  integer, intent(IN) :: n, m
  real, intent(IN):: A(n,m), x(m)
  real :: b(m)
  b = func(A,x,n,m)
end subroutine test_func

subroutine print_matrix(A,n,m)
  implicit none
  real, intent(IN) :: A(n,m)
  integer, intent(IN) :: n,m
  integer :: i,j
  do j=1,m
     do i=1,n
        write(*,fmt="(F5.2)",advance="no") A(i,j)
     end do
     print *
  end do
end subroutine print_matrix

subroutine print_vector(b,n)
  implicit none
  real, intent(IN) :: b(n)
  integer, intent(IN) :: n
  integer :: i
  do i=1,n
     write(*,fmt="(F5.2)",advance="no") b(i)
  end do
  print *
end subroutine print_vector
