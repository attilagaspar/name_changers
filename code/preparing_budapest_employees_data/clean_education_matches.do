*clear
*set more off

*do assemble_budapest.do

tempfile bpp
save `bpp'

use "../data/education/derived/save_NPT_BP_rawmatches_full_CLEAN.dta", clear

drop _merge


merge m:m i using `bpp'

keep if _merge==3

duplicates drop i sorszam, force

gen bijection=0
* gets value of 1 if the match is unique
duplicates tag sorszam, gen(t1)
duplicates tag i, gen(t2)
replace bijection=1 if t1==0 & t2==0

gen perfect=0
*gets value of 1 if the names match exactly
split fullname, gen(fn)
gen fullname_using = v_nev_1 + " " + u_nev_1 
gen fullname2=oldname + " " + fn2
gen fullname3=newname + " " +fn2
replace perfect=1 if fullname==fullname_using | fullname2==fullname_using | fullname3==fullname_using


/*
           |        perfect
 bijection |         0          1 |     Total
-----------+----------------------+----------
         0 |     2,017      1,385 |     3,402 
         1 |       606        231 |       837 
-----------+----------------------+----------
     Total |     2,623      1,616 |     4,239 
*/


egen mp1=max(perfect), by(i)
egen mp2=max(perfect), by(sorszam)
* if a name matches perfectly another name, we should ignore its other, non-perfect matches
drop if mp1!=perfect
drop if mp2!=perfect
drop mp1 mp2

drop bijection t1 t2
gen bijection=0
duplicates tag sorszam, gen(t1)
duplicates tag i, gen(t2)
replace bijection=1 if t1==0 & t2==0

/*
           |        perfect
 bijection |         0          1 |     Total
-----------+----------------------+----------
         0 |     1,497      1,281 |     2,778 
         1 |       617        335 |       952 
-----------+----------------------+----------
     Total |     2,114      1,616 |     3,730 

*/

*next step: believable match

gen dubious=0
* dubious==1 : BELIEVE - minor difference in writing (w-v, i-y)
* dubious==2 : DOUBT - considerable difference which can be attributed to mistyping (Grets - Gretso)
* dubious==3 : DROP - different people for sure (Horváth - Horváthné)



replace dubious=1 if i==49 & sorszam==5021633
replace dubious=1 if i==60 & sorszam==5189470
replace dubious=1 if i==60 & sorszam==5047021
replace dubious=1 if i==93 & sorszam==5257486
replace dubious=3 if i==103 & sorszam==5540895
replace dubious=3 if i==103 & sorszam==5520052
replace dubious=3 if i==103 & sorszam==5264021
replace dubious=3 if i==103 & sorszam==5173275
replace dubious=1 if i==125 & sorszam==5043832
replace dubious=2 if i==135 & sorszam==5158200
replace dubious=1 if i==136 & sorszam==5017292
replace dubious=2 if i==153 & sorszam==5141834
replace dubious=2 if i==163 & sorszam==5216769
replace dubious=2 if i==246 & sorszam==5449930
replace dubious=1 if i==270 & sorszam==5464121
replace dubious=2 if i==325 & sorszam==5387818
replace dubious=3 if i==325 & sorszam==5374781
replace dubious=1 if i==357 & sorszam==5280764
replace dubious=1 if i==372 & sorszam==5463890
replace dubious=2 if i==387 & sorszam==5201938
replace dubious=2 if i==397 & sorszam==5448552
replace dubious=3 if i==403 & sorszam==5206302
replace dubious=1 if i==454 & sorszam==5229487
replace dubious=1 if i==475 & sorszam==5191823
replace dubious=1 if i==478 & sorszam==5520510
replace dubious=1 if i==511 & sorszam==5520656
replace dubious=2 if i==513 & sorszam==5507407
replace dubious=3 if i==516 & sorszam==5005530
replace dubious=1 if i==516 & sorszam==5310783
replace dubious=1 if i==517 & sorszam==5047591
replace dubious=1 if i==521 & sorszam==5212512
replace dubious=2 if i==528 & sorszam==5208119
replace dubious=1 if i==550 & sorszam==5036560
replace dubious=1 if i==553 & sorszam==5317340
replace dubious=1 if i==599 & sorszam==5189993
replace dubious=1 if i==659 & sorszam==5507587
replace dubious=1 if i==695 & sorszam==5022024
replace dubious=3 if i==698 & sorszam==5153461
replace dubious=3 if i==699 & sorszam==5578088
replace dubious=1 if i==722 & sorszam==5048560
replace dubious=3 if i==787 & sorszam==5413248
replace dubious=2 if i==787 & sorszam==5507451
replace dubious=3 if i==787 & sorszam==5496081
replace dubious=3 if i==802 & sorszam==5325030
replace dubious=1 if i==853 & sorszam==5295698
replace dubious=1 if i==870 & sorszam==5278795
replace dubious=2 if i==872 & sorszam==5450134
replace dubious=2 if i==872 & sorszam==5388477
replace dubious=3 if i==882 & sorszam==5498585
replace dubious=2 if i==898 & sorszam==5436511
replace dubious=3 if i==905 & sorszam==5153461
replace dubious=2 if i==911 & sorszam==5370775
replace dubious=2 if i==911 & sorszam==5370749
replace dubious=2 if i==911 & sorszam==5204824
replace dubious=2 if i==948 & sorszam==5184442
replace dubious=2 if i==948 & sorszam==5300762
replace dubious=2 if i==948 & sorszam==5174262
replace dubious=2 if i==971 & sorszam==5047779
replace dubious=3 if i==984 & sorszam==5147235
replace dubious=3 if i==995 & sorszam==5120827
replace dubious=1 if i==1030 & sorszam==5474255
replace dubious=3 if i==1057 & sorszam==5192017
replace dubious=2 if i==1160 & sorszam==5142079
replace dubious=3 if i==1162 & sorszam==5454998
replace dubious=1 if i==1170 & sorszam==5520128
replace dubious=2 if i==1177 & sorszam==5534691
replace dubious=1 if i==1204 & sorszam==5310560
replace dubious=2 if i==1230 & sorszam==5482016
replace dubious=1 if i==1231 & sorszam==5449363
replace dubious=2 if i==1255 & sorszam==5047774
replace dubious=2 if i==1260 & sorszam==5503016
replace dubious=3 if i==1281 & sorszam==5240868
replace dubious=3 if i==1281 & sorszam==5240820
replace dubious=2 if i==1289 & sorszam==5154227
replace dubious=1 if i==1333 & sorszam==5244291
replace dubious=1 if i==1333 & sorszam==5243492
replace dubious=2 if i==1346 & sorszam==5310612
replace dubious=1 if i==1348 & sorszam==5202062
replace dubious=1 if i==1348 & sorszam==5325176
replace dubious=2 if i==1370 & sorszam==5120951
replace dubious=1 if i==1379 & sorszam==5209507
replace dubious=1 if i==1379 & sorszam==5211850
replace dubious=1 if i==1384 & sorszam==5578798
replace dubious=1 if i==1384 & sorszam==5578818
replace dubious=1 if i==1412 & sorszam==5368218
replace dubious=3 if i==1418 & sorszam==5223951
replace dubious=3 if i==1418 & sorszam==5258299
replace dubious=3 if i==1418 & sorszam==5246322
replace dubious=3 if i==1418 & sorszam==5142218
replace dubious=3 if i==1427 & sorszam==5131686
replace dubious=3 if i==1430 & sorszam==5558477
replace dubious=3 if i==1468 & sorszam==5268511
replace dubious=1 if i==1487 & sorszam==5210024
replace dubious=1 if i==1487 & sorszam==5521066
replace dubious=1 if i==1490 & sorszam==5240393
replace dubious=1 if i==1499 & sorszam==5520339
replace dubious=3 if i==1503 & sorszam==5507815
replace dubious=1 if i==1516 & sorszam==5204950
replace dubious=3 if i==1518 & sorszam==5141194
replace dubious=3 if i==1518 & sorszam==5229482
replace dubious=3 if i==1531 & sorszam==5258306
replace dubious=3 if i==1544 & sorszam==5172958
replace dubious=3 if i==1558 & sorszam==5575843
replace dubious=1 if i==1580 & sorszam==5253127
replace dubious=1 if i==1592 & sorszam==5048559
replace dubious=1 if i==1622 & sorszam==5508691
replace dubious=1 if i==1622 & sorszam==5503911
replace dubious=2 if i==1633 & sorszam==5400538
replace dubious=1 if i==1633 & sorszam==5507026
replace dubious=1 if i==1648 & sorszam==5544459
replace dubious=1 if i==1651 & sorszam==5009791
replace dubious=2 if i==1668 & sorszam==5140440
replace dubious=2 if i==1721 & sorszam==5159753
replace dubious=1 if i==1722 & sorszam==5201732
replace dubious=1 if i==1726 & sorszam==5216240
replace dubious=1 if i==1735 & sorszam==5543797
replace dubious=2 if i==1781 & sorszam==5374062
replace dubious=3 if i==1791 & sorszam==5043926
replace dubious=3 if i==1797 & sorszam==5278923
replace dubious=1 if i==1802 & sorszam==5501176
replace dubious=2 if i==1819 & sorszam==5172788
replace dubious=3 if i==1854 & sorszam==5578715
replace dubious=2 if i==1886 & sorszam==5279624
replace dubious=2 if i==1897 & sorszam==5578591
replace dubious=1 if i==1898 & sorszam==5518655
replace dubious=1 if i==1903 & sorszam==5280548
replace dubious=1 if i==1929 & sorszam==5534706
replace dubious=2 if i==1935 & sorszam==5507494
replace dubious=1 if i==1946 & sorszam==5280444
replace dubious=1 if i==1946 & sorszam==5279845
replace dubious=1 if i==1962 & sorszam==5413360
replace dubious=1 if i==1984 & sorszam==5001703
replace dubious=1 if i==1984 & sorszam==5001601
replace dubious=1 if i==1985 & sorszam==5229487
replace dubious=1 if i==1991 & sorszam==5564533
replace dubious=1 if i==1991 & sorszam==5153692
replace dubious=1 if i==1993 & sorszam==5201732
replace dubious=2 if i==2001 & sorszam==5161047
replace dubious=2 if i==2018 & sorszam==5374234
replace dubious=3 if i==2045 & sorszam==5240787
replace dubious=3 if i==2067 & sorszam==5422506
replace dubious=1 if i==2067 & sorszam==5141601
replace dubious=3 if i==2067 & sorszam==5564499
replace dubious=1 if i==2103 & sorszam==5322648
replace dubious=2 if i==2119 & sorszam==5526287
replace dubious=3 if i==2126 & sorszam==5013234
replace dubious=3 if i==2126 & sorszam==5012293
replace dubious=3 if i==2135 & sorszam==5322744
replace dubious=3 if i==2136 & sorszam==5157911
replace dubious=2 if i==2144 & sorszam==5497924
replace dubious=1 if i==2167 & sorszam==5558827
replace dubious=2 if i==2182 & sorszam==5205360
replace dubious=1 if i==2185 & sorszam==5022125
replace dubious=3 if i==2207 & sorszam==5005530
replace dubious=2 if i==2215 & sorszam==5361942
replace dubious=1 if i==2220 & sorszam==5016847
replace dubious=2 if i==2227 & sorszam==5140642
replace dubious=1 if i==2229 & sorszam==5257486
replace dubious=3 if i==2252 & sorszam==5039117
replace dubious=3 if i==2252 & sorszam==5017137
replace dubious=2 if i==2252 & sorszam==5017128
replace dubious=1 if i==2269 & sorszam==5208139
replace dubious=3 if i==2273 & sorszam==5229824
replace dubious=1 if i==2288 & sorszam==5374697
replace dubious=1 if i==2288 & sorszam==5316667
replace dubious=1 if i==2288 & sorszam==5141760
replace dubious=2 if i==2292 & sorszam==5381375
replace dubious=1 if i==2293 & sorszam==5316818
replace dubious=3 if i==2308 & sorszam==5259519
replace dubious=3 if i==2314 & sorszam==5580045
replace dubious=3 if i==2316 & sorszam==5208595
replace dubious=3 if i==2316 & sorszam==5208553
replace dubious=3 if i==2316 & sorszam==5038915
replace dubious=3 if i==2319 & sorszam==5510238
replace dubious=2 if i==2319 & sorszam==5445134
replace dubious=1 if i==2323 & sorszam==5142159
replace dubious=1 if i==2354 & sorszam==5470032
replace dubious=1 if i==2354 & sorszam==5055371
replace dubious=3 if i==2360 & sorszam==5204001
replace dubious=3 if i==2365 & sorszam==5589216
replace dubious=3 if i==2391 & sorszam==5520177
replace dubious=3 if i==2403 & sorszam==5153598
replace dubious=3 if i==2426 & sorszam==5388473
replace dubious=3 if i==2429 & sorszam==5590464
replace dubious=3 if i==2433 & sorszam==5555849
replace dubious=3 if i==2433 & sorszam==5413392
replace dubious=2 if i==2433 & sorszam==5204525
replace dubious=2 if i==2435 & sorszam==5202299
replace dubious=2 if i==2435 & sorszam==5022253
replace dubious=1 if i==2449 & sorszam==5505923
replace dubious=1 if i==2454 & sorszam==5253127
replace dubious=3 if i==2461 & sorszam==5497924
replace dubious=2 if i==2468 & sorszam==5440785
replace dubious=2 if i==2482 & sorszam==5482187
replace dubious=2 if i==2482 & sorszam==5498602
replace dubious=2 if i==2489 & sorszam==5510125
replace dubious=2 if i==2515 & sorszam==5048739
replace dubious=3 if i==2515 & sorszam==5430842
replace dubious=2 if i==2515 & sorszam==5048480
replace dubious=3 if i==2515 & sorszam==5592544
replace dubious=3 if i==2545 & sorszam==5564499
replace dubious=1 if i==2545 & sorszam==5141601
replace dubious=3 if i==2545 & sorszam==5422506
replace dubious=2 if i==2557 & sorszam==5496131
replace dubious=2 if i==2557 & sorszam==5254897
replace dubious=1 if i==2559 & sorszam==5494577
replace dubious=3 if i==2560 & sorszam==5017470
replace dubious=2 if i==2563 & sorszam==5046833
replace dubious=3 if i==2563 & sorszam==5555052
replace dubious=3 if i==2575 & sorszam==5047279
replace dubious=1 if i==2577 & sorszam==5157706
replace dubious=1 if i==2582 & sorszam==5591005
replace dubious=1 if i==2583 & sorszam==5464121
replace dubious=1 if i==2600 & sorszam==5208237
replace dubious=1 if i==2604 & sorszam==5590453
replace dubious=3 if i==2607 & sorszam==5427752
replace dubious=3 if i==2608 & sorszam==5545645
replace dubious=3 if i==2608 & sorszam==5387621
replace dubious=3 if i==2608 & sorszam==5206236
replace dubious=3 if i==2608 & sorszam==5507434
replace dubious=3 if i==2608 & sorszam==5038765
replace dubious=3 if i==2608 & sorszam==5412968
replace dubious=3 if i==2608 & sorszam==5413173
replace dubious=3 if i==2610 & sorszam==5142218
replace dubious=3 if i==2613 & sorszam==5036895
replace dubious=3 if i==2613 & sorszam==5370255
replace dubious=3 if i==2613 & sorszam==5454650
replace dubious=3 if i==2613 & sorszam==5037242
replace dubious=3 if i==2613 & sorszam==5048132
replace dubious=3 if i==2641 & sorszam==5414706
replace dubious=2 if i==2682 & sorszam==5052786
replace dubious=2 if i==2692 & sorszam==5173250
replace dubious=3 if i==2698 & sorszam==5001369
replace dubious=1 if i==2714 & sorszam==5048418
replace dubious=1 if i==2716 & sorszam==5198508
replace dubious=2 if i==2720 & sorszam==5455285
replace dubious=1 if i==2720 & sorszam==5317169
replace dubious=1 if i==2724 & sorszam==5449778
replace dubious=2 if i==2725 & sorszam==5199974
replace dubious=3 if i==2744 & sorszam==5310906
replace dubious=2 if i==2772 & sorszam==5386776
replace dubious=2 if i==2780 & sorszam==5022230
replace dubious=2 if i==2780 & sorszam==5048457
replace dubious=2 if i==2803 & sorszam==5279656
replace dubious=2 if i==2815 & sorszam==5589687
replace dubious=2 if i==2822 & sorszam==5162049
replace dubious=1 if i==2829 & sorszam==5259862
replace dubious=3 if i==2845 & sorszam==5464000
replace dubious=3 if i==2845 & sorszam==5261275
replace dubious=3 if i==2848 & sorszam==5400977
replace dubious=3 if i==2889 & sorszam==5494760
replace dubious=3 if i==2889 & sorszam==5241623
replace dubious=3 if i==2889 & sorszam==5399273
replace dubious=3 if i==2889 & sorszam==5491709
replace dubious=3 if i==2896 & sorszam==5037513
replace dubious=3 if i==2896 & sorszam==5232617
replace dubious=3 if i==2900 & sorszam==5331053
replace dubious=2 if i==2901 & sorszam==5022400
replace dubious=3 if i==2905 & sorszam==5205016
replace dubious=1 if i==2909 & sorszam==5342189
replace dubious=2 if i==2917 & sorszam==5191984
replace dubious=2 if i==2927 & sorszam==5202860
replace dubious=2 if i==2930 & sorszam==5493487
replace dubious=3 if i==2934 & sorszam==5521010
replace dubious=3 if i==2937 & sorszam==5209154
replace dubious=1 if i==2948 & sorszam==5210111
replace dubious=3 if i==2986 & sorszam==5394235
replace dubious=3 if i==3016 & sorszam==5579077
replace dubious=3 if i==3016 & sorszam==5202926
replace dubious=3 if i==3016 & sorszam==5039825
replace dubious=3 if i==3021 & sorszam==5079631
replace dubious=2 if i==3023 & sorszam==5198508
replace dubious=1 if i==3025 & sorszam==5493632
replace dubious=3 if i==3025 & sorszam==5464467
replace dubious=1 if i==3028 & sorszam==5126892
replace dubious=1 if i==3053 & sorszam==5039833
replace dubious=1 if i==3054 & sorszam==5002314
replace dubious=2 if i==3059 & sorszam==5305261
replace dubious=2 if i==3071 & sorszam==5520043
replace dubious=2 if i==3088 & sorszam==5245665
replace dubious=1 if i==3092 & sorszam==5210247
replace dubious=1 if i==3108 & sorszam==5532037
replace dubious=1 if i==3126 & sorszam==5048560
replace dubious=1 if i==3129 & sorszam==5006514
replace dubious=2 if i==3139 & sorszam==5375282
replace dubious=2 if i==3140 & sorszam==5129636
replace dubious=3 if i==3140 & sorszam==5158469
replace dubious=2 if i==3140 & sorszam==5129859
replace dubious=2 if i==3140 & sorszam==5402606
replace dubious=2 if i==3140 & sorszam==5154948
replace dubious=3 if i==3140 & sorszam==5195741
replace dubious=1 if i==3154 & sorszam==5174209
replace dubious=1 if i==3154 & sorszam==5198659
replace dubious=1 if i==3154 & sorszam==5062192
replace dubious=1 if i==3164 & sorszam==5331302
replace dubious=2 if i==3178 & sorszam==5565799
replace dubious=1 if i==3185 & sorszam==5383197
replace dubious=1 if i==3207 & sorszam==5499197
replace dubious=1 if i==3207 & sorszam==5288952
replace dubious=1 if i==3207 & sorszam==5038292
replace dubious=1 if i==3207 & sorszam==5342379
replace dubious=1 if i==3207 & sorszam==5046608
replace dubious=1 if i==3207 & sorszam==5044336
replace dubious=1 if i==3207 & sorszam==5180246
replace dubious=1 if i==3207 & sorszam==5535239
replace dubious=1 if i==3207 & sorszam==5375911
replace dubious=1 if i==3207 & sorszam==5305132
replace dubious=2 if i==3227 & sorszam==5213257
replace dubious=1 if i==3250 & sorszam==5154910
replace dubious=1 if i==3250 & sorszam==5065771
replace dubious=3 if i==3250 & sorszam==5190894
replace dubious=3 if i==3274 & sorszam==5556217
replace dubious=1 if i==3321 & sorszam==5330726
replace dubious=3 if i==3334 & sorszam==5498585
replace dubious=2 if i==3352 & sorszam==5202369
replace dubious=2 if i==3359 & sorszam==5240294
replace dubious=3 if i==3382 & sorszam==5589149
replace dubious=1 if i==3383 & sorszam==5412585
replace dubious=3 if i==3383 & sorszam==5240298
replace dubious=3 if i==3427 & sorszam==5043112
replace dubious=3 if i==3434 & sorszam==5140440
replace dubious=3 if i==3447 & sorszam==5013234
replace dubious=3 if i==3447 & sorszam==5012293
replace dubious=1 if i==3459 & sorszam==5036560
replace dubious=3 if i==3482 & sorszam==5161238
replace dubious=1 if i==3505 & sorszam==5201732
replace dubious=2 if i==3508 & sorszam==5540946
replace dubious=2 if i==3508 & sorszam==5580618
replace dubious=3 if i==3509 & sorszam==5500052
replace dubious=3 if i==3509 & sorszam==5294735
replace dubious=3 if i==3509 & sorszam==5259854
replace dubious=2 if i==3511 & sorszam==5414059
replace dubious=2 if i==3511 & sorszam==5294568
replace dubious=2 if i==3511 & sorszam==5341963
replace dubious=2 if i==3514 & sorszam==5244001
replace dubious=2 if i==3514 & sorszam==5268658
replace dubious=3 if i==3528 & sorszam==5400538
replace dubious=1 if i==3549 & sorszam==5017100
replace dubious=1 if i==3556 & sorszam==5141596
replace dubious=1 if i==3556 & sorszam==5268477
replace dubious=1 if i==3562 & sorszam==5191823
replace dubious=1 if i==3569 & sorszam==5189993
replace dubious=1 if i==3571 & sorszam==5352856
replace dubious=3 if i==3582 & sorszam==5470437
replace dubious=3 if i==3590 & sorszam==5120827
replace dubious=1 if i==3600 & sorszam==5449211
replace dubious=3 if i==3620 & sorszam==5228284
replace dubious=2 if i==3679 & sorszam==5240846
replace dubious=2 if i==3679 & sorszam==5240808
replace dubious=3 if i==3695 & sorszam==5047476
replace dubious=3 if i==3695 & sorszam==5047388
replace dubious=1 if i==3697 & sorszam==5208097
replace dubious=3 if i==3710 & sorszam==5258306
replace dubious=1 if i==3762 & sorszam==5280133
replace dubious=3 if i==3765 & sorszam==5294271
replace dubious=3 if i==3765 & sorszam==5141952
replace dubious=3 if i==3765 & sorszam==5413586
replace dubious=3 if i==3765 & sorszam==5531265
replace dubious=3 if i==3765 & sorszam==5141427
replace dubious=3 if i==3765 & sorszam==5387868
replace dubious=3 if i==3765 & sorszam==5013359
replace dubious=3 if i==3775 & sorszam==5401262
replace dubious=3 if i==3775 & sorszam==5589277
replace dubious=2 if i==3775 & sorszam==5141438
replace dubious=2 if i==3779 & sorszam==5216279
replace dubious=3 if i==3790 & sorszam==5268472
replace dubious=1 if i==3792 & sorszam==5370531
replace dubious=2 if i==3807 & sorszam==5245611
replace dubious=1 if i==3815 & sorszam==5016745
replace dubious=3 if i==3822 & sorszam==5574666
replace dubious=1 if i==3822 & sorszam==5375151
replace dubious=1 if i==3822 & sorszam==5408930
replace dubious=3 if i==3830 & sorszam==5153461
replace dubious=3 if i==3837 & sorszam==5206302
replace dubious=1 if i==3838 & sorszam==5245477
replace dubious=3 if i==3845 & sorszam==5381375
replace dubious=2 if i==3861 & sorszam==5578084
replace dubious=1 if i==3870 & sorszam==5174077
replace dubious=1 if i==3870 & sorszam==5174045
replace dubious=1 if i==3877 & sorszam==5543797
replace dubious=1 if i==3878 & sorszam==5037275
replace dubious=1 if i==3878 & sorszam==5142105
replace dubious=1 if i==3929 & sorszam==5341567
replace dubious=1 if i==3948 & sorszam==5534706
replace dubious=2 if i==3959 & sorszam==5448552
replace dubious=1 if i==3960 & sorszam==5362841
replace dubious=1 if i==3960 & sorszam==5375135
replace dubious=1 if i==3960 & sorszam==5052603
replace dubious=1 if i==3960 & sorszam==5578082
replace dubious=1 if i==3960 & sorszam==5428089
replace dubious=2 if i==3962 & sorszam==5229379
replace dubious=1 if i==3971 & sorszam==5022127
replace dubious=2 if i==3987 & sorszam==5503495
replace dubious=2 if i==3995 & sorszam==5325497
replace dubious=1 if i==3997 & sorszam==5413360
replace dubious=3 if i==4005 & sorszam==5021963
replace dubious=3 if i==4005 & sorszam==5316921
replace dubious=1 if i==4018 & sorszam==5245475
replace dubious=3 if i==4020 & sorszam==5578715
replace dubious=3 if i==4034 & sorszam==5254269
replace dubious=3 if i==4034 & sorszam==5413248
replace dubious=3 if i==4034 & sorszam==5507451
replace dubious=3 if i==4043 & sorszam==5131686
replace dubious=1 if i==4049 & sorszam==5280764
replace dubious=3 if i==4080 & sorszam==5268511
replace dubious=3 if i==4109 & sorszam==5387666
replace dubious=1 if i==4111 & sorszam==5216240
replace dubious=1 if i==4116 & sorszam==5310560
replace dubious=3 if i==4130 & sorszam==5365179
replace dubious=2 if i==4130 & sorszam==5543885
replace dubious=3 if i==4149 & sorszam==5322421
replace dubious=1 if i==4157 & sorszam==5429911
replace dubious=1 if i==4158 & sorszam==5543940
replace dubious=2 if i==4158 & sorszam==5199818
replace dubious=3 if i==4168 & sorszam==5519490
replace dubious=2 if i==4189 & sorszam==5534691
replace dubious=2 if i==4212 & sorszam==5500069
replace dubious=2 if i==4217 & sorszam==5374274
replace dubious=2 if i==4220 & sorszam==5449615
replace dubious=2 if i==4222 & sorszam==5039183
replace dubious=2 if i==4235 & sorszam==5413765
replace dubious=2 if i==4235 & sorszam==5427975
replace dubious=1 if i==4249 & sorszam==5129523
replace dubious=3 if i==4252 & sorszam==5592347
replace dubious=3 if i==4252 & sorszam==5017404
replace dubious=2 if i==4254 & sorszam==5216322
replace dubious=3 if i==4257 & sorszam==5368384
replace dubious=1 if i==4259 & sorszam==5520649
replace dubious=1 if i==4266 & sorszam==5428071
replace dubious=1 if i==4272 & sorszam==5224339
replace dubious=1 if i==4272 & sorszam==5310672
replace dubious=1 if i==4273 & sorszam==5193232
replace dubious=1 if i==4273 & sorszam==5207100
replace dubious=3 if i==4278 & sorszam==5190215
replace dubious=2 if i==4286 & sorszam==5520512
replace dubious=1 if i==4324 & sorszam==5543940
replace dubious=2 if i==4337 & sorszam==5161970
replace dubious=2 if i==4339 & sorszam==5368091
replace dubious=3 if i==4349 & sorszam==5183908
replace dubious=2 if i==4351 & sorszam==5209766
replace dubious=3 if i==4359 & sorszam==5228232
replace dubious=3 if i==4366 & sorszam==5497879
replace dubious=3 if i==4389 & sorszam==5401717
replace dubious=1 if i==4392 & sorszam==5216469
replace dubious=1 if i==4405 & sorszam==5017822
replace dubious=2 if i==4405 & sorszam==5230169
replace dubious=1 if i==4420 & sorszam==5232644
replace dubious=2 if i==4425 & sorszam==5147769
replace dubious=2 if i==4426 & sorszam==5294724
replace dubious=3 if i==4433 & sorszam==5043926
replace dubious=2 if i==4453 & sorszam==5464246
replace dubious=2 if i==4454 & sorszam==5129590
replace dubious=2 if i==4454 & sorszam==5022200
replace dubious=2 if i==4454 & sorszam==5422730
replace dubious=2 if i==4454 & sorszam==5123564
replace dubious=2 if i==4454 & sorszam==5154269
replace dubious=2 if i==4454 & sorszam==5526495
replace dubious=2 if i==4454 & sorszam==5209329
replace dubious=2 if i==4454 & sorszam==5422766
replace dubious=1 if i==4461 & sorszam==5223836
replace dubious=2 if i==4474 & sorszam==5564605
replace dubious=3 if i==4479 & sorszam==5429892
replace dubious=1 if i==4481 & sorszam==5013816
replace dubious=1 if i==4481 & sorszam==5022208
replace dubious=3 if i==4503 & sorszam==5200208
replace dubious=3 if i==4510 & sorszam==5399175
replace dubious=3 if i==4521 & sorszam==5168271
replace dubious=3 if i==4521 & sorszam==5316826
replace dubious=2 if i==4527 & sorszam==5158426
replace dubious=3 if i==4532 & sorszam==5565497
replace dubious=3 if i==4532 & sorszam==5190793
replace dubious=3 if i==4534 & sorszam==5387959
replace dubious=3 if i==4534 & sorszam==5344695
replace dubious=3 if i==4534 & sorszam==5413041
replace dubious=3 if i==4534 & sorszam==5206345
replace dubious=3 if i==4535 & sorszam==5496357
replace dubious=3 if i==4535 & sorszam==5190752
replace dubious=3 if i==4535 & sorszam==5511260
replace dubious=3 if i==4535 & sorszam==5508805
replace dubious=3 if i==4535 & sorszam==5504058
replace dubious=3 if i==4535 & sorszam==5560771
replace dubious=3 if i==4547 & sorszam==5497924
replace dubious=2 if i==4567 & sorszam==5402319
replace dubious=2 if i==4567 & sorszam==5184279
replace dubious=3 if i==4584 & sorszam==5505929
replace dubious=2 if i==4609 & sorszam==5555689
replace dubious=2 if i==4609 & sorszam==5280073
replace dubious=2 if i==4609 & sorszam==5413482
replace dubious=1 if i==4620 & sorszam==5579107
replace dubious=1 if i==4629 & sorszam==5342045
replace dubious=3 if i==4636 & sorszam==5039696
replace dubious=2 if i==4640 & sorszam==5368787
replace dubious=2 if i==4642 & sorszam==5375282
replace dubious=1 if i==4646 & sorszam==5409039
replace dubious=2 if i==4647 & sorszam==5043730
replace dubious=1 if i==4653 & sorszam==5048532
replace dubious=1 if i==4675 & sorszam==5206679
replace dubious=3 if i==4680 & sorszam==5202561
replace dubious=3 if i==4689 & sorszam==5539402
replace dubious=3 if i==4689 & sorszam==5070357
replace dubious=3 if i==4689 & sorszam==5494767
replace dubious=3 if i==4700 & sorszam==5558608
replace dubious=1 if i==4713 & sorszam==5305272
replace dubious=3 if i==4716 & sorszam==5259638
replace dubious=3 if i==4722 & sorszam==5295860
replace dubious=2 if i==4726 & sorszam==5394108
replace dubious=2 if i==4728 & sorszam==5129801
replace dubious=1 if i==4733 & sorszam==5585404
replace dubious=1 if i==4733 & sorszam==5585427
replace dubious=1 if i==4744 & sorszam==5383098
replace dubious=2 if i==4751 & sorszam==5142570
replace dubious=3 if i==4755 & sorszam==5380124
replace dubious=3 if i==4759 & sorszam==5531415
replace dubious=3 if i==4761 & sorszam==5228360
replace dubious=1 if i==4769 & sorszam==5565448
replace dubious=2 if i==4793 & sorszam==5404381
replace dubious=2 if i==4793 & sorszam==5141636
replace dubious=2 if i==4806 & sorszam==5279841
replace dubious=1 if i==4820 & sorszam==5519862
replace dubious=1 if i==4823 & sorszam==5519368
replace dubious=1 if i==4823 & sorszam==5519869
replace dubious=1 if i==4826 & sorszam==5259516
replace dubious=2 if i==4828 & sorszam==5012989
replace dubious=2 if i==4829 & sorszam==5542852
replace dubious=2 if i==4867 & sorszam==5053753
replace dubious=1 if i==4882 & sorszam==5017377
replace dubious=1 if i==4906 & sorszam==5257718
replace dubious=2 if i==4929 & sorszam==5578014
replace dubious=3 if i==4930 & sorszam==5409070
replace dubious=2 if i==4932 & sorszam==5212159
replace dubious=1 if i==4938 & sorszam==5154722
replace dubious=2 if i==4938 & sorszam==5048832
replace dubious=2 if i==4938 & sorszam==5273307
replace dubious=2 if i==4938 & sorszam==5006354
replace dubious=1 if i==4947 & sorszam==5190271
replace dubious=2 if i==4951 & sorszam==5017789
replace dubious=3 if i==4972 & sorszam==5498131
replace dubious=1 if i==4973 & sorszam==5132027
replace dubious=1 if i==4973 & sorszam==5471519
replace dubious=1 if i==4973 & sorszam==5129842
replace dubious=1 if i==4973 & sorszam==5450456
replace dubious=1 if i==4973 & sorszam==5017957
replace dubious=1 if i==4974 & sorszam==5082119
replace dubious=3 if i==4974 & sorszam==5070494
replace dubious=1 if i==4974 & sorszam==5030478
replace dubious=2 if i==4975 & sorszam==5217417
replace dubious=1 if i==4977 & sorszam==5121200
replace dubious=1 if i==4978 & sorszam==5518770
replace dubious=3 if i==4983 & sorszam==5280363
replace dubious=1 if i==4985 & sorszam==5324698
replace dubious=1 if i==4999 & sorszam==5469906
replace dubious=2 if i==5001 & sorszam==5500545
replace dubious=3 if i==5012 & sorszam==5141519
replace dubious=3 if i==5021 & sorszam==5153364
replace dubious=2 if i==5023 & sorszam==5430564
replace dubious=1 if i==5045 & sorszam==5204757
replace dubious=1 if i==5063 & sorszam==5161854
replace dubious=1 if i==5070 & sorszam==5052636
replace dubious=1 if i==5070 & sorszam==5211827
replace dubious=1 if i==5070 & sorszam==5474288
replace dubious=3 if i==5073 & sorszam==5589553
replace dubious=3 if i==5079 & sorszam==5370867
replace dubious=2 if i==5080 & sorszam==5535017
replace dubious=1 if i==5083 & sorszam==5022110
replace dubious=2 if i==5084 & sorszam==5560474
replace dubious=3 if i==5085 & sorszam==5558477
replace dubious=1 if i==5091 & sorszam==5428063
replace dubious=3 if i==5097 & sorszam==5202365
replace dubious=3 if i==5097 & sorszam==5202432
replace dubious=3 if i==5098 & sorszam==5037374
replace dubious=1 if i==5099 & sorszam==5531738
replace dubious=3 if i==5106 & sorszam==5560133
replace dubious=3 if i==5129 & sorszam==5474829
replace dubious=2 if i==5129 & sorszam==5430816
replace dubious=3 if i==5134 & sorszam==5037348
replace dubious=2 if i==5150 & sorszam==5208756
replace dubious=2 if i==5150 & sorszam==5034748
replace dubious=2 if i==5150 & sorszam==5589943
replace dubious=2 if i==5150 & sorszam==5006120
replace dubious=2 if i==5150 & sorszam==5541193
replace dubious=2 if i==5150 & sorszam==5213026
replace dubious=1 if i==5153 & sorszam==5503951
replace dubious=3 if i==5156 & sorszam==5021981
replace dubious=3 if i==5158 & sorszam==5228408
replace dubious=1 if i==5158 & sorszam==5495509
replace dubious=2 if i==5181 & sorszam==5038935
replace dubious=2 if i==5183 & sorszam==5037041
replace dubious=1 if i==5192 & sorszam==5590693
replace dubious=3 if i==5195 & sorszam==5481937
replace dubious=2 if i==5199 & sorszam==5173704
replace dubious=2 if i==5199 & sorszam==5422439
replace dubious=2 if i==5248 & sorszam==5392969
replace dubious=2 if i==5248 & sorszam==5454286
replace dubious=1 if i==5251 & sorszam==5381535
replace dubious=1 if i==5267 & sorszam==5520510
replace dubious=2 if i==5271 & sorszam==5368473
replace dubious=2 if i==5286 & sorszam==5578645
replace dubious=1 if i==5288 & sorszam==5121139
replace dubious=1 if i==5291 & sorszam==5243492
replace dubious=1 if i==5291 & sorszam==5244291
replace dubious=1 if i==5305 & sorszam==5349925
replace dubious=1 if i==5308 & sorszam==5268570
replace dubious=1 if i==5308 & sorszam==5430434
replace dubious=2 if i==5314 & sorszam==5229539
replace dubious=3 if i==5319 & sorszam==5161583
replace dubious=3 if i==5324 & sorszam==5159072
replace dubious=1 if i==5340 & sorszam==5157849
replace dubious=3 if i==5351 & sorszam==5208212
replace dubious=1 if i==5364 & sorszam==5204267
replace dubious=3 if i==5380 & sorszam==5043810
replace dubious=1 if i==5382 & sorszam==5505302
replace dubious=1 if i==5400 & sorszam==5120934
replace dubious=2 if i==5402 & sorszam==5316817
replace dubious=2 if i==5402 & sorszam==5341468
replace dubious=1 if i==5411 & sorszam==5520279
replace dubious=1 if i==5449 & sorszam==5430678
replace dubious=1 if i==5473 & sorszam==5520595
replace dubious=1 if i==5473 & sorszam==5039731
replace dubious=3 if i==5484 & sorszam==5224328
replace dubious=1 if i==5485 & sorszam==5052863
replace dubious=3 if i==5486 & sorszam==5153915
replace dubious=3 if i==5486 & sorszam==5581831
replace dubious=3 if i==5487 & sorszam==5330816
replace dubious=1 if i==5505 & sorszam==5510469
replace dubious=2 if i==5509 & sorszam==5363365
replace dubious=2 if i==5509 & sorszam==5544378
replace dubious=2 if i==5517 & sorszam==5203919
replace dubious=2 if i==5520 & sorszam==5241403
replace dubious=2 if i==5520 & sorszam==5241330
replace dubious=2 if i==5520 & sorszam==5495779
replace dubious=2 if i==5520 & sorszam==5204930
replace dubious=1 if i==5521 & sorszam==5501240


drop if dubious==3
egen md1=min(dubious), by(i)
drop if md1!=dubious
egen md2=min(dubious), by(sorszam)
drop if md2!=dubious



*ha egy ID-hez tobb sorszam van, az nem olyan nagy baj, mert az a kerdes hogy
*az arc jart-e iskolaba, nem az, hogy az iskolaba jarok budapesten dolgoztak-e

duplicates drop i, force

drop bijection t1 t2
gen bijection=0
duplicates tag sorszam, gen(t1)
duplicates tag i, gen(t2)
replace bijection=1 if t1==0 & t2==0

keep i dubious 
gen has_school=1

tempfile school
save `school'


use `bpp', clear

merge m:1 i using `school', gen(sc)
drop sc
replace has_school=0 if has_school==.
label define educ_match 0 "know" 1 "believe" 2 "doubt" 3 "drop"
la var dubious "EDUC - level of non-confidence put in education variable"
la val dubious educ_match
la var has_school "EDUC - dummmy - person found in high school data"

la var i "AG - alternative person id"
drop t fullname id_*
