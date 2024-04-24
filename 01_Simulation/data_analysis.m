%%%%% Half Wave Controled - 30 Deg %%%%%
clear; clc;
load('data/half_wave_controled_30deg.mat');
half_wave_30_controled = ans;
%% Voltage
plot(half_wave_30_controled.Time, half_wave_30_controled.Data(:, 1), "LineWidth",2), hold on;
plot(half_wave_30_controled.Time, half_wave_30_controled.Data(:, 2), "LineWidth",2), hold off;

xlim([0 5*(1/60)]);
ylim([-300 300]);

set(gcf,'Position',[100 100 1000 500])
legend('V_{Source}', 'V_{Load}', fontsize=12);
xlabel('Time (s)', fontsize=12);
ylabel('Voltage (V)', fontsize=12);
grid on;

print(gcf,'-djpeg','-r900', 'imgs/[HALF WAVE - Controled] 30deg Voltages.jpeg');

%% Current
plot(half_wave_30_controled.Time, half_wave_30_controled.Data(:, 6), "LineWidth",3, "LineStyle","--"), hold on;
plot(half_wave_30_controled.Time, half_wave_30_controled.Data(:, 4), "LineWidth",2), hold off;
xlim([0 5*(1/60)]);
set(gcf,'Position',[100 100 1000 500])
legend('I_{Source}', 'I_{Load}', fontsize=12);
xlabel('Time (s)', Fontsize=12);
ylabel('Current (A)', FontSize=12);
grid on;

print(gcf,'-djpeg','-r900', 'imgs/[HALF WAVE - Controled] 30deg Currents.jpeg');

%% Measurement Values
measurements_labels(1) = "Mean Source Voltage";
measurements_values{1} = mean(half_wave_30_controled.Data(:, 1));
measurements_labels(2) = 'RMS Source Voltage';
measurements_values{2} = rms(half_wave_30_controled.Data(:, 1));

measurements_labels(3) = 'Mean Load Voltage';
measurements_values{3} = mean(half_wave_30_controled.Data(:, 2));
measurements_labels(4) = 'RMS Load Voltage';
measurements_values{4} = rms(half_wave_30_controled.Data(:, 2));

measurements_labels(5) = 'Mean Source Current';
measurements_values{5} = mean(half_wave_30_controled.Data(:, 6));
measurements_labels(6) = 'RMS Source Current';
measurements_values{6} = rms(half_wave_30_controled.Data(:, 6));

measurements_labels(7) = 'Mean Load Current';
measurements_values{7} = mean(half_wave_30_controled.Data(:, 4));
measurements_labels(8) = 'RMS Load Current';
measurements_values{8} = rms(half_wave_30_controled.Data(:, 4));

present_data(measurements_values, measurements_labels)