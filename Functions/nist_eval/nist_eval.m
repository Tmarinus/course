function [ error ] = nist_eval( w,n,d_size )
% filename is received from the processed dataset
% w is the given classifier, check function classifier for more details
% n is the desired number of digits per class to be tested
% error is the classification error for this combination of inputs

%% Pipeline
tic

%% Preprocessing
% preprocess training and test sets and flatten the cell arrays
% if the data for training is chosen sequential
%x=prnist(0:9,1:n);
%y=prnist(0:9,n+1:1000);

% if the data for training is chosen at random
x = prnist(0:9,randperm(1000,n));
y = prnist(0:9,setdiff(1:1000,randperm(1000,n)));

% create corresponding label cell arrays
[training, training_labels] = my_rep(x, d_size); 

% Test from leftover main testset
[test, test_labels] = my_rep(y, d_size);

test_size = size(test_labels,1)/10;

%% Feature Extraction
% extract HOG features for both training and test sets
training_hog = hog(training);
test_hog = hog(test);

%% Training
% build classifier with SVM for HOG feature
 classifier_hog = classifier(w,training_hog, training_labels);

toc

%% Testing
% make class predictions using the test HOG features
 predicted_labels_hog = predict(classifier_hog, test_hog);

%% calculate results
 confusion_matrix_hog = confusionmat(test_labels, predicted_labels_hog);
 helperDisplayConfusionMatrix(confusion_matrix_hog);

 preditcted_strings_hog = cellstr(predicted_labels_hog);
 test_strings = cellstr(test_labels);
 
 true_hog = sum(strcmp(test_strings,preditcted_strings_hog));
 false_hog = test_size*10-true_hog;
 error=true_hog/test_size*10;
 
 disp(fprintf( 'Correct: %d, err: %d\n', true_hog, false_hog));
end

