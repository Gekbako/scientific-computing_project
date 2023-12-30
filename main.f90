program main
   use particle
   implicit none

   ! define variables
   type(par) :: p
   real :: E(3),B(3),E_value, B_value
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

   ! reading the values of E, B, m, q from the file
   open(unit=10,file='data.dat',status='old', action='read')

   do i=1,4
      read(10,'(A)') values(i)
   end do

   close(unit=10)

   ! change strings to real numbers
   read(values(1)(5:),*) E_value
   read(values(2)(5:),*) B_value
   read(values(3)(5:),*) p%m
   read(values(4)(5:),*) p%q

   ! set values of initial position and initial velocity (think of reading x,v,a from the file)
   p%pos = [0.00000000001,1.0,1.0] !assuming we DONT start from origin of the coordinate system k(otherwise E=0 and no movement appears)
   p%v = [0,0,0] !assuming no initial velocity
   p%a = [0,0,0] !assuming no initial acceleration

   ! initial set E and B vectors
   E = -E_value*p%pos !we assume the E always go to the center so that E vector is always the negative of position
   B = B_value*[0,0,1]

   ! the time step 
   do i=1,time 
      call step(p,E,B)
      E = -E_value*p%pos
      if (mod(i,1000000)==0) then
         write(*,*) 'Position:',p%pos,'E:',E ! the input time must be quite large to notice change of position and E
      end if

   end do
   
end program main

