clear all
close all
clc

% DANE
A = readmatrix('excel/regulation(ISE)OnePhase.xlsx');
[w, ~] = size(A);
time = zeros(w, 1);

for i = 1:w
    time(i, 1) = i*0.3 - 0.3;
end

% WYKRESY
figure()
    subplot(3, 1, 1);
    stairs(time, A(:, 2), 'k');
    hold on;
    plot(time, A(:, 3), 'b');
    set(gca, 'FontSize', 17);
    title('przebieg temperatury', 'FontSize', 17);
    xlabel('czas, s', 'FontSize', 17);
    ylabel('tempertaura, °C', 'FontSize', 17);
    legend('wartoœæ zadana', 'wartoœæ regulowana', 'location', 'best');
    grid on;
    hold off;
    ylim([5 45]);
    xlim([0 840]);
    yticks([0 10 20 30 40]);

    subplot(3, 1, 2);
    stairs(time, A(:, 4), 'k');
    hold on;
    plot(time, A(:, 5), 'g');
    set(gca, 'FontSize', 17);
    title('przebieg przep³ywu', 'FontSize', 17);
    xlabel('czas, s', 'FontSize', 17);
    ylabel('przep³yw, l/min', 'FontSize', 17);
    legend('wartoœæ zadana', 'wartoœæ regulowana', 'location', 'best');
    grid on;
    hold off;
    xlim([0 840]);
    ylim([1.8, 2.7]);
    yticks([0 2 2.5]);

    subplot(3, 1, 3);
    plot(time, A(:, 1), 'r');
    set(gca, 'FontSize', 17);
    title('przebieg mocy', 'FontSize', 17);
    xlabel('czas, s', 'FontSize', 17);
    ylabel('moc, %', 'FontSize', 17);
    legend('wartoœæ mocy');
    grid on;
    xlim([0 840]);
    ylim([-10, 110]);
    yticks([0 20 40 60 80 100]);