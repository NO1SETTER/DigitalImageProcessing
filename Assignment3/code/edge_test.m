%DIP16 Assignment 2
%Edge Detection
%In this assignment, you should build your own edge detection and edge linking 
%function to detect the edges of a image.
%Please Note you cannot use the build-in matlab edge and bwtraceboundary function
%We supply four test images, and you can use others to show your results for edge
%detection, but you just need do edge linking for rubberband_cap.png.
%clc; clear all;
% Load the test image
imgTest = im2double(imread('../asset/image/rubberband_cap.png'));
imgTestGray = rgb2gray(imgTest);
[M,N]=size(imgTestGray);
%figure; clf;
figure,imshow(imgTestGray);
%now call your function my_edge, you can use matlab edge function to see
%the last result as a reference first
img_edge1 = edge(imgTestGray);
figure,imshow(img_edge1);
img_edge2 = my_edge(im2uint8(imgTestGray));
figure,imshow(img_edge2);
%figure;clf;
%imtool(img_edge2);
%disp(img_edge2);
%-background = im2bw(imgTest, 1);
%-imshow(background);
%using imtool, you select a object boundary to trace, and choose
%an appropriate edge point as the start point 
%imtool(img_edge2);
points = [201,67;284,220;130,175;51,101;54,101;19,307;22,307;103,412;242,216;156,106;49,338;153,78;156,445;27,324;69,335;87,316;180,430;186,419;162,405;150,432];
linkimage=zeros(M,N);
%now call your function my_edgelinking, you can use matlab bwtraceboundary 
%function to see the last result as a reference first. please trace as many 
%different object boundaries as you can, and choose different start edge points.
%-Bxpc = bwtraceboundary(img_edge, [197, 329], 'N');
 for round = 1:numel(points)/2
 Bxpc = my_edgelinking(img_edge2, points(round,1), points(round,2));
% %Bxpc=my_edgelinking(img_edge2,201,67);
     for i=1:numel(Bxpc)/2
         linkimage(Bxpc(i,2),Bxpc(i,1))=1;
     end
 end
% 
 figure,imshow(linkimage);

%-hold on
%plot(Bxpc(:,2), Bxpc(:,1), 'w', 'LineWidth', 1);