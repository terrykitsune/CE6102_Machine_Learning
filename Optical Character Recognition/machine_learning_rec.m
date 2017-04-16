%% Initialization
clear ; close all; clc


le_e = mean(imread('letter_e.bmp'),3);
le_o = mean(imread('letter_o.bmp'),3);
scene = mean(imread('Scene.bmp'),3);


fprintf('calculating.......');
tic
r = part_6a(le_e,scene);
toc
fprintf('Compute correlation finish!\n');

fprintf('Visualize the correlation value\n');
part_6b(r,scene,le_e);

fprintf('locate the letter on scene\n')
part_6c(r,scene,le_e);

fprintf('use FFT for calculating.....\n');
part_6d(le_e,scene);

fprintf('use FFT for locate letter o.....\n');
part_6e(le_o,scene);