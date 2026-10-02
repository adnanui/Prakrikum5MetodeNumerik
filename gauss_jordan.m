function x = gauss_jordan(A, b)
% Eliminasi Gauss-Jordan (tanpa pivoting)
n = length(b);
fprintf('Matriks augmented awal [A|b]:\n'); disp([A b]);
% --- Forward elimination ---
for i = 1:n-1
    for h = i+1:n
        m = A(h,i) / A(i,i);
        A(h,:) = A(h,:) - m*A(i,:);
        b(h)   = b(h)   - m*b(i);
    end
end
fprintf('\nHasil forward elimination:\n'); disp([A b]);
% --- Backward elimination (nolkan elemen di atas diagonal) ---
for i = n:-1:2
    for h = i-1:-1:1
        m = A(h,i) / A(i,i);
        A(h,:) = A(h,:) - m*A(i,:);
        b(h)   = b(h)   - m*b(i);
    end
end
fprintf('\nHasil backward elimination (diagonal):\n'); disp([A b]);
% --- Normalisasi diagonal -> identitas ---
x = zeros(n,1);
for i = 1:n
    x(i) = b(i) / A(i,i);
end
fprintf('\nSolusi (Gauss-Jordan):\n');
for i = 1:n
    fprintf('x%d = %.6f\n', i, x(i));
end
end
