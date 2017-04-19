function [ features ] = getImageFeatures( img )
%GETFEATURES get array with all the feature values for img.
% Add single features directly, if function has more than one return value
% append them indirectly.

% features = getHog(img);

features = getHoles(img);

[symV, symH] = getSymmetry(img);

features = [ features symV symH];

features = [ features countPixels(img)];

end

