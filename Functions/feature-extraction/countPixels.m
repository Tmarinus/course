function [ count ] = countPixels( img )
%COUNTPIXELS input is a 2D array or 2D gpuArray
%   very simply count the number of white pixels
    count = sum(img(:));

end

