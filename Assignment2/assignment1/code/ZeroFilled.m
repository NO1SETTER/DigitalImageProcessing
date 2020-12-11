a=imread('../asset/image/extra.jpg');
disp(size(a));
[M,N]=size(a);
P=2*M;
Q=2*N;

b=uint8(zeros(P,Q));
for i=1:M
    for j=1:N
        b(i,j)=a(i,j);
    end
end


c=fft2((Centralize(b)));
d=GaussFilter(P,Q,15);
e=d.*c;
f=Centralize(real(ifft2(e)));
g=uint8(f);

h=uint8(zeros(M,N));
for i=1:M
    for j=1:N
        h(i,j)=g(i,j);
    end
end
figure,imshow(h);