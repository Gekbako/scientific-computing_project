module particle
   implicit none
   type :: par
      real :: q,m,f(3),pos(3),v(3),a(3) ! I added q and f(3)
   end type par
contains
   ! small change of order

   function cProd(v1,v2) result(retval)
      real, intent(in) :: v1(3),v2(3)
      real :: retval(3)

      retval(1) = v1(2)*v2(3) - v1(3)*v2(2)
      retval(2) = v1(3)*v2(1) - v1(1)*v2(3)
      retval(3) = v1(1)*v2(2) - v1(2)*v2(1)
      return
   end function cProd

   subroutine step(p,E,B)
      type (par), intent(inout) :: p
      real, dimension(3), intent(inout) :: E,B

      p%f = p%q*(E+cProd(p%v,B)) ! I add f to subroutine since it has to be calculated everytime anyway
      p%a = p%f/p%m
      p%v = p%v + p%a*1e-10
      p%pos = p%pos + p%v*1e-10


   end subroutine step

end module particle
