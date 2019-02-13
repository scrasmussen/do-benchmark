module matrix_product
implicit none
contains
  function mat_vec_product_do(A,x,n,m)
    real, intent(IN) :: A(n,m), x(m)
    real :: b(m), mat_vec_product_do(m)
    integer, intent(IN) :: n,m
    integer :: i,j
    do j=1,m
       do i=1,n
          b(j) = b(j) + A(i,j) * x(i)
       end do
    end do
    mat_vec_product_do=b
  end function mat_vec_product_do

  function mat_vec_product_do_concurrent(A,x,n,m)
    implicit none
    real, intent(IN) :: A(n,m), x(m)
    real :: b(m), mat_vec_product_do_concurrent(m)
    integer, intent(IN) :: n,m
    integer :: i,j
    do concurrent (j=1:m)
       do i=1,n
          b(j) = b(j) + A(i,j) * x(i)
       end do
    end do
    mat_vec_product_do_concurrent=b
  end function mat_vec_product_do_concurrent

  function mat_vec_product_omp(A,x,n,m)
    use omp_lib
    implicit none
    real, intent(IN) :: A(n,m), x(m)
    real :: b(m), mat_vec_product_omp(m)
    integer, intent(IN) :: n,m
    integer :: i,j
!$OMP PARALLEL DO
    do j=1,m
       do i=1,n
          b(j) = b(j) + A(i,j) * x(i)
       end do
    end do
    mat_vec_product_omp=b
!$OMP END PARALLEL DO
  end function mat_vec_product_omp


  function mat_mat_product_do(A,B,n,k,m)
    real, intent(IN) :: A(n,k), B(k,m)
    real :: mat_mat_product_do(n,m), C(n,m), sum
    integer, intent(IN) :: n,k,m
    integer :: i,j,z
    do j=1,m
       do i=1,n
          sum = 0
          do z=1,k
             sum = sum + A(i,z) * B(z,j)
          end do
          C(i,j) = sum
       end do
    end do
    mat_mat_product_do=C
  end function mat_mat_product_do

  ! function mat_mat_product_do_concurrent
  ! end function mat_mat_product_do_concurrent

  ! function mat_mat_product_omp
  ! end function mat_mat_product_omp
end module matrix_product
