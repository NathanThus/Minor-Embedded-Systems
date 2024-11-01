clf
var = rand(1,100);
y1 = var;
y2 = var;
impulse = zeros(1, 100);
impulse(1,1:1) = 1;

y1 = FIRMovingAverage(y1, var);
y2 = IIRMovingAverage(y2, var);

tiledlayout(1,2);
nexttile
hold on
plot(var,"k-")
plot(y1, "r-")
plot(y2, "b-")
title("Moving Average Filter Comparison");
legend("Random Data", "FIR", "IIR")
hold off

y3 = FIRMovingAverage(y1,impulse);
y4 = IIRMovingAverage(y2,impulse);
nexttile
hold on
stem(y3,"r-")
stem(y4,"b-")
title("Filter Response")
legend("FIR","IIR")
hold off