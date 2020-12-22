function H=BasicEdgeDetection(m)
sobel1=[1,0,-1;2,0,-2;1,0,-1];
sobel2=[1,2,1;0,0,0;-1,-2,-1];
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
        H(i,j)=(abs(sum(sum(sobel1.*temp)))+abs(sum(sum(sobel2.*temp))))/2;
    end
end

%thresh = sum(H(:))/sum(sum(H~=0));
thresh = sum(H(:))/numel(H)*3;
for i=1:M
    for j=1:N
        if H(i,j)>=thresh
            H(i,j)=255;
        else
            H(i,j)=0;
        end
        %H(i,j)=min(H(i,j),255);
        %H(i,j)=max(H(i,j),0);
    end
end
H = bwmorph(H,'thin');
end