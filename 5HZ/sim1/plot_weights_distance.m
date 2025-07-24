function[proxmean] = plot_weights_distance()
weights = importdata('weights.dat');
distances = importdata('weight_distances.txt');
pathways = importdata('weight_pathways.txt');

L = size(weights);
L = L(2);

delta_w = weights(:,L) - weights(:,1);
perc_w = delta_w./weights(:,1).*100;

%separate PP and Schaffer weights
oweights = perc_w(pathways == 1);
rweights = perc_w(pathways == 2);
ppweights = perc_w(pathways == 3);

rdists = distances(pathways==2);
rprox = rweights(rdists <= 200);
rdist = rweights(rdists > 200);

oweights_plot = oweights + 100;
rweights_plot = rweights + 100;
ppweights_plot = ppweights + 100;

%trim any way too big elements from the plot
for i = 1:length(oweights_plot)
    if oweights_plot(i) > 2*mean(oweights_plot)
        oweights_plot(i) = NaN;
    end
end

for i = 1:length(rweights_plot)
    if rweights_plot(i) > 2*mean(rweights_plot)
        rweights_plot(i) = NaN;
    end
end

for i = 1:length(ppweights_plot)
    if ppweights_plot(i) > 2*mean(ppweights_plot)
        ppweights_plot(i) = NaN;
    end
end


hold on;
scatter(distances(pathways == 1), oweights_plot, '.', 'r');
scatter(distances(pathways == 2), rweights_plot, '.', 'b');
scatter(distances(pathways == 3), ppweights_plot, '.', 'g');
hold off;
yline(100, '--');
xlabel('Distance from soma (\mum)');
ylabel('Weight change (%)');


disp ('Schaffer mean weight change:');
disp(mean([oweights; rweights]));
disp ('Basal mean weight change:');
disp(mean([oweights]));
disp ('Radiatum mean weight change:');
disp(mean([rweights]));
disp('PP mean weight change:');
disp(mean(ppweights));
disp('Proximal radiatum weight change:');
disp(mean(rprox));
disp('Distal radiatum weight change:');
disp(mean(rdist));

proxmean = mean([oweights; rweights]);
%legend('Stratum oriens', 'Stratum radiatum', 'Stratum L-M');

end