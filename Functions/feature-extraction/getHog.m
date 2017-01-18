function [ hog4x4 ] = getHog( im )
%GETHOG Getter for the hog features
%   Output size dependant on image size
    [hog4x4, vis4x4] = extractHOGFeatures(im, 'CellSize', [4 4]);

end

