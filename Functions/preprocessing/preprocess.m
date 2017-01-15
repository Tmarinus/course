function [ out ] = preprocess( in, d_size )
%PREPROCESS Returns preprocessed arrays per digit
%in the input prdatafile
%d_size the desired size of processed digits

dataset_size = size(in, 1) / 10;
out = cell(10, dataset_size);

tic
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
        digit = imresize(digit, [d_size d_size]);
        
        % put each digit into cells with row as number and column as index
        out{i+1, j} = digit;
    end
end
toc

end

