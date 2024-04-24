%% Half Wave Controled - 30 Deg
clear; clc;
load('data/half_wave_controled_30deg.mat');
half_wave_30_controled = ans;

plot(half_wave_30_controled.Time, half_wave_30_controled.Data(:, 1), "LineWidth",2), hold on;
plot(half_wave_30_controled.Time, half_wave_30_controled.Data(:, 2), "LineWidth",2), hold off;
xlim([0 5*(1/60)]);
set(gcf,'Position',[100 100 1000 500])
legend('V_{Source}', 'V_{Load}');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;

%saveas(gcf,'half_wave_controled_30deg.png');
print(gcf,'-djpeg','-r900', '[HALF WAVE - Controled] 30deg.jpeg');
