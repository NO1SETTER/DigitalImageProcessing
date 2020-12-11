function [output] = Histogram_equalization(input_image)
%first test the image is a RGB or gray image
if numel(size(input_image)) == 3
    %this is a RGB image
    %here is just one method, if you have other ways to do the
    %equalization, you can change the following code
    %r=input_image(:,:,1);
%     v=input_image(:,:,2);
%     b=input_image(:,:,3);
%     r1 = hist_equal(r);
%     v1 = hist_equal(v);
%     b1 = hist_equal(b);
%     output = cat(3,r1,v1,b1);
     hsv_image = rgb2hsv(input_image);
%      s = hsv_image(:,:,2);
%      s = hist_equal(s,1);
%     hsv_image(:,:,2)=s;
    v = hsv_image(:,:,3);
    v = hist_equal(v,1);
    hsv_image(:,:,3)=v;
    
    [output]=hsv2rgb(hsv_image);
else
    %this is a gray image
    [output] = hist_equal(input_image,0);
    
end

    function [output2] = hist_equal(input_channel,unif)
        [r,c]=size(input_channel);
        rec=zeros(1,256);
        for i=1:r
            for j=1:c
                index=input_channel(i,j);
                if(unif==1)
                    index=uint16(double(255)*index)+1;
                else
                    index=index+1;
                end
                rec(index)=rec(index)+1;
            end
        end
   
        summ=zeros(1,256);
        summ(1)=(double(rec(1))/double(r*c));
       
        for i=2:256
            summ(i)=summ(i-1)+(double(rec(i))/double(r*c));
        end
        
        disp(summ);
        for i=1:r
            for j=1:c
                index=input_channel(i,j);
                flt=0;
                if(unif==1)
                    index=min(uint16(double(255)*index)+10,256);
                    flt=summ(index);
                else
                    index=index+1;
                    flt=uint8(summ(index)*double(255));
                end
                output2(i,j)=flt;
            end
        end
        
    %you should complete this sub-function
    end
end