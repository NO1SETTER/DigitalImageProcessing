%test histeq
I = imread('girl.png');
[J] = Histogram_equalization(I);
B=histeq(I);
figure, imshow(I)
figure, imshow(J)
figure, imshow(B)