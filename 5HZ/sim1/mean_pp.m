function[mean_weight] = mean_pp()
weights = importdata('weights.dat');
distances = importdata('weight_distances.txt');
pathways = importdata('weight_pathways.txt')

l = size(weights);
l = l(2);

delta_w = weights(:,l) - weights(:,1);
perc_w = delta_w./weights(:,1).*100;

%trim out any individual weights that exploded
for i = 1:length(perc_w)
    if perc_w(i) >= 150
        perc_w(i) = NaN;
    end
end

%separate PP and Schaffer weights
ppweights = perc_w(pathways == 3);

mean_weight = nanmean(ppweights);
end