a=imread('../asset/image/woman.png');
disp(size(a));
figure,imshow(a);

[M,N]=size(a);
P = 2*M;
Q = 2*N;
b=uint8(zeros(P,Q));
for i=1:M
    for j=1:N
        b(i,j)=a(i,j);
    end
end


c=fft2(im2double(Centralize(b)));
d=GaussFilter(P,Q,150);
e=d.*c;
f=Centralize(real(ifft2(e)));
g=uint8(Normalize(f,255));

h=uint8(zeros(M,N));
for i=1:M
    for j=1:N
        h(i,j)=g(i,j);
    end
end

R = floor(0.618*M);

b1=uint8(zeros(M,N));
b2=uint8(zeros(M-R,N));
for i=1:M
    for j=1:N
        if i<=R
            b1(i,j)=h(i,j);
        else
            b2(i-R,j)=h(i,j);
        end
    end
end

mconv1=[1,4,1;0,0,0;1,4,1]/12;
mconv2=[1,0,1;4,0,4;1,0,1]/12;
h1=myconv(b1,mconv1);
h2=myconv(b2,mconv2);


for i=1:M-2
    for j=1:N
        if i<R
            h(i,j)=h1(i,j);
        else
            h(i,j)=h2(i-R+2,j);
        end
    end
end

figure,imshow(h);