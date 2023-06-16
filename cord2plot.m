function [t, x] = cord2plot(vec,cord)

[t1, temp] = size(vec);
for i=1:1:t1
    x(:,i) = vec(i,cord);
end

t = 1:t1;
end