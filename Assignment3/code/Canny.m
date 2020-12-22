function H=Canny(m)
[M,N]=size(m);
h=GaussFilter(m,floor(M/6));
sobelx=[-1,0,1;-2,0,2;-1,0,1];
sobely=[-1,-2,-1;0,0,0;1,2,1];

gx=int16(MyConv(m,sobelx));
gy=int16(MyConv(m,sobely));

Alpha=zeros(M,N);
Mag=zeros(M,N);

for i =1:M
    for j=1:N
        Mag(i,j)=sqrt(double(gx(i,j)*gx(i,j))+double(gy(i,j)*gy(i,j)) );
         if Mag(i,j) > 255 
             Mag(i,j)=255;
         elseif Mag(i,j)<0
            Mag(i,j) = 0;
        end
        if gx(i,j) ~= 0
            Alpha(i,j)=atand(double(gy(i,j))/double(gx(i,j)));
        else
            if gy(i,j)>0
                Alpha(i,j) = pi/2;
            elseif gy(i,j)<0
                Alpha(i,j) = -pi/2;
            else
                    Alpha(i,j) = 0;
            end
        end
    end
end

Mag=uint8(Mag);
dir = zeros(M,N); %1,2,3,4分别代表方向垂直,+45`,水平,-45' ,它其实是边缘的法线方向
%需要注意数组的i,j和坐标的x,y是反过来的..
for i=1:M
    for j=1:N
        if Alpha(i,j) > 67.5 || Alpha(i,j)  <-67.5
            dir(i,j) = 1;
        elseif Alpha(i,j)  <= 67.5 && Alpha(i,j)  > 22.5
            dir(i,j) = 2;
        elseif Alpha(i,j)  <= 22.5 && Alpha(i,j)  >-22.5
            dir(i,j)  =3;
        else
            dir(i,j) = 4;
        end
    end
end

%disp(dir);
%figure,imshow(Mag);
%title('Mag');
gN = zeros(M,N);
alldir=[1,0; 
            1,1;
              0,1; 
              1,-1];
          
for i=2:M-1
    for j=2:N-1
        gN(i,j) = Mag(i,j);
        d=dir(i,j);
        if  (Mag(i,j) < Mag(i+alldir(d,1),j+alldir(d,2)) ||   Mag(i,j) < Mag(i-alldir(d,1),j-alldir(d,2)) ) 
            gN(i,j) = 0;
        end
    end
end
%figure,imshow(uint8(gN));
%title('gN');
%TL = sum(gN(:))/sum(sum(gN~=0));
%TH = 2.25*TL;
 TL = sum(gN(:))/sum(sum(gN~=0))*0.8;
 TH = 2*TL;
%      counts = imhist(Mag, 64);
%      TH = (find(cumsum(counts) > 0.6 * M * N, 1, 'first') / 18)*256;
%      TL = 0.4 * TH;
gNH=zeros(M,N);
gNL=zeros(M,N);

for i=2:M-1
    for j=2:N-1
        if gN(i,j)>=TH
            gNH(i,j)=255;
        elseif gN(i,j)>=TL
            gNL(i,j)=255;
        end
    end
end

H=gNH;

for i=2:M-1
    for j=2:N-1
        if gNL(i,j) > 0
            if gNH(i+1,j)>0 || gNH(i-1,j)>0 || gNH(i,j+1)>0 || gNH(i,j-1)>0 || gNH(i-1,j-1)>0 || gNH(i+1,j+1)>0 || gNH(i+1,j-1)>0 || gNH(i-1,j+1)>0
                H(i,j) = 255;
                gNH(i,j) = 255;
            end
        end
    end
end

H=bwmorph(H,'thin');
H=logical(H);
end