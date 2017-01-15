function [ out ] = hog( in )
%HOG Extract histogram of oriented gradients (HOG) features.
%in vector containing all digits

datasize = size(in, 1);

% compute the first image's HOG to determine vector size
first_im = squeeze(in(1, :, :));
[first_hog4x4, first_vis4x4] = extractHOGFeatures(first_im, 'CellSize', [4 4]);
imshow(first_im);

temp = zeros(datasize, length(first_hog4x4));

temp(1, :) = first_hog4x4;

for i = 2:datasize
    im = squeeze(in(i, :, :));
        
    [hog4x4, vis4x4] = extractHOGFeatures(im, 'CellSize', [4 4]);

    imshow(im);

    temp(i, :) = hog4x4;
end

out = temp;

