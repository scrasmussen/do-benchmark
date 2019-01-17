program doconcurrent_1
  integer :: i,n
  n = 4
  do concurrent (i=1:n)
     print *, "i = ", i
  end do

  print *, "Fin"
end program doconcurrent_1
