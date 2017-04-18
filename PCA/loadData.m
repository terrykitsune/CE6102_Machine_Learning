function  loadData(config)
%% read images into a array then transform them into column vectors
%% trainSet(:, pic_id, pid) is a column vector of a picture of a person(pid) in trainset
%% testSet(:, pic_id, pid) is a column vector of a picture of a person(pid) in testset

global trainSet
global testSet
global train_lable
global test_lable

w = config.pic_width;
h = config.pic_height;
trn = numel(config.id_for_train);
ten = config.maxpic_id - trn;

trainSet = zeros(w*h, trn*config.maxpid);
testSet  = zeros(w*h, ten*config.maxpid);
train_lable = zeros(trn*config.maxpid, 1);
test_lable  = zeros(ten*config.maxpid, 1);

disp('[@]Loading Data');
for pid = 1 : config.maxpid
    for pic_id = 1 : config.maxpic_id
        pathname    = sprintf('face/%d/%d.bmp', pid, pic_id);
        imdata(:,:,pic_id,pid)      = double(imread(pathname));
    end
    fprintf('%d ', pid);
end
disp(sprintf('\n'));

te_count = 1;
tr_count = 1;
disp('[@]Resize matrix into column vector');
for pid = 1 : config.maxpid
    for pic_id = 1 : config.maxpic_id
        if ismember(pic_id, config.id_for_train)
            trainSet(:, tr_count) = reshape(imdata(:, :, pic_id,pid), [], 1);
            train_lable(tr_count) = pid;
            tr_count = tr_count + 1;
        else
            testSet(:, te_count) = reshape(imdata(:, :, pic_id, pid), [], 1);
            test_lable(te_count) = pid;
            te_count = te_count + 1;
        end
    end
    fprintf('%d ', pid);
end
disp(sprintf('\n'));
