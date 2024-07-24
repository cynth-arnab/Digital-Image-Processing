img = im2double(imread("hydrangeA.jpg"));
lap = [-1 -1 -1; -1 8 -1; -1 -1 -1];
img2 = imfilter(img, lap, 'conv');

minR = min(img2(:));
maxR = max(img2(:));
img2 = (img2 - minR)/ (maxR - minR);

sharpened = img + img2;

minA = min(sharpened(:));
maxA = max(sharpened(:));
sharpened = (sharpened - minA) / (maxA - minA);

figure;
subplot(3,1,1);
imshow(img);
title('Original');
subplot(3,1,2);
imshow(img2);
title('Laplacian Filtered');
subplot(3,1,3);
imshow(sharpened);
title('Sharpened');


