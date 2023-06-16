function [vec] = Telemetry2Cords(table)

for j=3:1:8
    T1 = table2array(table(:,j));
    T2 = str2double(T1);
    vec(:,(j-2)) = T2;
end
vec(:,7) = table2array(table(:,9));
end