%% Initialization
clear ; close all; clc

global Test
global trainSet 
global testSet

Test = true;
config = config();

%% process row data
loadData(config); 

for pid = 1 : config.maxpid
    displayEigenface(pid);
end

