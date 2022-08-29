#!/bin/sh

#rm results0.dat; for i in `seq 0 35`; do tail -1 SIM_${i}/COLVAR | awk '{if(($2<1  && NR!=1)|| ($2>59 && NR!=1)){print $1*$NF; exit;}}' >> results0.dat; done
#rm results1.dat; for i in `seq 0 50`; do awk '{if($4<35 && $5 > 1.0){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results1.dat; done
#rm results2.dat; for i in `seq 0 50`; do awk '{if($6<35 && $7 > 0.9){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results2.dat; done
rm results01.dat; for i in `seq 0 35`; do awk '{if($2>59 && NR!=1){ exit;};if($2<1 && NR!=1){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results01.dat; done
rm results02.dat; for i in `seq 0 35`; do awk '{if($2<1 && NR!=1){ exit;};if($2>59 && NR!=1){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results02.dat; done

cat results01.dat results02.dat > results0.dat;

sort -g results0.dat | awk -v n=`wc -l results0.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux0.dat
sort -g results01.dat | awk -v n=`wc -l results01.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux01.dat
sort -g results02.dat | awk -v n=`wc -l results02.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux02.dat

gnuplot plot_results0.gnu
