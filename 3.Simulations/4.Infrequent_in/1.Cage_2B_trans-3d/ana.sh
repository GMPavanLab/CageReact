#!/bin/sh

rm results0.dat; for i in `seq 0 50`; do tail -1 sim_${i}/COLVAR | awk '{print $1*$NF}' >> results0.dat; done
#rm results1.dat; for i in `seq 0 50`; do awk '{if($4<35 && $5 > 1.0){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results1.dat; done
#rm results2.dat; for i in `seq 0 50`; do awk '{if($6<35 && $7 > 0.9){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results2.dat; done
rm results01.dat; for i in `seq 0 50`; do awk '{if($2<34 && $3 >0.93){print $1*$NF; exit;}}' sim_${i}/COLVAR >> results01.dat; done
#rm results02.dat; for i in `seq 0 50`; do awk '{if($6<46){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results02.dat; done

sort -g results0.dat | awk -v n=`wc -l results0.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux0.dat
sort -g results01.dat | awk -v n=`wc -l results01.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux01.dat

gnuplot plot_results0.gnu
