function x = gauss_biasa(A, b)
% Eliminasi Gauss (tanpa pivoting): forward elimination + substitusi mundur
n = length(b);
fprintf('Matriks augmented awal [A|b]:\n'); disp([A b]);
% --- Forward elimination ---
for i = 1:n-1
    for h = i+1:n
        m = A(h,i) / A(i,i);
        fprintf('m%d%d = %g\n', h, i, m);
        A(h,:) = A(h,:) - m*A(i,:);
        b(h)   = b(h)   - m*b(i);
    end
end
fprintf('\nHasil forward elimination [U|c]:\n'); disp([A b]);
% --- Substitusi mundur ---
x = zeros(n,1);
x(n) = b(n) / A(n,n);
for i = n-1:-1:1
    x(i) = (b(i) - A(i,i+1:n)*x(i+1:n)) / A(i,i);
end
fprintf('\nSolusi (Eliminasi Gauss):\n');
for i = 1:n
    fprintf('x%d = %.6f\n', i, x(i));
end
end
