function H=Normalize(m,L) %��ͼ��m��һ����[0,L]֮��
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
