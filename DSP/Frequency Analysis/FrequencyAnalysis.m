% Figure
clf
tiledlayout(2,2);

% Constants
Fs = 128;
T = 1/Fs;
L = 128;

totalSine = x128 + x64;

fourierSine = fft(totalSine);

nexttile
hold on
title("Sine Wave generated with Complex Numbers")
plot(totalSine, "k-")
plot(x128, "r--")
plot(x64, "b--")
legend("Compiled Sine Wave", "Base Wave 1", "Base Wave 2")
hold off

nexttile
hold on
title("Fourier Transform of a Sine Wave")
xlabel("Frequency (Hz)")
ylabel("FFT(X)")
plot(Fs/L*(0:L-1),abs(fourierSine),"LineWidth",3);
hold off

MAret = x64;
for ind = 1:1:Fs
    if (ind <= 10)
        MAret(ind,1) = totalSine(ind,1);
    else
        for MAInd = -10 + ind : 1 : ind
             MAret(ind,1) = MAret(MAInd, 1);
        end
        MAret(ind,1) = MAret(ind,1) / 10;
    end
end

nexttile
hold on
title("Moving Average of a sine wave")
plot(MAret)
plot(totalSine)
legend("Moving Average", "Original Sine Wave")
hold off

fourierMA = fft(MAret);

nexttile
hold on
title("Fourier Transform of the Moving Average of a Sine Wave")
xlabel("Frequency (Hz)")
ylabel("FFT(X)")
plot(Fs/L*(0:L-1), abs(fourierMA),"LineWidth",3)
hold off