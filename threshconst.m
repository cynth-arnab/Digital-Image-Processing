originalImage = imread('harrypotter-i64cgv95yi5c1.jpg'); 
negatedImage = 255 - originalImage; figure;
subplot(1,2,1); 
imshow(originalImage); 
title('Original Image');
subplot(1,2,2); 
imshow(negatedImage); 
title('Negated Image');
%% 
originalImage = imread('harrypotter-i64cgv95yi5c1.jpg'); 
grayImage = rgb2gray(originalImage); 
thresholdValue = graythresh(grayImage);
thresholdedImage = imbinarize(grayImage, thresholdValue); 
figure;
subplot(1,2,1); 
imshow(originalImage); 
title('Original Image');
subplot(1,2,2); 
imshow(thresholdedImage); 
title('Thresholded Image');
%% 
image=imread("harrypotter-i64cgv95yi5c1.jpg");
s = imadjust(image,stretchlim(image,[0,1]),[]);
subplot(1,2,1),imshow(image) , title('original image'); 
subplot(1,2,2),imshow(s), title('stretched image');
