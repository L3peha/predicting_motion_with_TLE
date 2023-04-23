function [vVec, rVec] = TLE2coords(TLE)

global G;
global M_of_E;
global AE;
format long;

t0 = 0;

sgp = SGP2int(TLE);
[n, temp] = size(TLE);
n = n/2;
razm = 1;
if n == 2
    t = (sgp(2,9)-sgp(1,9))*24*60+300;
    for j = 1:1:t
        time = j/60;
        [rVec(j,:), vVec(j,:)] = SGP4(t0, sgp(1,1), sgp(1,2), sgp(1,3), sgp(1,4), sgp(1,5), sgp(1,6), sgp(1,7), time, sgp(1,8));
    end
else
    for i = 1:1:n-1
        t = (sgp(i+1,9)-sgp(i,9))*24*60;
        if t==0
            continue;
        end
        for j = 1:1:t
            time = j/60;
            [r(j,:), v(j,:)] = SGP4(t0, sgp(i,1), sgp(i,2), sgp(i,3), sgp(i,4), sgp(i,5), sgp(i,6), sgp(i,7), time, sgp(i,8));
        end
        [l,w] = size(r);
        rVec(razm:razm+l-1,1:3) = r;
        vVec(razm:razm+l-1,1:3) = v;
        razm = razm+l;
        clear r v;
        if i == n-1
            for j=1:1:300
                time = j/60;
                [r(j,:), v(j,:)] = SGP4(t0, sgp(i+1,1), sgp(i+1,2), sgp(i+1,3), sgp(i+1,4), sgp(i+1,5), sgp(i+1,6), sgp(i+1,7), time, sgp(i+1,8));
            end
            [l,w] = size(r);
            rVec(razm:razm+l-1,1:3) = r;
            vVec(razm:razm+l-1,1:3) = v;
            clear r v;
        end
    end
end
end