a=imread('../asset/image/extra.jpg');
[M,N]=size(a);
b=fft2((Centralize(a)));
c=GaussFilter(M,N,15);
d=c.*b;
e=Centralize(real(ifft2(d)));
f=uint8(e);
figure,imshow(f);
