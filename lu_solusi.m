function x = lu_solusi(A, b)
% Solusi SPL dengan dekomposisi LU: Ly = b, Ux = y
n = length(b);
[L, U] = lu_fwdelim(A);
fprintf('Matriks L:\n'); disp(L);
fprintf('Matriks U:\n'); disp(U);
fprintf('Cek A = L*U:\n'); disp(L*U);
fprintf('Selisih A - L*U:\n'); disp(A - L*U);
% --- Forward substitution: Ly = b ---
y = zeros(n,1);
y(1) = b(1) / L(1,1);
for i = 2:n
    y(i) = (b(i) - L(i,1:i-1)*y(1:i-1)) / L(i,i);
end
fprintf('Vektor y (Ly = b):\n'); disp(y);
% --- Backward substitution: Ux = y ---
x = zeros(n,1);
x(n) = y(n) / U(n,n);
for i = n-1:-1:1
    x(i) = (y(i) - U(i,i+1:n)*x(i+1:n)) / U(i,i);
end
fprintf('Solusi (Dekomposisi LU):\n');
for i = 1:n
    fprintf('x%d = %.6f\n', i, x(i));
end
end
