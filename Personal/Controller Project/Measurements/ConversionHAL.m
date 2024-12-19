load("dataHALPositivePole.csv")
dataHALPositivePole(:,2) = dataHALPositivePole(:,2) + 5; % Ensures it's back to the right voltage due to scope display
hold on
title("SS49E HAL Effect Sensor Positive Pole")
xlabel("Time (uS)")
ylabel("Voltage (V)")
plot(dataHALPositivePole(:,2), "r-")
hold off