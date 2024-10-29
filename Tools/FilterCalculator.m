% Constants
resistanceStart = 1000; % 100 Ohms should be a decent starting point
resistanceSteps = 1000;
resistanceMax = 1*10^6; % 100K Ohm should be a decent end point
microfarad = 1e-04; % 100 microfarad seems like a fair cutoff point.
nanofarad = 1e-09; % 1 nanofarad.

% Variables
resistance = resistanceStart:resistanceSteps:resistanceMax;
rc = resistanceStart:resistanceSteps:resistanceMax;
frequency = 500;

rc(1,1:end) = 1 / (2 * pi * frequency);
capacitance = rc ./ resistance;
capacitance(capacitance > microfarad) = [];
capacitance(capacitance < nanofarad) = [];
capacitance = capacitance .* 10^9;
resistance = resistance ./ 10^3;

hold on
plot(capacitance,resistance)
legend("Capacitance in nF", "Resistance in KΩ")
hold off