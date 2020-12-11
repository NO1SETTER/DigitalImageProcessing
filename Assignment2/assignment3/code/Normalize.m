function [H]=Normalize(m,L)
[M,N]=size(m);
vmax=max(max(m));
vmin=min(min(m));
for i=1:M
    for j=1:N
        H(i,j)=(m(i,j)-vmin)/(vmax-vmin)*L;
        %H(i,j)=(uint8)(H(i,j));
    end
end