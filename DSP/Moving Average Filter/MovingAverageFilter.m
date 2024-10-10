clf
var = rand(1,100);
y1 = var;
y2 = var;
buf = 0;
impulse = zeros(1, 100);
impulse(1,1:10) = 1;

y1 = FIRMovingAverage(y1, var, buf);

y2 = IIRMovingAverage(y2, var, buf);

tiledlayout(1,2);
nexttile
hold on
plot(y1, "r-")
plot(y2, "b-")
title("Moving Average Filter Comparison");
legend("FIR", "IIR")
hold off

nexttile
hold on
stem(FIRMovingAverage(y1,impulse,buf),"r-")
stem(IIRMovingAverage(y2,impulse,buf),"b-")
title("Filter Response")
legend("FIR","IIR")
hold off