function [V, m, D] = PCA(im_data)

m = mean(im_data, 2);

X = im_data - m;
G = X' * X;
[u, D] = eig(G, 'vector'); 

%sort the eigenvalue and eigenvector 
[D,I] = sort(D, 'descend');
u = u(:, I);
 
V = X*u;

for i = 1 : size(V, 2)
    V(:, i) = V(:, i) / norm(V(:, i));
end

