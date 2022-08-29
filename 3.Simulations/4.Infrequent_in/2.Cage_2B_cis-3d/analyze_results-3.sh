#!/bin/sh
#list=`cat lista.dat | sed -e 's/_/ /' | sed -e 's/\// /' | awk '{print $2}' `
rm results01.dat; for i in `seq 0 50`; do awk '{if($2<40 && $3 < 8.0){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results01.dat; done
cat results01.dat results02.dat > results.dat
#rm results2.dat; for i in `seq 0 50`; do awk '{if($6<35 && $7 > 0.9){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results2.dat; done
#rm results1.dat; for i in $list; do awk '{if($2<35){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results1.dat; done

sort -g results.dat | awk -v n=`wc -l results.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux.dat
sort -g results01.dat | awk -v n=`wc -l results01.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux01.dat

gnuplot plot_results.gnu
