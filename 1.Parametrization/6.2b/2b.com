 %chk=2b.chk
 %nprocshared=16
 %mem=16GB
 # B3lyp/6-31G* scf=(tight,XQC) opt
 integral=(grid=ultrafine) pop=(MK,readradii) IOp(6/33=2,6/41=10,6/42=17)

MK PD2

0  1
S -3.3838976725   -0.6191203135   0.9785139532
O -0.2086354875   2.0914555521   -1.2345858330
O 4.4020570184   1.8913342371   -1.3727260685
O 0.0597189141   -2.1106967213   1.2243693448
N -0.4002036742   -0.3486436395   -0.0442173963
C 0.7988939322   0.1287028554   -0.4217028585
C 0.8453116112   1.4075164489   -1.0411895914
C 2.0339415788   -0.5443945658   -0.2362432075
C 2.0771338523   1.9794935922   -1.4349547549
C 3.2905645790   1.3249412358   -1.1531447051
C 3.2618735501   0.0427581263   -0.5787258347
C -0.7535196254   -1.3947872636   0.6554106238
C -2.0765364236   -1.7543560155   0.8398264428
C -2.5159361888   -3.0757624467   0.9818097516
C -3.8661822414   -3.1780459388   1.2773377787
C -4.4605953154   -1.9265034923   1.3467532090
C -0.6420469797   3.1080718441   -0.4808904215
C 5.0837644906   2.6073158258   -0.4704656532
H 2.0918258421   -1.4786305880   0.1638280696
H 2.0993353187   2.8899810106   -1.9032612845
H -1.1232841669   0.1696814050   -0.3347902946
H 4.1328693257   -0.4614427082   -0.3937840672
H -1.9110706476   -3.8958599070   0.8946785140
H -4.3522985452   -4.0626238924   1.4358539707
H -5.4422955350   -1.7887546938   1.5894595695
H -1.5223033980   3.5434984468   -0.9529020335
H 0.1074154386   3.8966182652   -0.3719791490
H -0.9268544937   2.7523757635   0.5119476661
H 6.0336356941   2.9122939138   -0.9077855736
H 4.5329920081   3.5078961988   -0.1874023310
H 5.2996281741   2.0294522646   0.4327859810

