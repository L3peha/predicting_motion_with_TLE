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
global TLETemp;

%% calculating coorrs via SGP4

%[rMKS, vMKS] = TLE2coords(TLEmks);
%[rMKSOne, vMKSOne] = TLE2coords(TLEmksOne);

%[rGonets, vGonets] = TLE2coords(TLEGonets);
%[rGonetsOne, vGonetsOne] = TLE2coords(TLEGonetsOne);

%[rEgipt, vEgipt] = TLE2coords(TLEEgipt);
%[rEgiptOne, vEgiptOne] = TLE2coords(TLEEgiptOne);

%[rWeina, vWeina] = TLE2coords(TLEWeina);
%[rWeinaOne, vWeinaOne] = TLE2coords(TLEWeinaOne);

%[rHaiyang, vHaiyang] = TLE2coords(TLEHaiyang);
%[rHaiyangOne, vHaiyangOne] = TLE2coords(TLEHaiyangOne);
%% Telemetry to coords


motionOfMksJ2000 = TelemetryFromExcel();            
%taken data from excel and condert to vec(:,7) 
plotTelemetryAndTLE(motionOfMksJ2000,TLETemp);    
% (:,1) - x coord;   (:,2) -y coord;  (:,3) - z coord; (:,4) - vX; (:,5) - vY;  (:,6) - vZ; (:,7) - time in seconds from 1st coordinate
[s, temp] = size(motionOfMksJ2000);
time = 1:1:s;
for i=1:1:s
    x(:,i) = motionOfMksJ2000(i,1);
end
%figure(1)
%plot(motionOfMksJ2000(:,7),x)

%% Ploting grafics

%plotgr(rMKS,vMKS,rMKSOne,vMKSOne,'MKS');
%plotgr(rGonets,vGonets,rGonetsOne,vGonetsOne,'Gonets');
%plotgr(rEgipt,vEgipt,rEgiptOne,vEgiptOne,'Egipt');
%plotgr(rWeina,vWeina,rWeinaOne,vWeinaOne,'Weina');
%plotgr(rHaiyang,vHaiyang,rHaiyangOne,vHaiyangOne,'Haiyang');
i=1;

