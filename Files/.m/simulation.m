clear all
close all
clc

% DANE
A = readmatrix('excel/controlOnePhase(50).xlsx');
[w, ~] = size(A);
time = zeros(w, 1);

for i = 1:w
    time(i, 1) = i*10 - 10;
end

% WYKRESY
figure()
    subplot(3, 1, 1);
    stairs(time, A(:, 1), 'r');
    set(gca, 'FontSize', 17);
    title('Praca pierwszej grza³ki', 'FontSize', 17);
    xlabel('Czas (ms)', 'FontSize', 17);
    ylabel('Stan', 'FontSize', 17);
    ylim([-0.2, 1.2]);
    yticks([0 1]);

    subplot(3, 1, 2);
    stairs(time, A(:, 2), 'g');
    set(gca, 'FontSize', 17);
    title('Praca drugiej grza³ki', 'FontSize', 17);
    xlabel('Czas (ms)', 'FontSize', 17);
    ylabel('Stan', 'FontSize', 17);
    ylim([-0.2, 1.2]);
    yticks([0 1]);

    subplot(3, 1, 3);
    stairs(time, A(:, 3), 'b');
    ylim([-0.2, 1.2]);
    yticks([0 1]);
    set(gca, 'FontSize', 17);
    title('Praca trzeciej grza³ki', 'FontSize', 17);
    xlabel('Czas (ms)', 'FontSize', 17);
    ylabel('Stan', 'FontSize', 17);
    ylim([-0.2, 1.2]);
    yticks([0 1]);