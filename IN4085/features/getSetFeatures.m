function [ featureMatrix ] = getSetFeatures( dataSet )
%getSetFeatures Get the features for each image of the dataSet.
% Dataset should be A(dim,dim,index).

dataSize = size(dataSet, 3);
% compute the first image's HOG to determine vector size
first_im = dataSet(:, :,1);
firstFeatures = getImageFeatures(first_im);
% imshow(first_im);

featureMatrix = zeros(dataSize, length(firstFeatures));
featureMatrix(1, :) = firstFeatures;

parfor i = 2:dataSize
    im = dataSet(:, :, i);
        
    features = getImageFeatures(im);

    featureMatrix(i, :) = features;
end

end

