%% Initialization
clear ; close all; clc
 
global trainSet 
global testSet
global train_lable
global test_lable

config = config();

%% process row data
loadData(config); 

disp(sprintf('[@]Show eigenface...\n'))
for pid = 1 : config.maxpid
    displayEigenface(pid);
end


recog_pca(3);