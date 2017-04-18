function k = OptimizeParam_pca()

loadData(config());

global trainSet;

[V, ~, ~] = PCA(trainSet);
evNum = size(V, 2);

precision = zeros(evNum, 1);
for i = 1 : evNum
    fprintf('\r[x] Searching for best k ... (%d/%d)', i, evNum);
    precision(i) = recog_pca(i);
end

[p, k] = max(precision);
fprintf('\n[*] k = %d, with precision = %f\n', k, p);

title('Precision over k');
plot(1:evNum, precision);
hold on;
plot(k, p, 'ro');
hold off;