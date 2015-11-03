program cache_misses_row_wise_fortran
  implicit none
  include 'common.for'

  character(len=32) :: arg
  integer :: i, j, N
  real, dimension (:,:), allocatable :: matrix
  integer :: counti, countf, count_rate
  real :: time_spent
          
  ! Handle parameters
  if (iargc() /= 1) then
     call getarg(0, arg)
     print *, "Usage: ", trim(arg), " <problem-size>"
  else
     call getarg(1, arg)
     read( arg, '(i10)' ) N

     ! Create matrix
     allocate(matrix(N, N))

     ! Traverse matrix row-wise
     call system_clock(counti,count_rate)
     print *, "Starting to traverse ", trim(arg), "x", trim(arg), " matrix row-wise"
     call srand(seed)
     do i = 1, N
        do j = 1, N
           matrix(i,j) = rand() * RANGE_MAX
        end do
     end do
     call system_clock(countf)
     time_spent = REAL(countf-counti)/REAL(count_rate)
     print *, "Time spent: ", time_spent

     ! Free memmory
     deallocate(matrix)
  end if
 
end program cache_misses_row_wise_fortran
