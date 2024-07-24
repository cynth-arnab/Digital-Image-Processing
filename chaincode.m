clear all;
close all;
clc;
originalImage = imread('gypsophilia.jpg');
subplot(3,1,1)
imshow(originalImage);
title('Original Image');
%% 
grayscale_image = rgb2gray(originalImage);
binary_image = imbinarize(grayscale_image); 
subplot(3,1,2)
imshow(binary_image);
title('Binary Image');
%% 
boundaries = bwboundaries(binary_image);
subplot(3,1,3)
imshow(binary_image);
title('Boundary Image');
hold on;
%% 
for k = 1:length(boundaries)
boundary = boundaries{k};
plot(boundary(:, 2), boundary(:, 1), 'r', 'LineWidth', 2);
chain_code_4connected = zeros(size(boundary, 1), 1);
directions_4connected = [0, 1; -1, 0; 0, -1; 1, 0];
for i = 1:size(boundary, 1) - 1
x = boundary(i, 1);
y = boundary(i, 2);
next_point = boundary(i + 1, :);
dx = next_point(1) - x;
dy = next_point(2) - y;
[~, index] = ismember([dx, dy], directions_4connected, 'rows');
chain_code_4connected(i) = mod(index - 1, 4);
end
fprintf('4-Connected Chain Code for the image is %d:\n', k);
disp(chain_code_4connected(1:end-1));
end
hold off;