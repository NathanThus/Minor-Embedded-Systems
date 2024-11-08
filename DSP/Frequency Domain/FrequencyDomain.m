% Figure
clf
tiledlayout(2,2);

% Constants
Fs = 1024; % Frequency Samples
T = 1/Fs; % Sample Rate
L = Fs; % Length of the signal
n = 0:L-1; % All indexes
N = n * Fs / (L-1); % Plot for samples
fLow = 10; % The cutoff frequency for the Low-Pass Filter
fHigh = 75; % The cutoff frequency for the High-Pass Filter

% Frequency Generation

samples = 0:1:L - 1;
F1 = (2 * pi / L) * 5;
F2 = (2 * pi / L) * 100;

sinF1 = sin(F1 * samples);
sinF2 = sin(F2 * samples);

sinF3 = sinF1 + sinF2;

% Sine Graph
nexttile
hold on
plot(sinF3, "g-");
plot(sinF1, "b-");
plot(sinF2, "r-");
legend("Compound Sine","5Hz Signal","100Hz Signal");
title("Compund Sine Wave generated with Complex Numbers");
xlabel("Sample");
ylabel("Amplitude");
hold off


sinF3FFT = fft(sinF3);
sinF3FFT(1,L/2:end) = NaN;

% FFT Graph
nexttile
hold on
title("Compund Sine Wave generated with Complex Numbers");
xlabel("Frequency")
ylabel("FFT(X)")
plot(N,abs(sinF3FFT))
text(5,512,"\leftarrow 5Hz");
text(100,512,"\leftarrow 100Hz")
hold off

% Low-Pass Filtering and IFFT
sinF3FFT(1, fLow:end) = complex(0,0);
sinF3IFFT = real(ifft(sinF3FFT)); % Remove imaginary part

nexttile
hold on
plot(sinF3IFFT, "k-");
title("The FFT of the Compound Sine wave, filtered with a low-pass filter")
hold off

% High-Pass Filtering and IFFT
sinF3FFT = fft(sinF3); % Reset after previous
sinF3FFT(1, 1:fHigh) = complex(0,0);
sinF3IFFT = real(ifft(sinF3FFT)); % Remove imaginary part

nexttile
hold on
plot(sinF3IFFT, "k-");
title("The FFT of the Compound Sine wave, filtered with a high-pass filter")
hold off