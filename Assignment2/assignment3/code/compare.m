a=imread('../asset/image/extra.jpg');
disp(size(a))
spatial_filter_img=Sobelconv(a);
figure,imshow(spatial_filter_img,[0,255]);

[M,N]=size(a);
P=2*M;
Q=2*N;

b=im2double(a);
F=fft2(b,P,Q);

sobel=[-1,0,1;-2,0,2;-1,0,1];
h=zeros(P,Q);
h(M:M+2,N:N+2)=sobel;
%h=Centralize(h);

H=fft2(h,P,Q);
H_imag=imag(H);
newH=H_imag*sqrt(-1);
newH=Centralize(newH);
G=newH.*F;
fre_filter_img=ifft2(G);
fre_filter_img=fre_filter_img(1:M,1:N);
figure,imshow(fre_filter_img);
