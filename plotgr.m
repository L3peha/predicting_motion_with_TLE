function [] = plotgr(r,v,r1,v1,name)
figure(1)
[a, b] = cord2plot(r1,1);
[a1, b1] = cord2plot(r,1);
plot(a,b,a1,b1)
%[t1, temp] = size(r);
%tempo = 0;
%j=1;
%for i=1:1:t1
%    abs(r(i,1)-r1(i,1))
%    tempo = tempo + abs(r(i,1)-r1(i,1));
%    if mod(i,48) == 0 
%        tempofin(:,j) = tempo/48;
%        j = j + 1;
%        tempo = 0;
%    end
%end

figure('name',name,NumberTitle='off')
set(gcf, 'Position', get(0, 'Screensize'));
subplot(3,2,1)
%[a, b] = cord2plot(r1,1);
%[a1, b1] = cord2plot(r,1);
%plot(a,b,a1,b1)
[a, b] = CordShift(r,r1,1);
plot(a,b)
grid on
title('x coord difference')
legend('dx')
xlabel('time, min/20')
ylabel('coords, km')
subplot(3,2,2)
%[a, b] = cord2plot(v1,1);
%[a1, b1] = cord2plot(v,1);
[a, b] = CordShift(v,v1,1);
plot(a,b)
grid on
title('x speed difference')
legend('dVx')
xlabel('time, min/20')
ylabel('velocity, km/s')
subplot(3,2,3)
%[a, b] = cord2plot(r1,2);
%[a1, b1] = cord2plot(r,2);
[a, b] = CordShift(r,r1,2);
plot(a,b)
grid on
title('y coord difference')
legend('dy')
xlabel('time, min/20')
ylabel('coords, km')
subplot(3,2,4)
%[a, b] = cord2plot(v1,2);
%[a1, b1] = cord2plot(v,2);
[a, b] = CordShift(v,v1,2);
plot(a,b)
grid on
title('y speed difference')
legend('dVy')
xlabel('time, min/20')
ylabel('velocity, km/s')
subplot(3,2,5)
%[a, b] = cord2plot(r1,3);
%[a1, b1] = cord2plot(r,3);
[a, b] = CordShift(r,r1,3);
plot(a,b)
grid on
title('z coord difference')
legend('dz')
xlabel('time, min/20')
ylabel('coords, km')
subplot(3,2,6)
%[a, b] = cord2plot(v1,3);
%[a1, b1] = cord2plot(v,3);
[a, b] = CordShift(v,v1,3);
plot(a,b)
grid on
title('z speed difference')
legend('dVz')
xlabel('time, min/20')
ylabel('velocity, km/s')
end