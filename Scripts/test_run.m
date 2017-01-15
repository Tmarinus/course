%% Pipeline

%% Preprocessing
% 10 images per digit for now
% all sized to 25 pixels
preprocessed = preprocess(prnist(0:9,1:10), 25);
[zeros, ones, twos, threes, fours, fives, sixs, sevens, eights, nines] = gen_cells_per_number(preprocessed);

for i = 1:10
    for j = 1:10
        hog(preprocessed{i,j});
    end
end

%% Feature Extraction
% HOG
hog(nines{1});

%% Training

%% Testing
