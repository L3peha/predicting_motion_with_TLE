function [] = init()
%init объявленеи всех констант

global G;               % <-
global M_of_E;          % <-
global k2;              % <-
global k4;              % <-
global AE;              % <-
global aE;              % <-
global XKMPER;          % <-
global J3;              % <-


%% Объявление онсновных констант
G = 6.67e-11;          
M_of_E = 5.9722e24;    
k2 = 5.413080e-4;
k4 = 0.62098875e-6;
AE = 6378.135;           
aE = 1.0;
XKMPER = 6.378135e3;
J3 = -0.253881e-5;
end