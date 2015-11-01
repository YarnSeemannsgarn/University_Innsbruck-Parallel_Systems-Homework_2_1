program cache_misses_column_wise_fortran
  implicit none
  include 'common.for'

  character(len=32) :: arg
  integer :: i, j, N
  real, dimension (:,:), allocatable :: matrix

          
  ! Handle parameters
  if (iargc() /= 1) then
     call getarg(0, arg)
     print *, "Usage: ", trim(arg), " <problem-size>"
  else
     call getarg(1, arg)
     read( arg, '(i10)' ) N

     ! Create matrix
     allocate(matrix(N, N))

     ! Traverse matrix column-wise
     print *, "Starting to traverse ", trim(arg), "x", trim(arg), " matrix column-wise"
     call srand(seed)
     do i = 1, N
        do j = 1, N
           matrix(j,i) = rand() * RANGE_MAX
        end do
     end do
     print *, "Done"

     ! Free memmory
     deallocate(matrix)
  end if
 
end program cache_misses_column_wise_fortran
