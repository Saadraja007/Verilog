%%
clear all;
im_in = imread('C:\Users\Saad Shabbir\Desktop\vga_with_image_in_BRAM/circles.jpg');
% im_in = imread('C:\Users\Saad Shabbir\Desktop\vga_with_image_in_BRAM/pure_blue.jpg');
im_in = imrotate(im_in, 90);
im_in = flip(im_in, 1);
im = imresize(im_in, [256 256]);
imd(:,:,1) = round(double(im(:,:,1))*31/255);
imd(:,:,2) = round(double(im(:,:,2))*63/255);
imd(:,:,3) = round(double(im(:,:,3))*31/255);
im2 = imd(:,:,1)+imd(:,:,2)*32+imd(:,:,3)*2048;
temph = fopen('D:\vivado_projects\zybo_vga\zybo_vga.srcs\sources_1\new/testing.txt','w');

fprintf(temph,'%.4x\n', uint16(im2));
fclose(temph);



% 
% % Extract RGB layers
% redLayer = im(:,:,1);
% figure;
% imshow(redLayer);
% impixelinfo();
% greenLayer = im(:,:,2);
% figure;
% imshow(greenLayer);
% impixelinfo();
% blueLayer = im(:,:,3);
% figure;
% imshow(blueLayer);
% impixelinfo();
% 
% % Display RGB layers
% figure;
% subplot(1,3,1), imshow(redLayer), title('Red Layer');
% subplot(1,3,2), imshow(greenLayer), title('Green Layer');
% subplot(1,3,3), imshow(blueLayer), title('Blue Layer');
