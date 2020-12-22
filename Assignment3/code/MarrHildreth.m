function H=MarrHildreth(m)
[M,N]=size(m);
h=GaussFilter(m,floor(M/6));
%figure,imshow(h);
laplace=[-1,-1,-1;-1,8,-1;-1,-1,-1];
h = int16(MyConv(h,laplace));

thresh = sum(h(:))/sum(sum(h~=0))*150;
H=zeros(M,N);
for i=2:M-1
    for j=2:N-1
        if h(i-1,j) * h(i+1,j)<=0 && abs( h(i-1,j) - h(i+1,j) )>=thresh   
            H(i,j)=255;
        elseif h(i,j-1) * h(i,j+1)<=0 && abs( h(i,j-1) - h(i,j+1) )>=thresh 
            H(i,j)=255;
        elseif h(i-1,j+1) * h(i+1,j-1)<=0 && abs( h(i-1,j+1) - h(i+1,j-1) )>=thresh 
            H(i,j)=255;
        elseif h(i-1,j-1) * h(i+1,j+1)<=0 && abs( h(i-1,j-1) - h(i+1,j+1) )>=thresh 
            H(i,j)=255;
        end  
   end
end

end