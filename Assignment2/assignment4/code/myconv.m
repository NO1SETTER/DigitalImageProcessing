function [H]=myconv(m,mconv)
m=double(m);
[M,N]=size(m);
m1=zeros(M+2,N+2);
for i=1:M
    for j=1:N
        m1(i+1,j+1)=m(i,j);
    end
end

for i=1:M
    for j=1:N
        temp=m1(i:i+2,j:j+2);
        H(i,j)=sum(sum(mconv.*temp));
    end
end


for i=1:M
    for j=1:N
        H(i,j)=min(H(i,j),255);
        H(i,j)=max(H(i,j),0);
    end
end
H=uint8(H);

end