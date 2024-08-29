Inputimage = imread("gypsophilia.jpg");
imshow(Inputimage)
title("Original Image")
numColors = 3;
L = imsegkmeans(Inputimage,numColors);
B = labeloverlay(Inputimage,L);
imshow(B)
title("Labeled Image RGB")
lab_Inputimage = rgb2lab(Inputimage);
ab = lab_Inputimage(:,:,2:3);
ab = im2single(ab);
pixel_labels = imsegkmeans(ab,numColors,NumAttempts=3);
B2 = labeloverlay(Inputimage,pixel_labels);
imshow(B2)
title("Labeled Image a*b*")
mask1 = pixel_labels == 1;
cluster1 = Inputimage.*uint8(mask1);
imshow(cluster1)
title("Objects in Cluster 1");
mask2 = pixel_labels == 2;
cluster2 = Inputimage.*uint8(mask2);
imshow(cluster2)
title("Objects in Cluster 2");
mask3 = pixel_labels == 3;
cluster3 = Inputimage.*uint8(mask3);
imshow(cluster3)
title("Objects in Cluster 3");
