function [rOut, vOut] = SGP4(t0, B, i0, W0, e0, w0, M0, n0, t, perigee)
%SGP4 Преобразование TLE в коррдинаты КА в определнный момент времени
global G;               
global M_of_E;          
global k2;              
global k4;              
global AE;              
global aE;              
global XKMPER;          
global J3;              


%%
ke = 0.743669161E-1;
a1 = pow((ke / (n0)), (2.0 / 3.0));
delta1 = (3 * k2 * (3 * pow(cos(i0), 2.0) - 1.0)) / (2.0 * pow(a1, 2.0) * pow((1.0 - pow(e0, 2.0)), 3.0 / 2.0));
a0 = a1 * (1 - delta1 / 3.0 - pow(delta1, 2.0) - 134.0 * pow(delta1, 3.0) / 81.0);
delta0 = delta1 * pow(a1, 2.0) / pow(a0, 2.0);
n0__ = n0 / (1.0 + delta0);
a0__ = a0 / (1.0 - delta0);
QOMS2T = 1.88027916 * pow(10.0, -9.0);

%%
s = 1.01222928;
if (perigee >= 98 && perigee <= 156)
    s = a0__ * (1 - e0) - s + aE;
    QOMS2T = pow((pow(pow(QOMS2T, 1 / 4.0), 4) + 1.01222928 - s), 4);
end
if (perigee < 98)
    s = 20.0 / XKMPER + aE;
    QOMS2T = pow((pow(pow(QOMS2T, 1 / 4.0), 4) + 1.01222928 - s), 4);
end

%%
thetta = cos(i0);
ksi = 1.0 / (a0__ - s);
betta0 = pow(1 - pow(e0, 2), 1.0 / 2.0);
nu = a0__ * e0 * ksi;
C2 = QOMS2T * pow(ksi, 4) * n0__ * pow((1 - pow(nu, 2)), -7.0 / 2.0) * ...
        (a0__ * ((1 + 3 * pow(nu, 2) / 2) + 4 * e0 * nu + e0 * pow(nu, 3)) + 3 * k2 * ksi * ...
            (8 + 24 * pow(nu, 2) + 3 * pow(nu, 4)) * (1.5 * pow(thetta, 2) - 0.5) / (2 * (1 - pow(nu, 2))));
C1 = B * C2;
C3 = QOMS2T * pow(ksi, 5) * (-J3 * pow(aE, 3)) * n0__ * aE * sin(i0) / (k2 * e0);
C4 = 2 * n0__ * QOMS2T * pow(ksi, 4) * a0__ * pow(betta0, 2) * pow(1.0 - pow(nu, 2), -7.0 / 2.0) * ...
        ((2 * nu * (1 + e0 * nu) + e0 / 2 + pow(nu, 3.0) / 2.0) - 2.0 * k2 * ksi * ...
            (3 * (1 - 3 * pow(thetta, 2)) * (1 + 3 * pow(nu, 2) / 2 - 2 * e0 * nu - e0 * pow(nu, 3) / 2) + 3 * (1 - pow(thetta, 2)) * ...
                (2 * pow(nu, 2) - e0 * nu - e0 * pow(nu, 3)) * cos(2 * w0) / 4) / (a0__ * (1 - pow(nu, 2))));
C5 = 2 * QOMS2T * pow(ksi, 4) * a0__ * pow(betta0, 2) * pow((1 - pow(nu, 2)), -7.0 / 2.0) * (1 + 11 * nu * (nu + e0) / 4 + e0 * pow(nu, 3));

D2 = 4 * a0__ * ksi * pow(C1, 2);
D3 = 4 * a0__ * pow(ksi, 2) * (17 * a0__ + s) * pow(C1, 3) / 3;
D4 = 2 * a0__ * pow(ksi, 3) * (221 * a0__ + 31 * s) * pow(C1, 4) / 3.0;

%%
M_DF = M0 + (1 + 3 * k2 * (-1 + 3 * pow(thetta, 2)) / (2 * pow(a0__, 2) * pow(betta0, 3)) + ...
        3 * k2 * k2 * (13 - 78 * pow(thetta, 2) + 137 * pow(thetta, 4)) / (16 * pow(a0__, 4) * pow(betta0, 7))) * n0__ * (t - t0);
w_DF = w0 + ((-3) * k2 * (1 - 5 * pow(thetta, 2)) / (2 * pow(a0__, 2) * pow(betta0, 4)) + ...
        3 * k2 * k2 * (7 - 114 * pow(thetta, 2) + 395 * pow(thetta, 4)) / (16 * pow(a0__, 4) * pow(betta0, 8)) + ...
        5 * k4 * (3 - 36 * pow(thetta, 2) + 49 * pow(thetta, 4)) / (4 * pow(a0__, 4) * pow(betta0, 8))) * n0__ * (t - t0);
W_DF = W0 + (-3 * k2 * thetta / (pow(a0__, 2) * pow(betta0, 4)) + 3 * pow(k2, 2) * (4 * thetta - 19 * pow(thetta, 3)) / (2 * pow(a0__, 4) * pow(betta0, 8)) + ...
        5 * k4 * thetta * (3 - 7 * pow(thetta, 2)) / (2 * pow(a0__, 4) * pow(betta0, 8))) * n0__ * (t - t0);
deltaw = B * C3 * cos(w0) * (t - t0);
deltaM = -2 * QOMS2T * B * pow(ksi, 4) * aE * (pow((1 + nu * cos(M_DF)), 3) - pow((1 + nu * cos(M0)), 3)) / (3 * e0 * nu);
Mp = M_DF + deltaw + deltaM;
w = w_DF - deltaw - deltaM;
W = W_DF - 21 * n0__ * k2 * thetta * C1 * pow((t - t0), 2) / (2 * pow(a0__, 2) * pow(betta0, 2));
e = e0 - B * C4 * (t - t0) - B * C5 * (sin(Mp) - sin(M0));
a = a0__ * pow(1 - C1 * (t - t0) - D2 * pow((t - t0), 2) - D3 * pow(t - t0, 3) - D4 * pow(t - t0, 4), 2);
L = Mp + w + W + n0__ * (3.0 * C1 * pow(t - t0, 2) / 2.0 + (D2 + 2.0 * pow(C1, 2)) * pow(t - t0, 3) + ...
        (3.0 * D3 + 12.0 * C1 * D2 + 10.0 * pow(C1, 3)) * pow(t - t0, 4) / 4.0 + ...
        (3.0 * D4 + 12.0 * C1 * D3 + 6.0 * pow(D2, 2) + 30.0 * pow(C1, 2) * D2 + 15.0 * pow(C1, 4)) * pow(t - t0, 5) / 5.0);

if (perigee <= 220)
    a = a0__ * pow(1 - C1 * (t - t0), 2);
    L = Mp + w + W + n0__ * 3 * C1 * pow(t - t0, 2) / 2;
    Mp = M_DF;
    w = w_DF;
    e = e0 - B * C4 * (t - t0);
end

%%
betta = sqrt(1 - pow(e, 2));
n = ke / pow(a, 3.0 / 2);
axN = e * cos(w);
L_L = -J3 * pow(aE, 3) * sin(i0) * axN * (3 + 5 * thetta) / (8 * k2 * a * pow(betta, 2) * (1 + thetta));
a_yNL = -J3 * pow(aE, 3) * sin(i0) / (4 * k2 * a * pow(betta, 2));
L_T = L + L_L;
a_yN = e * sin(w) + a_yNL;
%% Уравнение Кеплера для E+w
U = L_T - W;
temp1 = U - 1;
temp2 = U;
while ((temp2 - temp1) > 1E-12)
    temp1 = temp2;
    temp2 = temp1 + (U - a_yN * cos(temp1) + axN * sin(temp1) - temp1) / (-a_yN * sin(temp1) - axN * cos(temp1) + 1);
end
E = temp2 - w;

%% short-period periodics
ecosE = axN * cos(E + w) + a_yN * sin(E + w);
esinE = axN * sin(E + w) - a_yN * cos(E + w);
eL = pow(pow(axN, 2) + pow(a_yN, 2), 0.5);
pL = a * (1 - pow(eL, 2));
r = a * (1 - ecosE);
r_ = ke * sqrt(a) * esinE / r;
rf_ = ke * sqrt(pL) / r;
cosu = a * (cos(E + w) - axN + a_yN * esinE / (1 + sqrt(1 - pow(eL, 2)))) / r;
sinu = a * (sin(E + w) - a_yN - axN * esinE / (1 + sqrt(1 - pow(eL, 2)))) / r;
u = atan(sinu / cosu);
if (cosu < 0 && sinu > 0)
    u = pi + u;
end
if (cosu > 0 && sinu < 0)
    u = 2 * pi + u;
end
if (cosu < 0 && sinu < 0)
    u = pi + u;
end

%%
Dr = k2 * (1 - pow(thetta, 2)) * cos(2 * u) / (2 * pL);
Du = (-k2) * (7 * pow(thetta, 2) - 1) * sin(2 * u) / (4 * pow(pL, 2));
DW = 3 * k2 * thetta * sin(2 * u) / (2 * pow(pL, 2));
Di = 3 * k2 * thetta * sin(i0) * cos(2 * u) / (2.0 * pow(pL, 2));
Dr_ = -k2 * n * (1 - pow(thetta, 2)) * sin(2 * u) / pL;
Drf_ = k2 * n * ((1 - pow(thetta, 2)) * cos(2 * u) - 3 * (1 - 3 * pow(thetta, 2)) / 2.0) / pL;

%% The short-period periodics are added to give the osculating quantities
rk = AE * (r * (1 - 3 * k2 * sqrt(1 - pow(eL, 2)) * (3 * pow(thetta, 2) - 1) / (2 * pow(pL, 2))) + Dr);
uk = u + Du;
Wk = W + DW;
ik = i0 + Di;
rk_ = (r_ + Dr_) * AE /60.0; 
rfk_ = (rf_ + Drf_) * AE/ 60.0;

%% Положение и скорость
rOut = [ rk * (-sin(Wk) * cos(ik) * sin(uk) + cos(Wk) * cos(uk)),
                   rk * (cos(Wk) * cos(ik) * sin(uk) + sin(Wk) * cos(uk)),
                   rk * sin(ik) * sin(uk) ];
vOut = [rk_ * (-sin(Wk) * cos(ik) * sin(uk) + cos(Wk) * cos(uk)) + rfk_ * (-sin(Wk) * cos(ik) * cos(uk) - cos(Wk) * sin(uk))
                rk_ * (cos(Wk) * cos(ik) * sin(uk) + sin(Wk) * cos(uk)) + rfk_ * (cos(Wk) * cos(ik) * cos(uk) - sin(Wk) * sin(uk))
                rk_ * sin(ik) * sin(uk) + rfk_ * sin(ik) * cos(uk)];
end