function [L, U] = lu_fwdelim(A)
% Dekomposisi LU lewat forward elimination (pengali m disimpan di L)
n = size(A,1);
L = zeros(n);
for i = 1:n-1
    for h = i+1:n
        m = A(h,i) / A(i,i);
        L(h,i) = m;
        A(h,:) = A(h,:) - m*A(i,:);
    end
end
L = L + eye(n);
U = A;
end
