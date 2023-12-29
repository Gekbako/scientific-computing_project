program main
   use particle
   implicit none

   real :: q,m,E(3),B(3), E_value, B_value, x_i, v_i
   real :: a(3),c(3)
   real :: dt
   integer :: time, iostatus,i
   logical :: input_validation=.TRUE.
   character(30), dimension(6) :: values
   dt = 1e-10 !timestep

   ! ask user for the time of the measurement (ask for integer, number of nanoseconds)
   write(*,'(A)') 'Please provide the time of the measurment in nanoseconds as an integer:'

   ! this checks if the user gave valid input and asks for new if it is not right
   do while (input_validation)
      read(*,*,iostat=iostatus) time

      if (iostatus /= 0) then
         write(*,'(A)') 'Invalid input. Please enter an integer.'
      else
         input_validation=.FALSE.
      end if
   end do

   ! reading the values of E,Bm,g,x_initial,v_initial from the file
   open(unit=10,file='data.dat',status='old', action='read')
   do i=1,6
      read(10,'(A)') values(i)
   end do

   close(unit=10)

   ! change strings to real numbers
   read(values(1)(5:),*) E_value
   read(values(2)(5:),*) B_value
   read(values(3)(5:),*) m
   read(values(4)(5:),*) q
   read(values(5)(5:),*) x_i
   read(values(6)(5:),*) v_i
   
   ! previous update
   a = [1.,0.,0.]
   b = [0.,0.,1.]
   !function calls
   print *, cProd(b,a)

end program main

