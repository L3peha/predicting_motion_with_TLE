function [] = plotgr(r,v,r1,v1,i)

figure(i)
t = tiledlayout(3,2);
nexttile
[a, b] = cord2plot(r1,1);
[a1, b1] = cord2plot(r,1);
plot(a,b,a1,b1)
nexttile
[a, b] = cord2plot(v1,1);
[a1, b1] = cord2plot(v,1);
plot(a,b,a1,b1)
nexttile
[a, b] = cord2plot(r1,2);
[a1, b1] = cord2plot(r,2);
plot(a,b,a1,b1)
nexttile
[a, b] = cord2plot(v1,2);
[a1, b1] = cord2plot(v,2);
plot(a,b,a1,b1)
nexttile
[a, b] = cord2plot(r1,3);
[a1, b1] = cord2plot(r,3);
plot(a,b,a1,b1)
nexttile
[a, b] = cord2plot(v1,3);
[a1, b1] = cord2plot(v,3);
plot(a,b,a1,b1)
end