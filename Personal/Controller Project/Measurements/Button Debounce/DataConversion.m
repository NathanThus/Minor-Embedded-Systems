tiledlayout(1,2)

nexttile
load("dataButtonBare.csv")
dataButtonBare(:,2) = dataButtonBare(:,2) + 5; 
dataButtonBare(:,2) = dataButtonBare(:,2) * 10; 
hold on
title("A non-hardware debounced button")
xlabel("Data Samples (Timespace(200ms)")
ylabel("Voltage (V)")
plot(dataButtonBare(:,2))
hold off

nexttile
load("dataButtonCapZoom.csv")
dataButtonCapZoom(:,2) = dataButtonCapZoom(:,2) + 5; 
hold on
title("A hardware debounced button")
xlabel("Data Samples (Timespace(200ms)")
ylabel("Voltage (V)")
plot(dataButtonCapZoom(:,2))
hold off