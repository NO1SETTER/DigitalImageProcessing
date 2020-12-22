function H=Normalize(m,L) %把图像m归一化到[0,L]之间
[M,N]=size(m);
vmax=max(max(m));
vmin=min(min(m));
for i=1:M
    for j=1:N
        H(i,j)=uint8((m(i,j)-vmin)/(vmax-vmin)*double(L));
        %H(i,j)=(uint8)(H(i,j));
    end
end

end
