module tools
  implicit none
contains
  subroutine clearCache(count)
    integer, intent(INOUT) :: count
    real, allocatable :: A(:)
    ! https://stackoverflow.com/questions/23689722/how-to-clear-l1-l2-and-l3-caches
    integer, parameter :: cacheSize=5000000 ! Cache is 20 MB SmartCache
    integer :: i
    count = count + 1
    allocate(A(cacheSize+1))
    do i=1,cacheSize
       A(i)=count
    end do
    deallocate(A)
  end subroutine clearCache
end module tools
