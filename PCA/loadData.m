function [ trainSet, testSet ] = loadData(config)
%% read images into a array then transform them into column vectors
%% trainSet(:, pic_id, pid) is a column vector of a picture of a person(pid) in trainset
%% testSet(:, pic_id, pid) is a column vector of a picture of a person(pid) in testset

tr_count = 1;
te_count = 1;

disp('[----Loading Data----]');
for pid = 1 : config.maxpid
    for pic_id = 1 : config.maxpic_id
        pathname    = sprintf('PIE_Nolight/%d/%d.bmp', pid, pic_id);
        imdata(:,:,pic_id,pid)      = im2double(imread(pathname));
    end
end
 
for pid = 1 : config.maxpid
    for pic_id = 1 : config.maxpic_id
        if ismember(pic_id, config.id_for_train)
            trainSet(:, tr_count, pid) = reshape(imdata(:, :, pic_id,pid), [], 1);
            tr_count = tr_count + 1;
        else
            testSet(:, te_count, pid) = reshape(imdata(:, :, pic_id, pid), [], 1);
            te_count = te_count + 1;
        end
    end
    fprintf('%d ', pid);
end
disp(sprintf('\n[----Loading Complete----]'));
