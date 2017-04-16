function recogRate = recog_pca(k)

%% k means how many eigenvector we want to use

global trainSet 
global testSet
global train_lable
global test_lable

[Vtrain, mtrain, Dtrain] = PCA(trainSet);
[Vtest, mtest, Dtest] = PCA(testSet);

% select first k eigenvectors
v = Vtrain(:, 1:k);

% project on the k eigenvectors
train_pro = v' * (trainSet - mtrain);
test_pro = v' * (testSet - mtest);

test_predict = zeros(size(test_lable));

for i = 1 : size(test_pro, 2)
    nearest = [0, inf];
    for j = 1 : size(train_pro, 2)
        d = norm(test_pro(:, i) - train_pro(:, j), 2);
        if d < nearest(2)
            nearest = [j, d];
        end
    end
    lable_predict = train_lable(nearest(1));
    test_predict(i) = lable_predict;
end

[~, match] = find(test_predict == test_lable);
recogRate = length(match) / length(test_lable);
disp(sprintf('Recognition rate = %f%%',recogRate*100));