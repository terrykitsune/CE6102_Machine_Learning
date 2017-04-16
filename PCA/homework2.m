%% Initialization

clear ; close all; clc
config = config();

%% process row data
[ trainSet, testSet ] = loadData(config); 


immean = mean(immatrix, 2);
 
X = immatrix - immean;
G = X'* X;
[u, D]=eig(G, 'vector'); 
v = X*u;

for i = 1 : size(v, 2)
    v(:, i) = v(:, i) / norm(v(:, i));
end

figure
subplot(3, 8, 1);
imagesc(reshape(immean, 100, 100)), colormap gray;
title('mean');

for i = 1 : size(v, 2)
    subplot(3, 8, 1 + i);
    imagesc(reshape(v(:, i), 100, 100)), colormap gray;
    title(sprintf('%.2e', D(i)));
end
