program main
   use particle
   implicit none

   ! define variables
   type(par) :: p
   real :: E(3),B(3),E_value, B_value,n,v(3),velocity,m_min,m_max
   real :: dt
   integer :: time, iostatus,i
   logical :: input_validation=.TRUE., right_path=.TRUE., right_mass=.TRUE.
   character(30), dimension(6) :: values
   dt = 1e-10 !timestep
   
   ! reading the values of E, B, m, q from the file
   open(unit=10,file='data.dat',status='old', action='read')
   do i=1,4
      read(10,'(A)') values(i)
   end do
   close(unit=10)

   ! change strings to real numbers
   read(values(1)(5:),*) E_value !theoretical ideal for E is 0.4147408125
   read(values(2)(5:),*) B_value !theoretical ideal for B is 0.4147408125
   read(values(3)(5:),*) p%m
   read(values(4)(5:),*) p%q

   ! PART 1 -------------------------------------------------------------------------------------------------------------------------------------------------------
   ! ask user for the time of the measurement (ask for integer, number of miliseconds)
   !write(*,'(A)') 'Please provide the time of the measurment in miliseconds as an integer:'

   ! this checks if the user gave valid input and asks for new if it is not right
   !do while (input_validation)
      !read(*,*,iostat=iostatus) time

      !if (iostatus /= 0) then
         !write(*,'(A)') 'Invalid input. Please enter an integer.' ! invalid input, new input is required
      !else
         !input_validation=.FALSE. ! the input is valid so we exit the loop
      !end if
   !end do

   ! set initial values
   !p%pos = [0.0,1.5,0.0] !assuming we do not start from origin of the coordinate system (otherwise F=[0,0,0] and no movement appears)
   !p%v = [0,0,0] !assuming no initial velocity
   !p%a = [0,0,0] !assuming no initial acceleration
   
   ! set initial E and B vectors
   !E = -E_value*p%pos/norm2(p%pos) !we assume the E always go to the center so that E vector is always in the negative direction of position vector
   !B = B_value*[0,0,1]

   ! initial time, position and velocity printed out
   !write(*,'(A,I5,A)') 'Time:',0,'ns'
   !write(*,'(A,X,G10.4,X,G10.4,X,G10.4,X,A)') 'Position:',p%pos,'m'
   !write(*,'(A,X,G10.4,X,G10.4,X,G10.4,X,A)') 'Velocity:',p%v,'m/s'
   !write(*,*)

   ! the time step
   !do i=1,time*10000000 ! the input is in ms but the time step is 0.1ns
      !call step(p,E,B)
      !E = -E_value*p%pos/norm2(p%pos)
      !if (mod(i,10000000)==0) then ! every 1ms orint out
         !write(*,'(A,I6,A)') 'Time:',i/10000000,'ms'
         !write(*,'(A,X,G12.4,X,G12.4,X,G12.4,X,A)') 'Position:',p%pos,'m'
         !write(*,'(A,X,G12.4,X,G12.4,X,G12.4,X,A)') 'Velocity:',p%v,'m/s'
         !write(*,*)
      !end if
   !end do
   !---------------------------------------------------------------------------------------------------------------------------------------------------------------

   ! PART 2 -------------------------------------------------------------------------------------------------------------------------------------------------------
   ! ask user for the time of the measurement (ask for integer, number of miliseconds)
   !write(*,'(A)') 'Please provide the time of the measurment in miliseconds as an integer:'

   ! this checks if the user gave valid input and asks for new if it is not right
   !do while (input_validation)
      !read(*,*,iostat=iostatus) time

      !if (iostatus /= 0) then
         !write(*,'(A)') 'Invalid input. Please enter an integer.' ! invalid input, new input is required
      !else
         !input_validation=.FALSE. ! the input is valid so we exit the loop
      !end if
   !end do

   ! set initial values
   !p%pos = [1.5,0.,0.] ! we strat from the top of magnet (task description)
   !p%v = [0.,-sqrt(2*1.9226119608e-12/p%m),0.] ! assuming K=12MeV
   !p%a = [0.,0.,0.] ! assuming no initial acceleration
   
   ! set initial E and B vectors
   !E = [0.0,0.0,0.0] ! outside electric filter
   !B = B_value*[0,0,1]

   ! the time step
   !time = time * 10000000 
   !open(unit=1,file="p2_1_B=0.6.dat",status="replace")
   !do i=1,time
      !call step(p,E,B)
      !if (norm2(p%pos)<=1.45 .or. norm2(p%pos)>=1.55) then ! particle hits the magnet wall
         !print *,"hit the wall"
         !exit
      !end if
      !if (p%pos(1)<=0.) then ! particle hits magnet end
         !print *,"successful"
         !exit
      !end if
      !if (mod(i,5)==0) then !
         !write(*,*) 'Position:',p%pos, norm2(p%pos)!,'E:',E 
         !write(1,*) p%pos(1)," ",p%pos(2)
      !end if
   !end do
   !close(1)

   !---------------------------------------------------------------------------------------------------------------------------------------------------------------
   
   ! PART 3 -------------------------------------------------------------------------------------------------------------------------------------------------------
   ! set initial variables
   !p%pos = [0.0,-1.5,0.0] ! we start from the last positon from magnet in part 4; now value is set to the centre of magnet end
   !velocity=sqrt(2*12*1e6*1.6022*1e-19/p%m) ! velocity in x direction from K (in part 4 it must be the final velocity from magnet part)
   !p%v = [-velocity,0.0,0.0] !assuming initial velocity is such that kinetic energy is K=12 MeV
   !p%a = [0.,0.,0.] !assuming no initial acceleration

   ! set initial E and B vectors
   !B = [0,0,0] ! outside the magnet
   !E = E_value*([0.0,-2.7,0.0]-p%pos)/(sqrt(sum([0.0,-2.7,0.0]-p%pos)**2)) 

   ! set other necessary variables
   !n=0.523598776 ! 30 deg
   !v=([0.0,-2.7,0.0]-p%pos) ! vector from position to the centre of the curvature

   ! time step and saving the data
   !open(unit=10, file='data2.dat', status='replace', action='write')
   !do while (right_path)
      !write(10,*) p%pos(1),';',p%pos(2) ! save data
      !call step(p,E,B) 
      !v=([0.0,-2.7,0.0]-p%pos) 
      !E = E_value*v/(sqrt(sum(v)**2)) ! change of electric field depending on vector v
      
      !if (norm2(v)>=1.21 .or. norm2(v)<=1.19 .or. atan(v(1)/(-v(2)))<0) then ! particle hits the walls
         !right_path=.FALSE. ! particle stops
         !write(*,*) 'Particle hit the electric filter wall.'
         !write(10,*) p%pos(1),';',p%pos(2) ! save final position
         
      !else if (atan(v(1)/(-v(2)))>=n) then ! angle=arctan(x/-y), particle reaches the end of filter
         !right_path=.FALSE. ! particle stops
         !write(*,*) 'Particle hit the end of the electric filter.'
         !write(10,*) p%pos(1),';',p%pos(2) ! save final position
      !end if
   !end do
   !close(unit=10)
   !---------------------------------------------------------------------------------------------------------------------------------------------------------------

   ! PART 4 -------------------------------------------------------------------------------------------------------------------------------------------------------
   ! set initial values for magnet
    p%pos = [1.5,0.,0.] ! we strat from the top of magnet (task description)
    p%v = [0.,-sqrt(2*1.9226119608e-12/p%m),0.] ! assuming kinetic energy is K=12MeV
    p%a = [0.,0.,0.] !assuming no initial acceleration
    
    ! set initial E and B vectors
    E = [0.0,0.0,0.0] ! we start outside electric filter
    B = B_value*[0,0,1] ! constant B in +z direction

    ! set other variables
    n=0.523598776 ! 30 deg
    v=([0.0,-2.7,0.0]-p%pos)

    ! different values of particle mass
    !p%m=2.32530757E-26 !max
    !p%m=2.32528169E-26 !min

    !p%m=2.62530757E-26 !too large
    !p%m=2.31528169E-26 !too small

    !do while (right_mass) ! this loop is used to find the min and max mass
        open(unit=1,file="full_simulation1.dat",status="replace") ! collecting data into files
        do while (right_path)
            write(1,*) p%pos(1),';',p%pos(2) ! save position data
            call step(p,E,B)

            ! particle in magnet
            if (p%pos(1)>0) then 
                E=[0.0,0.0,0.0] ! outside electric filter
                B = B_value*[0,0,1]

                if (norm2(p%pos)<=1.45 .or. norm2(p%pos)>=1.55) then ! particle hits the walls of magnet
                    write(*,'(A)') "Particle hit the magnet wall"
                    right_path=.FALSE. ! particle stops
                    write(1,*) p%pos(1),';',p%pos(2) ! save final position
                    !right_mass=.FALSE. ! smallest/largest mass was reached
                    !m_min=p%m
                    !m_max=p%m
                end if
            
            ! particle between magnet and electric filter
            else if (p%pos(1)==0) then
                B = B_value*[0,0,1]
                v=([0.0,-2.7,0.0]-p%pos)
                E = E_value*v/(sqrt(sum(v)**2))

            ! particle in electric filter
            else if (p%pos(1)<0) then
                B=[0.0,0.0,0.0]
                v=([0.0,-2.7,0.0]-p%pos) ! vector from position to centre of curvature 
                E = E_value*v/(sqrt(sum(v)**2)) ! change of electric field depending on the direction of the vector v
            
                if (norm2(v)>=1.21 .or. norm2(v)<=1.19 .or. atan(v(1)/(-v(2)))<0) then ! particle hits the walls of electric field
                    right_path=.FALSE. ! particle stops
                    write(*,'(A)') 'Particle hit the electric filter wall.'
                    write(1,*) p%pos(1),';',p%pos(2) ! save final position
                    !right_mass=.FALSE. ! smallest/largest mass was reached
                    !m_min=p%m
                    !m_max=p%m
                    
                else if (atan(v(1)/(-v(2)))>=n) then ! angle=arctan(x/-y), particle reaches the end of filter
                    right_path=.FALSE. ! particle stops
                    write(*,'(A)') 'Success! Particle hit the end of the electric filter.'
                    write(1,*) p%pos(1),';',p%pos(2) ! save final position
                    ! if this mass reached the end we check another smaller/larger mass
                    !p%m=p%m-0.000001e-26
                    !p%m=p%m+0.000001e-26
                end if
            end if
        end do
        !right_path=.TRUE. ! go through the specrtometer again with the new mass
        close(1) ! close the file
    !end do

    !write(*,*) m_min
    !write(*,*) m_max
    !--------------------------------------------------------------------------------------------------------------------------------------------------------------
end program main
