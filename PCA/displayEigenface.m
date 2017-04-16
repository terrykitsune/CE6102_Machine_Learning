function displayEigenface(pid)
%% Do the PCA to show the eigenface of a person(pid)

global trainSet

[V, m, D] = PCA(trainSet(:, :, pid));

figure
subplot(4, 7, 1);
imagesc(reshape(m, 100, 100)), colormap gray;
title('mean');

for i = 1 : size(V, 2)
    subplot(4, 7, 7 + i);
    imagesc(reshape(V(:, i), 100, 100)), colormap gray;
    title(sprintf('%.2e', D(i)));
end