% amount of training digits per class
training_size = 600;
% amount of test digits per class
test_size = 400;
% image size
d_size = 50;

%r = randperm(150,50);
%x = [1:150];
%rn = setdiff(x,r);
%load('preprocessedData.mat');
%training = handTraining(:,:,r);
%training_labels = processed_labels(r,:);
%test = handTraining(:,:,rn);
%test_labels = processed_labels(rn,:);

%training_size = size(training_labels,1)/10;
%test_size = size(test_labels,1)/10;

prwaitbar off;

%% Pipeline
tic

%% Preprocessing
% preprocess training and test sets and flatten the cell arrays
% create corresponding label cell arrays
[training, training_labels] = preprocess(prnist(0:9,1:training_size), d_size);
training_size = size(training_labels,1)/10;

% Test from leftover main testset
[test, test_labels] = preprocess(prnist(0:9, training_size+1:training_size+test_size), d_size);
test_size = size(test_labels,1)/10;

%% Feature Extraction
% extract HOG features for both training and test sets
training_hog = hog(training);
test_hog = hog(test);

%% Training
% build classifier with SVM for HOG feature
% classifier_hog = fitcecoc(training_hog, training_labels);
% build classifier with knn
% classifier_hog = fitcknn(training_hog, training_labels);
% build classifier with decision tree
 classifier_hog = fitctree(training_hog, training_labels);

 toc

%% Testing
% make class predictions using the test HOG features
predicted_labels_hog = predict(classifier_hog, test_hog);

%% display results for hog
confusion_matrix_hog = confusionmat(test_labels, predicted_labels_hog);
helperDisplayConfusionMatrix(confusion_matrix_hog);

preditcted_strings_hog = cellstr(predicted_labels_hog);

test_strings = cellstr(test_labels);
true_hog = sum(strcmp(test_strings,preditcted_strings_hog));
false_hog = test_size*10 - true_hog;

disp(fprintf( 'Total hog %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog, false_hog, (true_hog/test_size*10)));