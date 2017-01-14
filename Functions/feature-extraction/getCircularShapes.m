function [ output_args ] = getCircularShapes( img )
%GETCIRCULARSHAPES input is a 2D array or 2D gpuArray
%   Returns circular properties of object
    Rmin = 150;
    Rmax = 450;
    % resize image for imfindcircles to work
    imgScaled = imresize(img, 10);
    
    [centerPos radius] = imfindcircles(gather(imgScaled),[Rmin Rmax],'ObjectPolarity','dark' ...
        ,'sensitivity',0.98)
    
    imshow(imgScaled);
    viscircles(centerPos, radius,'EdgeColor','b');

end

