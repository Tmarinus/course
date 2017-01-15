function [ out ] = remove_noise( in )
%REMOVE_NOISE Noise is removed from the image input. 
%in the image to clean

% structuring element used for noise removal
SE = strel('disk',1);

% close holes
temp = imclose(in, SE);
% erode image for finetuning
temp = imerode(temp, SE);
% dilate the image to recover from unnecessary erosion
temp = imdilate(temp, SE);

out = temp;

end

