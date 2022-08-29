 set terminal pngcairo size 800,800 color dl 0.5 font 'Helvetica,21'
 set output 'plot_torsion.png'

set xlabel "Torsion Psi"
set ylabel "Torsion Phi"
set cblabel "Free energy [kcal/mol]"

set cbrange [0:5]

stats 'res_torsion.map' u (-0.592*log($3))

p [-3.14:3.14][-3.14:3.14] 'res_torsion.map' u 1:2:(-0.592*log($3)-STATS_min) w image t ''
