function TMS_Waveform(interval, amount, TMS_type, dt)
% Generate TMS pulse trains and write them in a file to be used in the
% NEURON simulation.

%% Receive TMS parameters
% 1: Monophasic, 2: Biphasic

ipi = interval; % inter-pulse interval
nump = amount; % number of pulses


%% Read TMS single pulse file
if TMS_type == 1
    load(['original_waveforms' filesep 'TMS_mono.mat']);
else
    load(['original_waveforms' filesep 'TMS_bi.mat']);
end

%% Generate pulse train
%dt = 0.025; % time step used in NEURON simulation
if length(TMS_E) > round(ipi/dt)
    error('Inter-pulse interval cannot be shorter than TMS pulse duration.');
end
delay_start = 40; % delay at the beginning before TMS delivery
delay_end = 40; % delay after the TMS delivery
ipi = round(ipi/dt)*dt;
train_length = delay_start + (nump-1)*ipi + delay_end; % in ms
train_t = (0:dt:train_length)';
pulse_extend = [TMS_E; zeros(round(ipi/dt)-length(TMS_E),1)];
train_E = zeros(delay_start/dt+1,1); % zeropad before TMS delivery
train_E = [train_E; repmat(pulse_extend,nump-1,1)]; % Append TMS pulses
train_E = [train_E; TMS_E; zeros(length(train_t)-length(train_E)-length(TMS_E),1)];
%% Save train
if ~exist('TMS_waveform_out','dir')
    mkdir('TMS_waveform_out');
end

timing = [ipi;delay_start;nump;dt];


save(['TMS_waveform_out' filesep 'TMS_E_train.txt'], 'train_E','-ascii');
save(['TMS_waveform_out' filesep 'TMS_t_train.txt'], 'train_t','-ascii');
save('./TMS_waveform_out/TMS_timing.txt', 'timing','-ascii');
disp('Successfully generated the TMS waveform!');
end
