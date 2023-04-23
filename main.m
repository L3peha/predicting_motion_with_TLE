clc; clear; close all;
format long;

init();

global TLEmks;
global TLEmksOne;
global TLEGonets;
global TLEGonetsOne;
global TLEEgipt;
global TLEEgiptOne;
global TLEWeina;
global TLEWeinaOne;
global TLEHaiyang;
global TLEHaiyangOne;

%% calculating coorrs via SGP4

[rMKS, vMKS] = TLE2coords(TLEmks);
[rMKSOne, vMKSOne] = TLE2coords(TLEmksOne);

[rGonets, vGonets] = TLE2coords(TLEGonets);
[rGonetsOne, vGonetsOne] = TLE2coords(TLEGonetsOne);

[rEgipt, vEgipt] = TLE2coords(TLEEgipt);
[rEgiptOne, vEgiptOne] = TLE2coords(TLEEgiptOne);

[rWeina, vWeina] = TLE2coords(TLEWeina);
[rWeinaOne, vWeinaOne] = TLE2coords(TLEWeinaOne);

[rHaiyang, vHaiyang] = TLE2coords(TLEHaiyang);
[rHaiyangOne, vHaiyangOne] = TLE2coords(TLEHaiyangOne);
%% Telemetry to coords


%% Ploting grafics

plotgr(rMKS,vMKS,rMKSOne,vMKSOne,1);
plotgr(rGonets,vGonets,rGonetsOne,vGonetsOne,2);
plotgr(rEgipt,vEgipt,rEgiptOne,vEgiptOne,3);
plotgr(rWeina,vWeina,rWeinaOne,vWeinaOne,4);
plotgr(rHaiyang,vHaiyang,rHaiyangOne,vHaiyangOne,5);
i=1;
