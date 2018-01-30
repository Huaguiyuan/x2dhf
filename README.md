# 2-Dimensional Finite Difference Hartree-Fock program for diatomic molecules
                                                                            
This program finds virtually exact solutions of the Hartree-Fock and density functional
theory equations for diatomic molecules and atoms (the quality of a solution depends on
grid size and arithmetic precision used). The lowest energy eigenstates of a given
irreducible representation and spin can be obtained.

The program can be also be used to obtain the ground and excited states of one-electron
systems with the (smoothed) Coulomb and Krammers-Hennenberger potentials.

Single particle two-dimensional numerical functions (orbitals) are used to construct an
antisymmetric many-electron wave function of the restricted open-shell Hartree-Fock
model. The orbitals are obtained by solving the Hartree-Fock equations in the form of the
coupled two-dimensional second-order (elliptic) partial differential equations (PDE). The
Coulomb and exchange potentials are obtained as solutions of the corresponding Poisson
equations. The PDEs are disretized by the 8th-order central difference stencil on a
two-dimensional grid and the resulting large and sparse system of linear equations is
solved by the (multicolour) successive overrelaxation method ((MC)SOR). The
self-consistent-field iterations are interwoven with the (MC)SOR ones and orbital energies
and normalization factors are used to monitor the convergence. The accuracy of solutions
depends mainly on the grid and the system under consideration.

See the following articles for the detailed description of the program and examples of its
usage and accuracy:

* L. Laaksonen, P. Pyykko, and D. Sundholm, Comp. Phys. Reports 4 (1986) 219.
* L. Laaksonen, D. Sundholm, and P. Pyykk\"o, in "Scientific Computing in Finland,", Eds. K. Kankaala and R. Nieminen, Research Report R1/89, Centre for Scientific Computing, (1989) p. 183.
* P. Pyykk\"o, in Numerical Determination of the Electronic Structure of Atoms, Diatomic and Polyatomic Molecules (NATO ASI Series C271) Eds. M.Defranceschi and J Delhalle, p.161
* J. Kobus, Chem. Phys. Lett. 202 (1993) 7
* J. Kobus, Comput. Phys. Commun. 78 (1994) 247
* J. Kobus, L. Laaksonen, D. Sundholm, Comp. Phys.Commun. 98 (1996) 346-358 
* J. Kobus, Numerical Hartree-Fock methods for diatomic molecules, Handbook of Molecular Physics and Quantum Chemistry (Chichester), ed. S.Wilson (Wiley, 2002)
* J. Kobus, Hartree-Fock-limit values of multipole moments, polarizabilities and hyperpolarizabilities for atoms and diatomic molecules, Comp. Lett. 3 (2007) 71-113
* J. Kobus, A finite difference Hartree-Fock program for atoms and diatomic molecules, Comp. Phys. Commun. http://dx.doi.org/10.1016/j.cpc.2012.09.033

See also docs/2dhf.pdf for a detailed description of the HF method for diatomic molecules
and the present version of the program.  

The programming language used is Fortran 77 but routines memAlloc and memDeAlloc (for
allocating and deallocating memory) and kh (with some model potentials) are written in
C. The program makes use of several BLAS (Basic Linear Algebra System) routines. If the
library is not available blas.f contains their equivalents. When possible these routines
should be replaced by their library equivalents (see INSTALL).

See INSTALL to configure, compile and run the program. The file doc/users-guide.pdf
contains the description of the program's input data and examples of its usage.

This program is free software; you can redistribute it and/or modify it under the terms of
the GNU General Public License version 2 as published by the Free Software Foundation.
                                                                      
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.