function [ out ] = hog( in )
%HOG Extract histogram of oriented gradients (HOG) features.
%   Detailed explanation goes here
[featureVector, hogVisualisation] = extractHOGFeatures(in);

subplot(1,2,1);
imshow(in);
subplot(1,2,2);
plot(hogVisualisation);

out = 0

end

