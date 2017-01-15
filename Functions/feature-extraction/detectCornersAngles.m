function [ output_args ] = detectCornersAngles( img )
%DETECTCORNERSANGLES input is a 2D array or 2D gpuArray
%   Try to detect corners and the angle of them.


    % resize image for so not every pixel is a corner
    imgScaled = imbinarize(imresize(img, 10),0.5);
    
    corners = detectHarrisFeatures(imgScaled)
    imshow(imgScaled); hold on;
    plot(corners.selectStrongest(50));
    hold off;
end

