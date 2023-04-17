function [sgp_1] = SGP2int()
global G;
global M_of_E;
global AE;
format long;

SGPall = [["1 25544U 98067A   23085.03395788  .00026155  00000-0  47174-3 0  9996"
"2 25544  51.6428  20.5198 0005791 132.0372 331.8662 15.49561904388892"]
["1 25544U 98067A   23085.20512024  .00025932  00000-0  46768-3 0  9999"
"2 25544  51.6428  19.6722 0005752 132.2213 207.1276 15.49569968388914"]
["1 25544U 98067A   23085.29744338  .00025913  00000-0  46726-3 0  9996"
"2 25544  51.6429  19.2151 0005757 132.7658   1.9442 15.49574754388936"]
["1 25544U 98067A   23085.52840278  .00025950  00000-0  46772-3 0  9994"
"2 25544  51.6429  18.0711 0005750 133.4196 210.5462 15.49586962388960"]
["1 25544U 98067A   23085.74047939  .00025770  00000-0  46437-3 0  9999"
"2 25544  51.6427  17.0209 0005769 134.2033 313.6164 15.49597137389004"]
["1 25544U 98067A   23085.93976041  .00025289  00000-0  45576-3 0  9993"
"2 25544  51.6429  16.0339 0005803 135.0013 345.2444 15.49604929389038"]
["1 25544U 98067A   23086.00105795  .00025292  00000-0  45576-3 0  9996"
"2 25544  51.6429  15.7303 0005803 135.2275 327.1976 15.49608083389042"]
["1 25544U 98067A   23086.20188432  .00024982  00000-0  45015-3 0  9990"
"2 25544  51.6429  14.7356 0005804 135.3885   8.0988 15.49616489389078"]
["1 25544U 98067A   23086.33125476  .00024988  00000-0  45015-3 0  9999"
"2 25544  51.6429  14.0948 0005803 135.8715   9.8026 15.49623065389096"]
["1 25544U 98067A   23086.56083333  .00024998  00000-0  45015-3 0  9990"
"2 25544  51.6429  12.9576 0005803 136.6906 210.5712 15.49634740389120"]
["1 25544U 98067A   23086.70684053  .00025005  00000-0  45015-3 0  9992"
"2 25544  51.6429  12.2344 0005803 137.2655 305.0646 15.49642167389155"]
["1 25544U 98067A   23086.89170262  .00024411  00000-0  43958-3 0  9998"
"2 25544  51.6430  11.3198 0005882 137.9718 256.3172 15.49647840389186"]
["1 25544U 98067A   23087.11709491  .00024030  00000-0  43273-3 0  9993"
"2 25544  51.6427  10.2045 0005925 139.0622  73.4557 15.49656807389218"]
["1 25544U 98067A   23087.16975413  .00023901  00000-0  43043-3 0  9998"
"2 25544  51.6428   9.9440 0005938 139.8250   6.6590 15.49658790389221"]
["1 25544U 98067A   23087.42115834  .00023149  00000-0  41707-3 0  9999"
"2 25544  51.6429   8.7001 0005782 139.9496 329.9825 15.49667684389260"]
["1 25544U 98067A   23087.49332566  .00022535  00000-0  40622-3 0  9992"
"2 25544  51.6427   8.3435 0005908 141.1668  11.6352 15.49668820389275"]
["1 25544U 98067A   23087.56265429  .00023174  00000-0  41740-3 0  9995"
"2 25544  51.6429   7.9993 0005796 140.4783  39.3557 15.49674467389285"]
["1 25544U 98067A   23087.67332255  .00023018  00000-0  41458-3 0  9992"
"2 25544  51.6429   7.4513 0005888 141.6160 296.0251 15.49679008389304"]
["1 25544U 98067A   23087.74403900  .00023558  00000-0  42403-3 0  9996"
"2 25544  51.6437   7.1017 0005533 141.6175 330.8107 15.49685431389317"]
["1 25544U 98067A   23087.87270052  .00029877  00000-0  53474-3 0  9990"
"2 25544  51.6420   6.4657 0005772 142.1937 328.5238 15.49707242389334"]
["1 25544U 98067A   23088.08098380  .00030532  00000-0  54595-3 0  9991"
"2 25544  51.6421   5.4335 0005829 143.4013  50.0954 15.49721800389360"]
["1 25544U 98067A   23088.26221505  .00024873  00000-0  44665-3 0  9996"
"2 25544  51.6425   4.5351 0005716 143.4859 341.7493 15.49718085389397"]
["1 25544U 98067A   23088.46018744  .00049479  00000-0  87606-3 0  9998"
"2 25544  51.6432   3.5570 0005809 146.3940   4.1326 15.49773635389424"]
["1 25544U 98067A   23088.63976610  .00039281  00000-0  69794-3 0  9990"
"2 25544  51.6427   2.6677 0005712 146.1232 286.9579 15.49778825389450"]
["1 25544U 98067A   23088.77333606  .00037436  00000-0  66556-3 0  9990"
"2 25544  51.6424   2.0057 0005658 147.0295 311.7514 15.49784665389478"]
["1 25544U 98067A   23088.83886978  .00037791  00000-0  67162-3 0  9990"
"2 25544  51.6424   1.6813 0005687 147.1679 317.4832 15.49790316389489"]
["1 25544U 98067A   23089.01611083  .00036782  00000-0  65377-3 0  9999"
"2 25544  51.6426   0.8034 0005589 146.7746 227.3966 15.49800708389516"]
["1 25544U 98067A   23089.07075666  .00036111  00000-0  64198-3 0  9992"
"2 25544  51.6427   0.5328 0005588 147.8833 171.3701 15.49802746389517"]
["1 25544U 98067A   23089.17170997  .00030110  00000-0  53719-3 0  9996"
"2 25544  51.6425   0.0310 0005885 149.0909  13.7638 15.49793248389535"]
["1 25544U 98067A   23089.35406344  .00030332  00000-0  54083-3 0  9995"
"2 25544  51.6427 359.1282 0006014 149.8412 311.0895 15.49805318389569"]
["1 25544U 98067A   23089.49590255  .00035268  00000-0  62668-3 0  9996"
"2 25544  51.6426 358.4274 0005296 149.2000  23.6456 15.49830654389581"]
["1 25544U 98067A   23089.80973234  .00211559  00000-0  37048-2 0  9995"
"2 25544  51.6400 356.8793 0007573 138.6476 346.0489 15.49289518389631"]
["1 25544U 98067A   23090.06917057  .00058902  00000-0  10570-2 0  9998"
"2 25544  51.6422 355.5946 0007202 138.1517 354.5009 15.49307915389679"]
["1 25544U 98067A   23090.19783697 -.00125339  00000-0 -22800-2 0  9993"
"2 25544  51.6417 354.9554 0007332 134.3235 356.4299 15.49256375389697"]
["1 25544U 98067A   23090.26496853  .00041671  00000-0  75140-3 0  9996"
"2 25544  51.6417 354.6242 0007057 138.0418   7.4011 15.49322954389700"]
["1 25544U 98067A   23090.76183388  .00017229  00000-0  31641-3 0  9997"
"2 25544  51.6406 352.1611 0006947 137.2277 261.3232 15.49324580389783"]
["1 25544U 98067A   23090.84004966  .00014813  00000-0  27326-3 0  9991"
"2 25544  51.6407 351.7737 0006940 137.5615 337.5280 15.49323868389798"]
["1 25544U 98067A   23091.10374725  .00020749  00000-0  37896-3 0  9992"
"2 25544  51.6419 350.4695 0007223 140.3984   6.4707 15.49341873389833"]
["1 25544U 98067A   23091.17029035  .00023476  00000-0  42744-3 0  9998"
"2 25544  51.6420 350.1410 0007132 140.7394  17.5318 15.49349165389849"]
["1 25544U 98067A   23091.23198343  .00023540  00000-0  42854-3 0  9998"
"2 25544  51.6420 349.8358 0007165 140.8187   1.7826 15.49352136389854"]
["1 25544U 98067A   23091.53994771  .00023685  00000-0  43089-3 0  9991"
"2 25544  51.6420 348.3110 0007164 141.9683 279.4987 15.49367168389905"]
["1 25544U 98067A   23091.72859833  .00024430  00000-0  44398-3 0  9994"
"2 25544  51.6420 347.3766 0007150 142.6031 251.8064 15.49378139389934"]
["1 25544U 98067A   23091.93205159  .00023522  00000-0  42772-3 0  9998"
"2 25544  51.6423 346.3693 0007132 143.3495 306.6210 15.49385665389964"]
["1 25544U 98067A   23092.03729512  .00023181  00000-0  42160-3 0  9996"
"2 25544  51.6424 345.8486 0007082 143.7445 173.6379 15.49389682389974"]
["1 25544U 98067A   23092.19857081  .00023445  00000-0  42617-3 0  9996"
"2 25544  51.6427 345.0502 0007074 144.3638 353.1809 15.49398123390009"]
["1 25544U 98067A   23092.46085029  .00023404  00000-0  42526-3 0  9995"
"2 25544  51.6427 343.7517 0007074 145.3107  16.1565 15.49410436390043"]
["1 25544U 98067A   23092.50670376  .00023415  00000-0  42541-3 0  9994"
"2 25544  51.6427 343.5246 0007066 145.4812 271.9203 15.49412667390054"]
["1 25544U 98067A   23092.70717598  .00027209  00000-0  49259-3 0  9992"
"2 25544  51.6443 342.5350 0006931 145.2796 311.0730 15.49425987390089"]
["1 25544U 98067A   23092.89923959  .00027220  00000-0  49259-3 0  9995"
"2 25544  51.6443 341.5840 0006930 145.9946 302.3873 15.49436603390117"]];
for i = 2:2:length(SGPall)
    a2  = [SGPall(i-1) SGPall(i)];
    [a1 , a2] = strtok(a2);
    [a1 , a2] = strtok(a2);
    [a1 , a2] = strtok(a2);
    i0 = str2double(a1(2)) * pi / 180.0;
    [a1 , a2] = strtok(a2);
    time = str2double(a1(1))-23000;
    W0 = str2double(a1(2)) * pi / 180.0;
    [a1 , a2] = strtok(a2);
    e0 = str2double(a1(2))/(10^strlength(a1(2)));
    [a1 , a2] = strtok(a2);
    w0 = str2double(a1(2)) * pi / 180.0;
    [a1 , a2] = strtok(a2);
    M0 = str2double(a1(2)) * pi / 180.0;
    [Bmain, bex] = strtok(a1(1),'-');
    B = (str2double(Bmain)/(10^strlength(Bmain)))*10^(str2double(bex));
    [a1 , a2] = strtok(a2);
    n0 =  round(str2double(a1(2)) * (10^8))/(10^8) *2*pi/1440;
    T = 86400.0/n0;
    perigee = (pow(pow(T, 2) * G * M_of_E / (4 * pow(pi, 2)), 1.0 / 3.0) * (1 - e0)) / 1000.0 - AE;

    sgp_1(i/2,1) = B;
    sgp_1(i/2,2) = i0;
    sgp_1(i/2,3) = W0;
    sgp_1(i/2,4) = e0;
    sgp_1(i/2,5) = w0;
    sgp_1(i/2,6) = M0;
    sgp_1(i/2,7) = n0;
    sgp_1(i/2,8) = perigee;
    sgp_1(i/2,9) = time;
end
end