function [ img_hand, labels_hand ] = hand_writing_image_random_digits( img, num_digits, d_size)
%HAND_WRITING_IMAGE_RANDOM_DIGITS Summary of this function goes here
%   Detailed explanation goes here

% only look at the largest connected components, these should be the
% digits.
bw_img = imcomplement(imbinarize(rgb2gray(img), 'global'));
bw_img=rot90(bw_img,1);
BW2 = bwareafilt(bw_img,num_digits);
BW2 = padarray(BW2, [2, 2]);
components = bwconncomp(BW2);
labelMatrix = labelmatrix(components);
bb=regionprops(labelMatrix,'BoundingBox');
% Extract the found components and convert them to seperate images
temp2 = zeros(d_size, d_size, num_digits);
for i = 1:components.NumObjects
    tmpMatrix = double(labelMatrix==i);
    % Cut out component from image into new matrix.
    bb_i=ceil(bb(i).BoundingBox);
    idx_x=[bb_i(1) bb_i(1)+bb_i(3)];
    idx_y=[bb_i(2) bb_i(2)+bb_i(4)];
    digit = tmpMatrix(idx_y(1):idx_y(2),idx_x(1):idx_x(2));
    digit = im_box(digit, [5, 5, 5, 5]);

    digit=rot90(digit,3);
    
    % remove noise
    digit = remove_noise(digit);
    % straighten the digit
    digit = straighten(digit);

    % resize image so they all have the same size
    digit = imresize(digit, [d_size d_size]);

    % make black white again
    digit = imbinarize(digit);
    % put each digit into cells with row as number and column as index
    temp2( :, :,i) = digit;
end

img_hand = temp2;

% x = figure();
WinOnTop();
labels_hand = repmat(char(0),num_digits,7);
for i = 1 : num_digits
    imshow(img_hand(:,:,i));
    label = input('Please give correct label for current digit.');
    labels_hand(i,:) = sprintf('digit_%d',label); 
end
close;
end