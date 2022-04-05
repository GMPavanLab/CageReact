 %chk=cage.MK.chk
 %nprocshared=16
 %mem=16GB
 # B3lyp/Gen geom=allcheck guess=read scf=(tight,XQC)
 integral=(grid=ultrafine) pop=(MK,readradii) IOp(6/33=2,6/41=10,6/42=17)
 
 C H N 0
 6-31G*
 ****
 Pd 0
 DGDZVP
 ****
 
 Pd 1.70
