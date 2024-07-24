img = imread('lycoris.jpg');
imshow(img), title('Original')
if size(img, 3) == 3
    img = rgb2gray(img);
end
threshold = multithresh(img,5);
segmented_img = imquantize(img, threshold);
imgrgb = label2rgb(segmented_img);

figure;
subplot(2,1,1), imshow(img), title('gray Image');
subplot(2,1,2), imshow(imgrgb), title('Segmented Image');
disp(['Otsu Threshold Value: ', num2str(threshold)]);
