module matrix_product
implicit none
contains
  function mat_vec_product_do(A,x,n,m) result(b)
    real, intent(IN) :: A(n,m), x(m)
    real :: b(m)
    integer, intent(IN) :: n,m
    integer :: i,j
    do j=1,m
       do i=1,n
          b(j) = b(j) + A(i,j) * x(i)
       end do
    end do
  end function mat_vec_product_do

  function mat_vec_product_do_concurrent(A,x,n,m) result(b)
    real, intent(IN) :: A(n,m), x(m)
    real :: b(m)
    integer, intent(IN) :: n,m
    integer :: i,j
    do concurrent (j=1:m)
       do i=1,n
          b(j) = b(j) + A(i,j) * x(i)
       end do
    end do
  end function mat_vec_product_do_concurrent

  function mat_vec_product_omp(A,x,n,m) result(b)
    use omp_lib
    real, intent(IN) :: A(n,m), x(m)
    real :: b(m)
    integer, intent(IN) :: n,m
    integer :: i,j
!$omp parallel do
    do j=1,m
       do i=1,n
          b(j) = b(j) + A(i,j) * x(i)
       end do
    end do
!$omp end parallel do
  end function mat_vec_product_omp


  function mat_mat_product_do(A,B,n,k,m) result(C)
    real, intent(IN) :: A(n,k), B(k,m)
    real :: C(n,m), sum
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
  end function mat_mat_product_do

  function mat_mat_product_do_concurrent(A,B,n,k,m) result(C)
    real, intent(IN) :: A(n,k), B(k,m)
    real :: C(n,m), sum
    integer, intent(IN) :: n,k,m
    integer :: i,j,z
    do concurrent (j=1:m)
       do concurrent (i=1:n)
          sum = 0
          do z=1,k
             sum = sum + A(i,z) * B(z,j)
          end do
          C(i,j) = sum
       end do
    end do
  end function mat_mat_product_do_concurrent

  function mat_mat_product_do_omp(A,B,n,k,m) result(C)
    use omp_lib
    real, intent(IN) :: A(n,k), B(k,m)
    real :: C(n,m), sum
    integer, intent(IN) :: n,k,m
    integer :: i,j,z
!$omp parallel do private(i,j,z)
    do j=1,m
       do i=1,n
          sum = 0
          do z=1,k
             sum = sum + A(i,z) * B(z,j)
          end do
          C(i,j) = sum
       end do
    end do

  end function mat_mat_product_do_omp

end module matrix_product
