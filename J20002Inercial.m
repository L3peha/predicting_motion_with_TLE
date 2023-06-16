function [motion] = J20002Inercial(vec)

[s, temp] = size(vec);
for i=1:1:s
    N = eNutation(timeProgram(vec(i,7)));
    P = ePrecession(timeProgram(vec(i,7)));
    motion(i,1:3) = N*P*vec(i,1:3)';
    motion(i,4:6) = N*P*vec(i,4:6)';
    motion(i,7) = vec(i,7); %- vec(1,7) + 1;
end
end