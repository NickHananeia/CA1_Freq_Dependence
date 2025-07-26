# CA1_Freq_Dependence
Demonstration of TMS frequency dependence from Galanis et al. paper.

Base simulation requires NEURON newer than version 8.0 and protocol generation and analytics require MATLAB.

To run, compile mod files in lib_mech, and then execute the script init_simulations.m

Then, run the run_everything_TMS.bat file (if using Windows) to run the 3 simulations. Each has the same synapse distribution. Lower frequencies will take longer to run (1Hz aroud 6-10 hours).

If not using Windows, individual simultions can be run by running TMS_script (INH_TMS_10/sim1/TMS_script.hoc) in each frequency's folder.

After simulations have concluded, a trace of weight values for each synapse for each minute of simulated time is contained in weights.dat.

Final weights can be visualized by running plot_weights_distance.m in each simulation folder. A plot of weight values with distances will be provided, and the averages for each synapse category will be printed in the terminal.

