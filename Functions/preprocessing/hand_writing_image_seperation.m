function [ img_hand, labels_hand] = hand_writing_image_seperation( d_size )

% % Test set 1
% img_per_digit = 5;
% input{1} = imread('/home/dwarrel/pattern/course/Data/hand_0.png');
% input{2}= imread('/home/dwarrel/pattern/course/Data/hand_1.png');
% input{3} = imread('/home/dwarrel/pattern/course/Data/hand_2.png');
% input{4} = imread('/home/dwarrel/pattern/course/Data/hand_3.png');
% input{5} = imread('/home/dwarrel/pattern/course/Data/hand_4.png');
% input{6} = imread('/home/dwarrel/pattern/course/Data/hand_5.png');
% input{7} = imread('/home/dwarrel/pattern/course/Data/hand_6.png');
% input{8} = imread('/home/dwarrel/pattern/course/Data/hand_7.png');
% input{9} = imread('/home/dwarrel/pattern/course/Data/hand_8.png');
% input{10} = imread('/home/dwarrel/pattern/course/Data/hand_9.png');

%Test set 2
% img_per_digit = 10;
% input{1} = imread('/home/dwarrel/pattern/course/Data/1hand_0.png');
% input{2} = imread('/home/dwarrel/pattern/course/Data/1hand_1.png');
% input{3} = imread('/home/dwarrel/pattern/course/Data/1hand_2.png');
% input{4} = imread('/home/dwarrel/pattern/course/Data/1hand_3.png');
% input{5} = imread('/home/dwarrel/pattern/course/Data/1hand_4.png');
% input{6} = imread('/home/dwarrel/pattern/course/Data/1hand_5.png');
% input{7} = imread('/home/dwarrel/pattern/course/Data/1hand_6.png');
% input{8} = imread('/home/dwarrel/pattern/course/Data/1hand_7.png');
% input{9} = imread('/home/dwarrel/pattern/course/Data/1hand_8.png');
% input{10} = imread('/home/dwarrel/pattern/course/Data/1hand_9.png');


%%Test set 3
img_per_digit = 10;
input{1} = imread('/home/dwarrel/pattern/course/Data/valDigits/hand_0.png');
input{2}= imread('/home/dwarrel/pattern/course/Data/valDigits/hand_1.png');
input{3} = imread('/home/dwarrel/pattern/course/Data/valDigits/hand_2.png');
input{4} = imread('/home/dwarrel/pattern/course/Data/valDigits/hand_3.png');
input{5} = imread('/home/dwarrel/pattern/course/Data/valDigits/hand_4.png');
input{6} = imread('/home/dwarrel/pattern/course/Data/valDigits/hand_5.png');
input{7} = imread('/home/dwarrel/pattern/course/Data/valDigits/hand_6.png');
input{8} = imread('/home/dwarrel/pattern/course/Data/valDigits/hand_7.png');
input{9} = imread('/home/dwarrel/pattern/course/Data/valDigits/hand_8.png');
input{10} = imread('/home/dwarrel/pattern/course/Data/valDigits/hand_9.png');

temp = cell(10,1);
for j = 1:10
    % only look at the largest connected components, these should be the
    % digits.
    bw_img = imcomplement(imbinarize(rgb2gray(cell2mat(input(j))), 'global'));
    BW2 = bwareafilt(bw_img,img_per_digit);
    BW2 = padarray(BW2, [2, 2]);
    components = bwconncomp(BW2);
    labelMatrix = labelmatrix(components);
    bb=regionprops(labelMatrix,'BoundingBox');
    % Extract the found components and convert them to seperate images
    temp2 = zeros(d_size, d_size, img_per_digit);
    for i = 1:components.NumObjects
        tmpMatrix = double(labelMatrix==i);
        
        % Cut out component from image into new matrix.
        bb_i=ceil(bb(i).BoundingBox);
        idx_x=[bb_i(1) bb_i(1)+bb_i(3)];
        idx_y=[bb_i(2) bb_i(2)+bb_i(4)];
        digit = tmpMatrix(idx_y(1):idx_y(2),idx_x(1):idx_x(2));
        digit = im_box(digit, [5, 5, 5, 5]);
        
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
    temp{j} = temp2;
end


temp3 = zeros(d_size, d_size, img_per_digit);
labels = repmat(char(0),10*img_per_digit,7);
for i = 0:9
   temp3(:,:,(img_per_digit*i)+1:(img_per_digit*(i+1))) = temp{i+1};
   for j = 1:img_per_digit
    labels((i*img_per_digit)+j,:) = sprintf('digit_%d',i);
   end
end

img_hand = temp3;
labels_hand = labels;
