set terminal png size 1080,1080 enhanced font "Arial,24"
set format x "%.0e"
set xlabel "Time (s)" 
set ylabel "Probability" 
set key off
set logscale x
f0(x) = 1 - exp(-x/tau0)
tau0=1e-4
fit f0(x) 'aux.dat' u ($1):2 via tau0
set xrange [1e-15:1e-1]
set grid ytics lc rgb "#bbbbbb" lw 1 lt 0
set grid xtics lc rgb "#bbbbbb" lw 1 lt 0
show grid

set output "poisson.png"

p "aux.dat" u ($1):2 w steps lw 4 lc 1 t '', f0(x) lw 7 lc 1



