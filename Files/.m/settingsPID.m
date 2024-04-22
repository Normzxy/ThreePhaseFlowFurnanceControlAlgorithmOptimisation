clear all
close all
clc

% DANE
A = readmatrix('excel/powerStep.xlsx');
[w, ~] = size(A);
time = zeros(w, 1);

for i = 1:w
    time(i, 1) = i*0.010 - 0.010;
end

% PID
ymin = min(A(:, 1));
ymax = max(A(:, 1));
dy = ymax - ymin;
y28 = 0.283*dy;
y63 = 0.632*dy;

figure()
    plot(time, (A(:, 1) - ymin), 'r');
    set(gca, 'FontSize', 20);
    title('Odpowiedü skokowa uk≥adu', 'FontSize', 20);
    xlabel('czas, s', 'FontSize', 20);
    ylabel('temperatura, ∞C', 'FontSize', 20);
    yticklabels((get(gca, 'YTick')' + ymin - 0.0092));
    grid on;

    yline(y28, '--', 'Color', 'b', 'Label', '28,3%', 'FontSize', 20);

    yline(y63, '--', 'Color', 'm', 'Label', '63,2%', 'FontSize', 20);

    [~, idx_y28] = min(abs((A(:, 1) - ymin) - y28));
    t1 = time(idx_y28);

    [~, idx_y63] = min(abs((A(:, 1) - ymin) - y63));
    t2 = time(idx_y63);

    hold on;
    scatter(t1, y28, 'Marker', 'o', 'MarkerEdgeColor', 'b', 'LineWidth', 2, 'DisplayName', 'Sample y28');
    text(t1, y28, ['  (' num2str(t1) ' s, ' num2str(y28 + ymin) ')'], 'FontSize', 20);

    scatter(t2, y63, 'Marker', 'o', 'MarkerEdgeColor', 'm', 'LineWidth', 2, 'DisplayName', 'Sample y63');
    text(t2, y63, [' (' num2str(t2) ' s, ' num2str(y63 + ymin) ')'], 'FontSize', 20);
    hold off;

% PID
du = 100;
k = dy/du;
T = (1.5)*(t2 - t1)
To = t2 - T

% METODY STROJENIA
disp('Cohen-Coon')
alfa = To/T
kr = (T/(k*To))*((4/3) + (alfa/4))
Ti = To*((32 + (6*alfa))/(13 + (8*alfa)))
Td = To*(4/(11 + (2*alfa)))

disp('QDR')
kr = 1.2*(T/(k*To))
Ti = 2*To
Td = 0.5*To

disp('ISE')
kr = 1.4*(T/(k*To))
Ti = 1.3*To
Td = 0.5*To