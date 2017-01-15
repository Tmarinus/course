%% Pipeline

%% Preprocessing
% 1000 images per digit for now
% all sized to 25 pixels
preprocessed = preprocess(prnist(0:9,1:1000), 25);
[zeros, ones, twos, threes, fours, fives, sixs, sevens, eights, nines] = gen_cells_per_number(preprocessed);

%% Feature Extraction
% HOG

%% Training

%% Testing
