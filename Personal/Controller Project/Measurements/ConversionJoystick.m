% Const
figHorizontalOffset = 540;
figVerticalOffset = 550;

figHorizontalIndex = 0;
figVerticalIndex = 1;
figDataLow = figure('Name','Joystick - DataLow');
figDataLow.Position(1:2) = [figHorizontalOffset * figHorizontalIndex,...
                            figVerticalOffset * figVerticalIndex];
figure(figDataLow);
load dataLow.csv
hold on
title("Rising Edge of the Joystick")
yline(0,"k-",{"0"});
xlabel("Time (us)")
plot(dataLow(:,2), "r-","LineWidth",0.1);
hold off
figHorizontalIndex = figHorizontalIndex + 1;

figDataLowPeak = figure("Name","Joystick - DataLowPeak");
figure(figDataLowPeak);
figDataLowPeak.Position(1:2) = [figHorizontalOffset * figHorizontalIndex,...
                                figVerticalOffset * figVerticalIndex];
load dataLowPeak.csv
hold on
title("Rising Edge of the Joystick")
yline(0,"k-",{"0"});
xlabel("Time (us)")
plot(dataLowPeak(:,2), "r-","LineWidth",0.1);
hold off
figHorizontalIndex = figHorizontalIndex + 1;

figDataDeadzone = figure("Name","Joystick - DataDeadzone");
figure(figDataDeadzone);
figDataDeadzone.Position(1:2) = [figHorizontalOffset * figHorizontalIndex,...
                                figVerticalOffset * figVerticalIndex];
load dataDeadzone.csv
hold on
title("Mechanical/Electric Deadzone of Joystick")
yline(-24.5,"k-",{"Neutral"});
xlabel("Time (us)")
plot(dataDeadzone(:,2), "r-","LineWidth",0.1);
hold off

figHorizontalIndex = 0;
figVerticalIndex = 0;

figDataHigh = figure("Name","Joystick - DataHigh");
figure(figDataHigh);
figDataHigh.Position(1:2) = [figHorizontalOffset * figHorizontalIndex,...
                                figVerticalOffset * figVerticalIndex];
load dataHigh.csv
hold on
title("Peak Resistance of the Joystick")
yline(-24.5,"k-",{"Neutral"});
xlabel("Time (us)")
plot(dataHigh(:,2), "r-","LineWidth",0.1);
hold off

figHorizontalIndex = figHorizontalIndex + 1;

figDataHighPeak = figure("Name","Joystick - DataHighPeak");
figure(figDataHighPeak);
figDataHighPeak.Position(1:2) = [figHorizontalOffset * figHorizontalIndex,...
                                figVerticalOffset * figVerticalIndex];
load dataHighPeak.csv
hold on
title("Zoom in on peak resistance of the Joystick")
yline(-24.5,"k-",{"Neutral"});
xlabel("Time (us)")
plot(dataHighPeak(:,2), "r-","LineWidth",0.1);
hold off