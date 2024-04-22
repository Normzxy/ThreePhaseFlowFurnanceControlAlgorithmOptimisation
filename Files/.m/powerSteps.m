clear all
close all
clc

% DANE
A = readmatrix('excel/stepCompareOnePhase.xlsx');
B = readmatrix('excel/stepCompareThreePhase.xlsx');
[w, ~] = size(A);
time = zeros(w, 1);

for i = 1:w
    time(i, 1) = i*0.015 - 0.015;
end

figure()
    plot(time, A(:, 1), 'r');
    hold on;
    plot(time, B(:, 1), 'b');
    set(gca, 'FontSize', 20);
    title('przebieg mocy', 'FontSize', 20);
    xlabel('czas, s', 'FontSize', 20);
    ylabel('tempertaura, °C', 'FontSize', 20);
    legend('jednofazowy', 'trójfazowy', 'location', 'best');
    grid on;
    xlim([0 600]);