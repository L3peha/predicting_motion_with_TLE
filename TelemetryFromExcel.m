function [motion] = TelemetryFromExcel()

T = readtable("telemetry_J2000.xlsx");      %T - (:,7) Table
vec = Telemetry2Cords(T);                   %vec - (:,7) double
motion = J20002Inercial(vec);               %motion - cords and time in inertial from J2000
end