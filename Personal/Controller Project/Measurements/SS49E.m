load("dataHALSS49E.csv")
hold on
title("Measurement of Voltage/Distance with an SS49E")
xlabel("Distance (cm)")
ylabel("Voltage (V)")
txt = '\leftarrow Cutoff point';
text(4.6,1.75,txt);
plot(dataHALSS49E(:,1),dataHALSS49E(:,2), "r-")
hold off