function [sgp_1] = SGP2int(SGPall)
global G;
global M_of_E;
global AE;
format long;


for i = 2:2:length(SGPall)
    a2  = [SGPall(i-1) SGPall(i)];
    [a1 , a2] = strtok(a2);
    [a1 , a2] = strtok(a2);
    [a1 , a2] = strtok(a2);
    i0 = str2double(a1(2)) * pi / 180.0;
    [a1 , a2] = strtok(a2);
    time = str2double(a1(1))-23000;
    %date(1) = round(time/30);
    %date(2) = round(time-date(1));
    %date(3) = round((time-date(1)-date(2))*24);
    %date(4) = round((time-date(1)-date(2)-date(3))*60);
    %date(5) = round((time-date(1)-date(2)-date(3)-date(4))*60);
    %referenceTime = datenum(2023,date(1),date(2),date(3),date(4),date(5));
    W0 = str2double(a1(2)) * pi / 180.0;
    [a1 , a2] = strtok(a2);
    e0 = str2double(a1(2))/(10^strlength(a1(2)));
    [a1 , a2] = strtok(a2);
    w0 = str2double(a1(2)) * pi / 180.0;
    [a1 , a2] = strtok(a2);
    M0 = str2double(a1(2)) * pi / 180.0;
    [Bmain, bex] = strtok(a1(1),'-');
    B = (str2double(Bmain)/(10^strlength(Bmain)))*10^(str2double(bex));
    if false==isinteger(B)
        B=0;
    end
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