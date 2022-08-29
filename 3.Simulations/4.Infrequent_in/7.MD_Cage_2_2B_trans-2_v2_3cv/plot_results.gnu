#!/usr/local/bin/gnuplot

set logscale x
f0(x) = 1 - exp(-x/tau0)
f1(x) = 1 - exp(-x/tau1)
f01(x) = 1 - exp(-x/tau01)
f02(x) = 1 - exp(-x/tau02)
tau0=1.0e10
tau1=1.0e10
tau01=1.0e10
tau02=1.0e10
fit f0(x) 'aux.dat' u ($1):2 via tau0
fit f1(x) 'aux1.dat' u ($1):2 via tau1
fit f01(x) 'aux01.dat' u ($1):2 via tau01
p 'aux.dat' u ($1):2 w steps lw 2 lc 1, f0(x) lw 4 lc 1,\
 'aux1.dat' u ($1):2 w steps lw 2 lc 2, f1(x) lw 4 lc 2,\
 'aux01.dat' u ($1):2 w steps lw 2 lc 3, f01(x) lw 4 lc 3

pause -1
