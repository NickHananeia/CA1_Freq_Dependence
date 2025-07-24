function[mean_weight] = mean_schaffer()
weights = importdata('weights.dat');
distances = importdata('weight_distances.txt');
pathways = importdata('weight_pathways.txt')

length = size(weights);
length = length(2);

delta_w = weights(:,length) - weights(:,1);
perc_w = delta_w./weights(:,1).*100;

%separate PP and Schaffer weights
sweights = perc_w(pathways ~= 3);

mean_weight = mean(sweights);
end