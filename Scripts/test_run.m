datasize = 5;
d_size = 25;

%% Pipeline

%% Preprocessing
% preprocess training and test sets and flatten the cell arrays
% create corresponding label cell arrays
[training, training_labels] = preprocess(prnist(0:9,1:datasize), d_size);
[test, test_labels] = preprocess(prnist(0:9, datasize+1:datasize+datasize), d_size);

%% Feature Extraction
% extract HOG features for both training and test sets
training_hog = hog(training);
test_hog = hog(test);

%% Training
% convert cell arrays to matrices
training_hog_mat = cell2mat(training_hog);

% build classifier with SVM
classifier = fitcecoc(training_hog_mat, training_labels);

%% Testing
% convert cell arrays to matrices
test_hog_mat = cell2mat(test_hog);

% make class predictions using the test HOG features
predicted_labels = predict(classifier, test_hog_mat);

% display results
confusion_matrix = confusionmat(test_labels, predicted_labels);
helperDisplayConfusionMatrix(confusion_matrix);