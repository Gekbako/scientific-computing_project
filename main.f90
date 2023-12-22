program main
   use particle
   implicit none

   real :: m,E(3),B(3)
   real :: a(3),c(3)
   real :: dt
   dt = 1e-10

   dt = 1e-10 !timestep

   a = [1.,0.,0.]
   b = [0.,0.,1.]
   !function calls
   print *, cProd(b,a)

end program main
