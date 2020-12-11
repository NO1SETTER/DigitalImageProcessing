function [H]=GaussFilter(P,Q,D)
H=zeros(P,Q);
for i=1:P
    for j=1:Q
        d=sqrt((i-P/2)^2+(j-Q/2)^2);
        H(i,j)=exp(-d^2/(2*D^2));
    end
end

end