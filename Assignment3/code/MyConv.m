function H=MyConv(m,matconv)
matconv=rot90(rot90(matconv));
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
        H(i,j)=sum(sum(matconv.*temp));
    end
end


end