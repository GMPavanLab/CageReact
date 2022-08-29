#!/bin/sh

rm results0.dat results01.dat results02.dat;

for name in `ls SIM_*/COLVAR`; do
	#tail -1 $name | awk '{print $1*$NF}' >> results0.dat;
    awk -v sim=$name '{if($2<1){print $1*$NF; exit;};if($5<1){print "SOMETHING WRONG HAPPEND: ",sim;exit;}}' ${name} >> results01.dat;
	awk '{if($2>59 && NR!=1){print $1*$NF; exit;};if($5<1){print "SOMETHING WRONG HAPPEND: ",sim;exit;}}' ${name} >> results02.dat;
done

cat results01.dat results02.dat > results0.dat

sort -g results0.dat | awk -v n=`wc -l results0.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux0.dat
sort -g results01.dat | awk -v n=`wc -l results01.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux01.dat
sort -g results02.dat | awk -v n=`wc -l results02.dat | awk '{print $1}'` 'BEGIN{print "0.0 0.0"}{print $1, NR/n}' > aux02.dat

gnuplot ../../plot_results0.gnu
