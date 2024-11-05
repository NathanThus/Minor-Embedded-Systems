% Figure
clf
tiledlayout(2,2);

% Constants
Fs = 512; % Frequency Samples
T = 1/Fs; % Sample Rate
L = 512; % Length of the signal
n = 0:L-1; % All indexes
N = n * Fs / (L-1); % Plot for samples

samples = 0:1:L - 1;
F1 = (2 * pi / L) * 5;
F2 = (2 * pi / L) * 100;

sinF1 = sin(F1 * samples);
sinF2 = sin(F2 * samples);

sinF3 = sinF1 + sinF2;

nexttile
hold on
plot(sinF1, "b-");
plot(sinF2, "r-");
plot(sinF3, "g-");
legend("Compiled Sine Wave", "Base Wave 1", "Base Wave 2");
title("Sine Wave generated with Complex Numbers")
hold off

fourierF3 = fft(sinF3);

nexttile
hold on
title("Fourier Transform of a Sine Wave")
xlabel("Frequency (Hz)")
ylabel("FFT(X)")
plot(N,abs(fourierF3));
text(5,256,"\leftarrow 5Hz")
text(100,256,"\leftarrow 100Hz")
hold off

MovingAverage = movmean(sinF3,10);
nexttile
hold on
plot(MovingAverage,"k-");
plot(sinF3);
legend("Moving Average", "Original Sine Wave")
title("Moving Average of a sine wave")
hold off

fourierMA = fft(MovingAverage);
nexttile
hold on
title("Fourier Transform of the Moving Average of a Sine Wave")
xlabel("Frequency (Hz)")
ylabel("FFT(X)")
text(5,256,"\leftarrow 5Hz")
text(100,6,"\leftarrow 100Hz")
plot(N,abs(fourierMA));
hold off