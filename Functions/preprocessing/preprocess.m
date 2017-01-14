function [ out ] = preprocess( in )
%PREPROCESS Returns preprocessed arrays per digit

dataset_size = size(in, 1) / 10;

for i = 0:9
    for j = 1:dataset_size
        index = dataset_size*i + j;
        pr_digit = in(index);
        
        % convert to image
        digit = data2im(pr_digit);
        
        % restrict to bounding box
        digit = im_box(digit, [5, 5, 5, 5]);
        
        % remove noise
        digit = remove_noise(digit);
        
        % straighten the digit
        digit = straighten(digit);
        
        % resize image so they all have the same size
        digit = imresize(digit, [25 25]);
        
        imshow(digit);

    end
end

end

