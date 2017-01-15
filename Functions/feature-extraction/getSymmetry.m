function [ valVert, valHor ] = getSymmetry( img )
%GETSYMMETRY input is a 2D array or 2D gpuArray
%   Output: valVert = count equal pixels vertical halfs
%           valHor = count equal pixels horizontal halfs
    [y ,x] = size(img);
    upperHalfFlip = flipud(img(1:y/2,:));
    lowerHalf = img(y/2+1:y,:);
    leftHalfFlip = fliplr(img(:,1:x/2));
    rightHalf = img(:,x/2+1:x);
    
    horMap = bitand(upperHalfFlip, lowerHalf);
    vertMap = bitand(leftHalfFlip, rightHalf);
    
%     imshow(horMap);
%     figure();
%     imshow(vertMap)
% %     size(leftHalfFlip)
% %     size(rightHalf)
%     figure()
%     imshow(img);
%     
    valVert = sum(vertMap(:));
    valHor = sum(horMap(:));
    
end

