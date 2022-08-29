set nframe [molinfo top get numframes]
for {set i 0} {$i<$nframe} {incr i} { 
    set sel0 [atomselect top "serial 301 303 304 305 302 300" frame $i]; 
    set center [measure center $sel0]; 
    set sel1 [atomselect top "serial 1" frame $i];      
    set pos {}
    append pos [$sel1 get x]
    append pos " "
    append pos [$sel1 get y]
    append pos " "
    append pos [$sel1 get z]
    $sel1 moveby [vecsub $center $pos]

    $sel0 delete;
    $sel1 delete;

    set sel0 [atomselect top "serial 295 307 308 309 310" frame $i]; 
    set center [measure center $sel0]; 
    set sel1 [atomselect top "serial 2" frame $i];      
    set pos {}
    append pos [$sel1 get x]
    append pos " "
    append pos [$sel1 get y]
    append pos " "
    append pos [$sel1 get z]
    $sel1 moveby [vecsub $center $pos]

    $sel0 delete;
    $sel1 delete;

}

