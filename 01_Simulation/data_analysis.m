%% %%%%%%%%%%%%%%%%%%%%% Half Bridge - 30 Deg %%%%%%%%%%%%%%%%%%%%% %%
clear; clc;
load('data/half_wave_controled_30deg.mat');
half_wave_30_controled = ans;

%% Voltage
plot(half_wave_30_controled.Time, half_wave_30_controled.Data(:, 1), "LineWidth",2.5), hold on;
plot(half_wave_30_controled.Time, half_wave_30_controled.Data(:, 2), "LineWidth",2.5,"LineStyle",":", "Color", '#fa7a2a'), hold off;

xlim([0 5*(1/60)]);
ylim([-300 300]);

set(gcf,'Position',[100 100 1000 500])
legend('V_{Source}', 'V_{Load}', fontsize=12);
xlabel('Time (s)', fontsize=12);
ylabel('Voltage (V)', fontsize=12);
grid on;

print(gcf,'-djpeg','-r900', 'imgs/[HALF WAVE - Controled] 30deg Voltages.jpeg');

%% Current
plot(half_wave_30_controled.Time, half_wave_30_controled.Data(:, 6), "LineWidth",2.5), hold on;
plot(half_wave_30_controled.Time, half_wave_30_controled.Data(:, 4), "LineWidth",2.5,  "LineStyle",":", "Color", '#fa7a2a'), hold off;
xlim([0 5*(1/60)]);
ylim([-3 25]);
set(gcf,'Position',[100 100 1000 500]);
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

%% Power Calculations
P = 10 * measurements_values{8}^2;
S = measurements_values{8} * measurements_values{2};
fp= P/S;

present_data({P, S, fp}, ["Potência Ativa", "Potência Aparente", "Fator de Potência"])

%% %%%%%%%%%%%%%%%%%%%%% Half Bridge - 60 Deg %%%%%%%%%%%%%%%%%%%%% %%
load('data/half_wave_controled_60deg.mat');
half_wave_60_controled = ans;

%% Voltage
plot(half_wave_60_controled.Time, half_wave_60_controled.Data(:, 1), "LineWidth",2.5), hold on;
plot(half_wave_60_controled.Time, half_wave_60_controled.Data(:, 2), "LineWidth",2.5, "Color", '#fa7a2a', 'LineStyle',':'), hold off;

xlim([0 5*(1/60)]);
ylim([-300 300]);

set(gcf,'Position',[100 100 1000 500])
legend('V_{Source}', 'V_{Load}', fontsize=12);
xlabel('Time (s)', fontsize=12);
ylabel('Voltage (V)', fontsize=12);
grid on;

print(gcf,'-djpeg','-r900', 'imgs/[HALF WAVE - Controled] 60deg Voltages.jpeg');

%% Current
plot(half_wave_60_controled.Time, half_wave_60_controled.Data(:, 6), "LineWidth",2.5), hold on;
plot(half_wave_60_controled.Time, half_wave_60_controled.Data(:, 4), "LineWidth",2.5,"Color", '#fa7a2a', 'LineStyle',':'), hold off;
xlim([0 5*(1/60)]);
ylim([-3 25]);
set(gcf,'Position',[100 100 1000 500]);
legend('I_{Source}', 'I_{Load}', fontsize=12);
xlabel('Time (s)', Fontsize=12);
ylabel('Current (A)', FontSize=12);
grid on;

print(gcf,'-djpeg','-r900', 'imgs/[HALF WAVE - Controled] 60deg Currents.jpeg');

%% Measurement Values
measurements_labels(1) = "Mean Source Voltage";
measurements_values{1} = mean(half_wave_60_controled.Data(:, 1));
measurements_labels(2) = 'RMS Source Voltage';
measurements_values{2} = rms(half_wave_60_controled.Data(:, 1));

measurements_labels(3) = 'Mean Load Voltage';
measurements_values{3} = mean(half_wave_60_controled.Data(:, 2));
measurements_labels(4) = 'RMS Load Voltage';
measurements_values{4} = rms(half_wave_60_controled.Data(:, 2));

measurements_labels(5) = 'Mean Source Current';
measurements_values{5} = mean(half_wave_60_controled.Data(:, 6));
measurements_labels(6) = 'RMS Source Current';
measurements_values{6} = rms(half_wave_60_controled.Data(:, 6));

measurements_labels(7) = 'Mean Load Current';
measurements_values{7} = mean(half_wave_60_controled.Data(:, 4));
measurements_labels(8) = 'RMS Load Current';
measurements_values{8} = rms(half_wave_60_controled.Data(:, 4));

present_data(measurements_values, measurements_labels)

%% Power Calculations
P = 10 * measurements_values{8}^2;
S = measurements_values{8} * measurements_values{2};
fp= P/S;

present_data({P, S, fp}, ["Potência Ativa", "Potência Aparente", "Fator de Potência"])

%% %%%%%%%%%%%%%%%%%%%%% Full Bridge - 30 Deg Single Phase %%%%%%%%%%%%%%%%%%%%% %%
% Since the simulation was done on a variable step size, it is necessary to
% create a linear interpolation of fixed step size so all the calculations
% are correct.
load("data/full_wave_controled_30deg.mat");
full_wave_30_deg = ans;

fixed_step_time = min(full_wave_30_deg.Time):0.00001:max(full_wave_30_deg.Time);
original_time = full_wave_30_deg.Time;
data = full_wave_30_deg.Data;

fixed_step_data = interp1(original_time, data, fixed_step_time);

%% Voltage
plot(fixed_step_time, fixed_step_data(:,1), "LineWidth",2.5), hold on;
plot(fixed_step_time, fixed_step_data(:,2), "LineWidth",2.5,"LineStyle",":", "Color", '#fa7a2a'), hold off;

xlim([0 5*(1/60)]);
ylim([-300 300]);

set(gcf,'Position',[100 100 1000 500])
legend('V_{Source}', 'V_{Load}', fontsize=12);
xlabel('Time (s)', fontsize=12);
ylabel('Voltage (V)', fontsize=12);
grid on;

print(gcf,'-djpeg','-r900', 'imgs/[FULL WAVE - Controled] 30deg Voltages.jpeg');