function classificationFLDA()

loadData(config());
X = prepareCellData;

[W, V, M] = FLDA(X);

global trainSet
global testSet
global train_lable
global test_lable

train_pro = V' * (trainSet - M);
test_pro = V' * (testSet - mean(testSet, 2));

train_X = W' * train_pro;
test_X = W' * test_pro;

test_predict = zeros(size(test_lable));

for i = 1 : size(test_X, 2)
    nearest = [0, inf];
    for j = 1 : size(train_X, 2)
        d = norm(test_X(:, i) - train_X(:, j), 2);
        if d < nearest(2)
            nearest = [j, d];
        end
    end
    Y_predict = train_lable(nearest(1));
    test_predict(i) = Y_predict;
end

[~, match] = find(test_predict == test_lable);
recogRate = length(match) / length(test_lable);

fprintf('The overall recognition rate with FLDA is  %.2f%%\n', recogRate * 100);
