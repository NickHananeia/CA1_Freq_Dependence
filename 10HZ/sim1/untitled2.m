weights = weights_1_uncapped;


L = size(weights);
L = L(2);

delta_w = weights(:,L) - weights(:,1);
perc_w = delta_w./weights(:,1).*100;

rweights = weights(pathways == 2,:);
rdists = distances(pathways==2);
rprox = rweights(rdists <= 200,:);
rmean = mean(rprox);
rmean_1_uncapped = rmean./mean(weights(:,1)).*100;

weights = weights_1_capped;


L = size(weights);
L = L(2);

delta_w = weights(:,L) - weights(:,1);
perc_w = delta_w./weights(:,1).*100;

rweights = weights(pathways == 2,:);
rdists = distances(pathways==2);
rprox = rweights(rdists <= 200,:);
rmean = mean(rprox);
rmean_1_capped = rmean./mean(weights(:,1)).*100;

weights = weights_5_uncapped;


L = size(weights);
L = L(2);

delta_w = weights(:,L) - weights(:,1);
perc_w = delta_w./weights(:,1).*100;

rweights = weights(pathways == 2,:);
rdists = distances(pathways==2);
rprox = rweights(rdists <= 200,:);
rmean = mean(rprox);
rmean_5_uncapped = rmean./mean(weights(:,1)).*100;

weights = weights_5_capped;


L = size(weights);
L = L(2);

delta_w = weights(:,L) - weights(:,1);
perc_w = delta_w./weights(:,1).*100;

rweights = weights(pathways == 2,:);
rdists = distances(pathways==2);
rprox = rweights(rdists <= 200,:);
rmean = mean(rprox);
rmean_5_capped = rmean./mean(weights(:,1)).*100;

weights = weights_10_uncapped;


L = size(weights);
L = L(2);

delta_w = weights(:,L) - weights(:,1);
perc_w = delta_w./weights(:,1).*100;

rweights = weights(pathways == 2,:);
rdists = distances(pathways==2);
rprox = rweights(rdists <= 200,:);
rmean = mean(rprox);
rmean_10_uncapped = rmean./mean(weights(:,1)).*100;

weights = weights_10_capped;


L = size(weights);
L = L(2);

delta_w = weights(:,L) - weights(:,1);
perc_w = delta_w./weights(:,1).*100;

rweights = weights(pathways == 2,:);
rdists = distances(pathways==2);
rprox = rweights(rdists <= 200,:);
rmean = mean(rprox);
rmean_10_capped = rmean./mean(weights(:,1)).*100;

weights = weights_10_preonly;


L = size(weights);
L = L(2);

delta_w = weights(:,L) - weights(:,1);
perc_w = delta_w./weights(:,1).*100;

rweights = weights(pathways == 2,:);
rdists = distances(pathways==2);
rprox = rweights(rdists <= 200,:);
rmean = mean(rprox);
rmean_10_preonly = rmean./mean(weights(:,1)).*100;

comp_5 = linspace(1, length(rmean_5_uncapped), length(rmean_10_uncapped));
comp_1 = linspace(1, length(rmean_1_uncapped), length(rmean_10_uncapped));

%now to plot
figure(1);
plot(rmean_10_uncapped);
hold on;
plot(rmean_5_uncapped(comp_5));
plot(rmean_1_uncapped(comp_1));
hold off;
xlabel('Pulse number');
ylabel('Weight change(%)');
legend('10Hz', '5Hz', '1Hz');

%now to plot
figure(2);
plot(rmean_10_capped);
hold on;
plot(rmean_5_capped(comp_5));
plot(rmean_1_capped(comp_1));
hold off;
xlabel('Pulse number');
ylabel('Weight change(%)');
legend('10Hz', '5Hz', '1Hz');