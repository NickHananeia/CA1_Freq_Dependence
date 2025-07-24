%Initialize protocol files since they're too big to upload
%This will consume around 2GB of space

cd('1HZ/sim1/TMS_Waveform')
TMS_Waveform(1000,900, 1, 0.025)
cd('../../..')

cd('5HZ/sim1/TMS_Waveform')
TMS_Waveform(200,900, 1, 0.025)
cd('../../..')

cd('10HZ/sim1/TMS_Waveform')
TMS_Waveform(100,900, 1, 0.025)
cd('../../..')