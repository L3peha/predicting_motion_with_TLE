clc; clear; close all;
format long;

init();

global G;
global M_of_E;
global AE;

t0 = 0;
t = 1440 / 60.0;

sgp = SGP2int();
n = 49;
razm = 1;
for i = 2:1:n
    t = (sgp(i,9)-sgp(i-1,9))*24*60;
    for j = 1:1:t
        time = j/60;
        [r(j,:), v(j,:)] = SGP4(t0, sgp(i,1), sgp(i,2), sgp(i,3), sgp(i,4), sgp(i,5), sgp(i,6), sgp(i,7), time, sgp(i,8));
    end
    [l,w] = size(r);
    rVec(razm:razm+l-1,1:3) = r;
    vVec(razm:razm+l-1,1:3) = v;
    razm = razm+l;
    clear r v;
end
%true ecvator enutation
i=1;
