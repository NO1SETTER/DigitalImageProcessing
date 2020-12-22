function H=GaussFilter(m,D)%���ɲ���ΪD��Ƶ�����˲���,��ֱ�Ӷ�m�˲�
[M,N]=size(m);
P=M;
Q=N;
b=uint8(zeros(P,Q));
for i=1:M
    for j=1:N
        b(i,j)=m(i,j);
    end
end

c=fft2(Centralize(b));%ԭͼ��任��Ƶ����
d=zeros(P,Q);%����Ƶ�����˹�˲���
for i=1:P
    for j=1:Q
        d0=sqrt((i-P/2)^2+(j-Q/2)^2);
        d(i,j)=exp(-d0^2/(2*D^2));
    end
end
e=d.*c;
f=Centralize(real(ifft2(e) ));
g=uint8(f);%�����任������ͼ��

H=uint8(zeros(M,N));
for i=1:M
    for j=1:N
        H(i,j)=g(i,j);
    end
end
end