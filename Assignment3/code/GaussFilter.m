function H=GaussFilter(m,D)%生成参数为D的频率域滤波器,并直接对m滤波
[M,N]=size(m);
P=M;
Q=N;
b=uint8(zeros(P,Q));
for i=1:M
    for j=1:N
        b(i,j)=m(i,j);
    end
end

c=fft2(Centralize(b));%原图像变换到频率域
d=zeros(P,Q);%生成频率域高斯滤波器
for i=1:P
    for j=1:Q
        d0=sqrt((i-P/2)^2+(j-Q/2)^2);
        d(i,j)=exp(-d0^2/(2*D^2));
    end
end
e=d.*c;
f=Centralize(real(ifft2(e) ));
g=uint8(f);%卷积完变换回来的图像

H=uint8(zeros(M,N));
for i=1:M
    for j=1:N
        H(i,j)=g(i,j);
    end
end
end