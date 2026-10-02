% Program utama: bandingkan 3 metode
clc; clear;
A = [ 2 1 -1;
      4 3  1;
     -2 1  2];
b = [3; 9; 4];
fprintf('===== a) ELIMINASI GAUSS =====\n');
x1 = gauss_biasa(A, b);
fprintf('\n===== b) ELIMINASI GAUSS-JORDAN =====\n');
x2 = gauss_jordan(A, b);
fprintf('\n===== c) DEKOMPOSISI LU =====\n');
x3 = lu_solusi(A, b);
fprintf('\n===== PERBANDINGAN =====\n');
fprintf('%-4s %-12s %-14s %-12s\n', '', 'Gauss', 'Gauss-Jordan', 'LU');
for i = 1:3
    fprintf('x%d   %-12.6f %-14.6f %-12.6f\n', i, x1(i), x2(i), x3(i));
end
fprintf('Maks selisih antar metode = %g\n', max(abs([x1-x2; x1-x3])));
