%% Exercise 1
% a
clear all; close all; clc
A = [
    2, 3, -1;
    4, -2, 3;
    1 1 1
    ];
b = [5, 10, 3]';
sol = A \ b;

% b
A = [
    2, 3, -1;
    4, -2, 3;
    1 1 1;
    3 -1 2;
    ];
b = [5, 10, 3, 8]';
sol_appr = A \ b;
rsq = sum((A * sol_appr - b) .^ 2);

% c

A = [
    1 1 1;
    2 -1 3;
    ];
b = [6, 10]';
sol_a = A \ b;
sol_b = lsqminnorm(A, b);
assert(norm(sol_b) <= norm(sol_a), "lsqminnorm can't be larger");

%% Exercise 2
clear all; close all; clc

alpha = 0:.05:pi;
theta = deg2rad(45);
rotmat = [cos(theta) -sin(theta); sin(theta) cos(theta)];
circle = [cos(alpha) + 1; sin(alpha) + 1];
size(circle);
subplot(1,2,1)
scatter(circle(1,:), circle(2,:));
axis equal
grid on
grid minor
title("Unit circle");
rotcircle = rotmat * circle;
subplot(122)
scatter(rotcircle(1,:), rotcircle(2,:));
axis equal
grid on
grid minor
title("Rotated")


%% Exercise 3
clear all; close all; clc
for a = -.9999:.01:.9999
    A = [1, a; a, 1];
    alpha = 0:.05:2*pi;
    circle = [cos(alpha); sin(alpha)];
    rotcircle = A * circle;
    scatter(rotcircle(1,:), rotcircle(2,:));
    grid on
    grid minor
    axis equal
    pause(.05);
end

%% Exercise 4
clear all; close all; clc

% tic; svd(randn(5000)); toc;
% tic; inv(randn(7000)); toc;
% tic; randn(10000) \ randn(10000, 1); toc;
re
%% Exercise 5
clear all; close all; clc
im = imread("cat.jpg");
im = rgb2gray(im);
im = single(im);
% Takes 10 sec and puts my CPU on fire
tic; [u,s,v] = svd(im, 'econ'); toc

%% Run this separately to avoid svd lag
close all;
for thresh = logspace(0, 3, 40)
    c = s(:,:); % Copy
    c(thresh:end, thresh:end) = 0;
    recon = u * c * v'  ./ 255;
    imshow(recon)
end

