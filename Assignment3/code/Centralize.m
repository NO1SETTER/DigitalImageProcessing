function [H]=Centralize(m)
[M,N]=size(m);
for i=1:M
    for j=1:N
        H(i,j)=((-1)^(i+j-2))*m(i,j);
    end
end

end
