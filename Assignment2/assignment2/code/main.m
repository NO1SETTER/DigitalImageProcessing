a=imread('../asset/image/extra.jpg');
disp(size(a))
[M,N]=size(a);
P=2*M;
Q=2*N;

b=uint8(zeros(P,Q));
for i=1:M
    for j=1:N
        b(i,j)=a(i,j);
    end
end

c=Centralize(b);

d=fft2(im2double(c));

e=GaussFilter(P,Q,15);

f=d.*e;

g=uint8(Normalize(Centralize(real(ifft2(f))),255));

h=uint8(zeros(M,N));
for i=1:M
    for j=1:N
        h(i,j)=g(i,j);
    end
end

subplot(3,3,1),imshow(a);
subplot(3,3,2),imshow(b);
subplot(3,3,3),imshow(c);
subplot(3,3,4),imshow(log(abs(d)+1),[]);
subplot(3,3,5),imshow(e);
subplot(3,3,6),imshow(f);
subplot(3,3,7),imshow(g);
subplot(3,3,8),imshow(h);
