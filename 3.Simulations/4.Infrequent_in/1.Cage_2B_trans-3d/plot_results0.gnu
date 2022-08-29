#!/usr/bin/gnuplot

set logscale x
f0(x) = 1 - exp(-x/tau0)
f1(x) = 1 - exp(-x/tau1)
f2(x) = 1 - exp(-x/tau2)
tau0=1.0e10
tau1=1.0e10
tau2=1.0e10
fit f0(x) 'aux0.dat' u ($1):2 via tau0
fit f1(x) 'aux01.dat' u ($1):2 via tau1
p 'aux0.dat' u ($1):2 w steps lw 2 lc 1, f0(x) lw 4 lc 1,\
 'aux01.dat' u ($1):2 w steps lw 2 lc 2, f1(x) lw 4 lc 2

pause -1
