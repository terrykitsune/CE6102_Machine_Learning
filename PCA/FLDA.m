function [W, V, M] = FLDA(X)

global trainSet;
class_num = 65;

N = size(trainSet, 2);

[V, m, ~] = PCA(trainSet);
V = V(:, 1:N-class_num);
M = V' * m;

S_B = 0;
S_W = 0;

for i = 1 : class_num
    pc = V' * (X{i} - m);
    mu = mean(pc, 2);
    S_B = S_B + (mu - M) * (mu - M)';
    S_W = S_W + (pc - mu) * (pc - mu)';
end

[W, ~] = eig(S_W \ S_B);
W = W(:, 1:class_num-1);
M = m