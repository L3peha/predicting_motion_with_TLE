function [b,a] = CordShift(x,x1,n)

[t, temp] = size(x1);
for i = 1:1:t
    a(:,i) = (x1(i,n) - x(i,n));
end
b = 1:1:t;
end