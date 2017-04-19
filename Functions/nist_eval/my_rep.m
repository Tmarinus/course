function [ out, labels ] = my_rep( in, d_size )
%PREPROCESS Returns a giant column of preprocessed images and their labels.
%in the input prdatafile
%d_size the desired size of processed digits

datasize = size(in, 1);
dataset_size = datasize / 10;

temp = cell(10,1);
tic
parfor i = 0:9
    temp2 = zeros(d_size, d_size, dataset_size);
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
        
        % make black white again
%         digit = imbinarize(digit);
        % put each digit into cells with row as number and column as index
        temp2( :, :,j) = digit;
    end
    temp{i+1} = temp2;
end

temp3 = zeros(d_size, d_size, datasize);
for i = 0:9
   temp3(:,:,(dataset_size*i)+1:(dataset_size*(i+1))) = temp{i+1};
end
toc
out = temp3;
labels = getlabels(in);

end
