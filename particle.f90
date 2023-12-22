module particle
   implicit none
   type :: par
      real :: m,pos(3),v(3),a(3)
   end type par
contains
   subroutine step(p,f)
      type (par), intent(inout) :: p
      real, intent(in) ::  f(3)

      p%a = f/p%m
      p%v = p%v + p%a*1e-10
      p%pos = p%pos + p%v*1e-10
   end subroutine step

   function cProd(v1,v2) result(retval)
      real, intent(in) :: v1(3),v2(3)
      real :: retval(3)

      retval(1) = v1(2)*v2(3) - v1(3)*v2(2)
      retval(2) = v1(3)*v2(1) - v1(1)*v2(3)
      retval(3) = v1(1)*v2(2) - v1(2)*v2(1)
      return
   end function cProd

end module particle
