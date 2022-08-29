#!/bin/sh
list=`cat lista.dat | sed -e 's/_/ /' | sed -e 's/\// /' | awk '{print $2}' `
rm results.dat; for i in $list; do tail -1 SIM_${i}/COLVAR | awk '{print $1*$NF}' >> results.dat; done
rm results1.dat; for i in $list; do awk '{if($2<35 && $4 > 0.9){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results1.dat; done
rm results01.dat; for i in $list; do awk '{if(NR!=1 && $2<3){exit}else if($2<40 && $2>20  && $3>0.77 && $3 < 11.5 && $4>0.8 && $4< 1.0){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results01.dat; done
rm results02.dat; for i in $list; do awk '{if($2<40 && $2>20  && $3>0.77 && $3 < 11.5 && $4>0.8 && $4<1.0 ){exit}else if($2<3){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results02.dat; done
#rm results2.dat; for i in `seq 0 50`; do awk '{if($6<35 && $7 > 0.9){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results2.dat; done
#rm results1.dat; for i in $list; do awk '{if($2<35){print $1*$NF; exit;}}' SIM_${i}/COLVAR >> results1.dat; done

sort -g results.dat | awk -v n=`wc -l results.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux.dat
sort -g results1.dat | awk -v n=`wc -l results1.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux1.dat
sort -g results01.dat | awk -v n=`wc -l results01.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux01.dat
sort -g results02.dat | awk -v n=`wc -l results02.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux02.dat

gnuplot plot_results.gnu
