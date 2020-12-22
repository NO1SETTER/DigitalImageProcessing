function boundary = my_edgelinking(binary_image, row, col)
[m, n] = size(binary_image);
entry = [col, row];
alldir = [-1, 0; -1, -1; 0, -1; 1, -1; 1, 0; 1, 1; 0, 1; -1, 1];
exitdir = [7, 7, 1, 1, 3, 3, 5, 5];
for i = 1 : 8
    c = entry + alldir(i, :);
    if binary_image(c(2), c(1)) == 1
        startpos = c;
        startdir = exitdir(i);
        break;
    end
end
boundary(1, :) = startpos;
pos = startpos;
dir = startdir;
bdrNum = 1;
while 1
    %find = 0;
    for i = circshift(1 : 8, [0, 1 - dir])
        c = pos + alldir(i, :);
        if binary_image(c(2), c(1)) == 1
            pos = c;
            dir = exitdir(i);
            bdrNum = bdrNum + 1;
            boundary(bdrNum, :) = pos;
            %find = 1;
            break;
        end
    end
%     if find == 0
%         disp(c);
%         for i=pos(2)-2:pos(2)+2
%             for j=pos(1)-2:pos(1)+2
%             if (pos(2)~=i || pos(1)~=j) &&( boundary(bdrNum,2)~=i || boundary(bdrNum,1)~=j ) && (binary_image(i,j)==1)
%                 disp(i);
%                 disp(j);
%                 disp('lalala');
%                 bdrNum = bdrNum + 1;
%                 boundary(bdrNum,:)=[floor((i+pos(2)/2)),floor((j+pos(1))/2)];
%                 bdrNum = bdrNum + 1;
%                 boundary(bdrNum,:)=[i,j];
%                 pos = [j,i];
%             end
%             end
%         end
%     end
    disp(pos);
    if all(pos == startpos) && (dir == startdir)
        break;
    end
end
boundary = boundary - 1;
boundary = boundary(1 : bdrNum, :);

%in this function, you should finish the edge linking utility.);
%the input parameters are a matrix of a binary image containing the edge
%information and coordinates of one of the edge points of a object
%boundary, you should run this function multiple times to find different
%object boundaries
%the output parameter is a Q-by-2 matrix, where Q is the number of boundary 
%pixels. B holds the row and column coordinates of the boundary pixels.
%you can use different methods to complete the edge linking function
%the better the quality of object boundary and the more the object boundaries, you will get higher scores  