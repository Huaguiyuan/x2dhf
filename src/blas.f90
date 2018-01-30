! ***************************************************************************
! *                                                                         *
! *   Copyright (C) 1996 Leif Laaksonen, Dage Sundholm                      *
! *   Copyright (C) 1996-2010 Jacek Kobus <jkob@fizyka.umk.pl>              *
! *                                                                         *     
! *   This program is free software; you can redistribute it and/or modify  *
! *   it under the terms of the GNU General Public License version 2 as     *
! *   published by the Free Software Foundation.                            *
! *                                                                         *
! ***************************************************************************
! ### blas ###
!
!     This is simplified replacement for BLAS routines: dcopy, daxpy, dscal,
!     ddot, mxv. Note that ix and iy are ignored and are set to 1.

function  dot(n,dx,ix,dy,iy)
  use params
  implicit none
  integer :: i,ix,iy,n
  real (PREC) :: dot
  real (PREC), dimension(*) :: dx,dy

  dot=0.0_PREC
  do i=1,n
     dot=dot+dx(i)*dy(i)
  enddo

end function dot


subroutine  copy(n,dx,ix,dy,iy)
  use params
  implicit none

  integer :: i,ix,iy,n

  real (PREC), dimension(*) :: dx,dy

  do i=1,n
     dy(i)=dx(i)
  enddo

end subroutine copy

subroutine  axpy(n,da,dx,ix,dy,iy)
  use params
  implicit none
  integer :: i,ix,iy,n
  real (PREC) :: da
  real (PREC), dimension(*) :: dx,dy

  do i=1,n
     dy(i)=da*dx(i)+dy(i)
  enddo
end subroutine axpy

subroutine  scal(n,da,dx,ix)
  use params
  implicit none
  integer :: i,ix,n
  real (PREC) :: da
  real (PREC), dimension(*) :: dx

  do i=1,n
     dx(i)=da*dx(i)
  enddo

end subroutine scal


!!     Multiplies the matrix DX(nr,nc) times the vector DV(nc) and stores 
!!     the result in the vector DY(nr) by means of calling DGEMV 
!!
!      subroutine dgemv (trans,nr1,nc,alpha,dx,nr2,dv,incr1,beta,
!     &     dvr,incr2)
!      integer*4  incr1,incr2,inr,nc,nr1,nr2
!      real*8  alpha,beta,dx(nr1,nc),dv(nc),dvr(nr1),s
!      character*1 trans
!
!      do inr=1,nr1
!         s=0.0_PREC
!         do inc=1,nc
!            s=s+dx(inr,inc)*dv(inc)
!         enddo
!         dvr(inr)=s
!      enddo

!      return
!      end

      
!     Multiplies the matrix DX(nr,nc) times the vector DV(nc) and stores                                    
!     the result in the vector DY(nr) (simplified version of DGEMV)                                         
!                                                                                                           
subroutine gemv (nr1,nc,dx,dv,dvr)
  use params
  implicit none
  integer :: inr,inc,nc,nr1
  real (PREC) :: s
  real (PREC), dimension(nr1,*) :: dx
  real (PREC), dimension(*) :: dv,dvr

  do inr=1,nr1
     s=0.0_PREC
     do inc=1,nc
        s=s+dx(inr,inc)*dv(inc)
     enddo
     dvr(inr)=s
  enddo
end subroutine gemv



                      












