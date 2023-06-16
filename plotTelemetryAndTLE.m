function [] = plotTelemetryAndTLE(Telemetr,TLE)
% Compare telemetry and 1 TLE
sgp = SGP2int(TLE);
[s, temp] = size(Telemetr);
GpsTime = (366*11+365*32-6)*24*60*60-18;
for i = 1:1:s
    if (GpsTime+sgp(1,9)*24*60*60)<Telemetr(i,7)
    [rVec(i,:), vVec(i,:)] = SGP4(0, sgp(1,1), sgp(1,2), sgp(1,3), sgp(1,4), sgp(1,5), sgp(1,6), sgp(1,7), (Telemetr(i,7)-(GpsTime+sgp(1,9)*24*60*60))/60, sgp(1,8));
end
figure(1)
t = (Telemetr(1,7)-1)*ones(s);

%x cord of telemetry and x cord of 1 TLE on 1 graphic
%plot(Telemetr(1:20000,7),Telemetr(1:20000,1),Telemetr(1:20000,7),rVec(1:20000,1))       

%difference between telemetry and TLE x coord
plot(Telemetr(1:20000,7)-t,Telemetr(1:20000,1)-rVec(1:20000,1))                          
%scatter(Telemetr(1:10000,7),abs(Telemetr(1:10000,1)-rVec(1:10000,1)))
end