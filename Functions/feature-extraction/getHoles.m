function [ count ] = getHoles( image )
%GETHOLES input is a 2D array or 2D gpuArray
% Output the number of holes found in the image
    
    bwconn = bwconncomp(gather(imcomplement(image)));
    count = bwconn.NumObjects - 1;
end

