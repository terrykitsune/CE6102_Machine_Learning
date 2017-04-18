function X = prepareCellData()

global trainSet
 
class_num = 65;

X = cell(1, class_num);

for i = 1 : class_num
    X{i} = trainSet(:,i:i+2);
end