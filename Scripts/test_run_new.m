% amount of training digits per class
training_size = 10;
% amount of test digits per class
%test_size = 5;
% image size
d_size = 50;
% total size of objects per class
x = [1:1000];

prwaitbar off;

%% Pipeline
tic

%% Preprocessing
% preprocess training and test sets and flatten the cell arrays
% create corresponding label cell arrays
%[training, training_labels] = preprocess(prnist(0:9,1:training_size), d_size);
[training, training_labels] = preprocess(prnist(0:9,randperm(1000,training_size)), d_size); 
training_size = size(training_labels,1)/10;

% Test from leftover main testset
% [test, test_labels] = preprocess(prnist(0:9,training_size+1:1000), d_size);
[test, test_labels] = preprocess(prnist(0:9,setdiff(x,randperm(1000,training_size))), d_size);
test_size = size(test_labels,1)/10;

%% Feature Extraction
% extract HOG features for both training and test sets
training_hog = getSetFeatures(training);
test_hog = getSetFeatures(test);

%% Training
% build classifier with SVM for HOG feature
 classifier_hog_SVM = fitcecoc(training_hog, training_labels);
% build classifier with knn
 classifier_hog_KNN = fitcknn(training_hog, training_labels);
% build cla ssifier with Decision tree                                                                                                                                                                                                                                               ssifier with decision tree
 classifier_hog_DT = fitctree(training_hog, training_labels);

 toc

%% Testing
% make class predictions using the test HOG features
 predicted_labels_hog_SVM = predict(classifier_hog_SVM, test_hog);
 predicted_labels_hog_KNN = predict(classifier_hog_KNN, test_hog);
 predicted_labels_hog_DT = predict(classifier_hog_DT, test_hog);

%% display results for hog
 confusion_matrix_hog_SVM = confusionmat(test_labels, predicted_labels_hog_SVM);
 helperDisplayConfusionMatrix(confusion_matrix_hog_SVM);
 confusion_matrix_hog_KNN = confusionmat(test_labels, predicted_labels_hog_KNN);
 helperDisplayConfusionMatrix(confusion_matrix_hog_KNN);
 confusion_matrix_hog_DT = confusionmat(test_labels, predicted_labels_hog_DT);
 helperDisplayConfusionMatrix(confusion_matrix_hog_DT);
 
 preditcted_strings_hog_SVM = cellstr(predicted_labels_hog_SVM);
 preditcted_strings_hog_KNN = cellstr(predicted_labels_hog_KNN);
 preditcted_strings_hog_DT = cellstr(predicted_labels_hog_DT);

 test_strings = cellstr(test_labels);
 true_hog_SVM = sum(strcmp(test_strings,preditcted_strings_hog_SVM));
 false_hog_SVM = test_size*10 - true_hog_SVM;
 true_hog_KNN = sum(strcmp(test_strings,preditcted_strings_hog_KNN));
 false_hog_KNN = test_size*10 - true_hog_KNN;
 true_hog_DT = sum(strcmp(test_strings,preditcted_strings_hog_DT));
 false_hog_DT = test_size*10 - true_hog_DT;

 disp(fprintf( 'Total hog SVM %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_SVM, false_hog_SVM, (true_hog_SVM/test_size*10)));
 disp(fprintf( 'Total hog KNN %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_KNN, false_hog_KNN, (true_hog_KNN/test_size*10)));
 disp(fprintf( 'Total hog DT %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_DT, false_hog_DT, (true_hog_DT/test_size*10)));
 
 %% Training 600
 % amount of training digits per class
training_size = 600;
% amount of test digits per class
%test_size = 5;
% image size
d_size = 50;
% total size of objects per class
x = [1:1000];

prwaitbar off;

%% Pipeline
tic

%% Preprocessing
% preprocess training and test sets and flatten the cell arrays
% create corresponding label cell arrays
%[training, training_labels] = preprocess(prnist(0:9,1:training_size), d_size);
[training, training_labels] = preprocess(prnist(0:9,randperm(1000,training_size)), d_size); 
training_size = size(training_labels,1)/10;

% Test from leftover main testset
% [test, test_labels] = preprocess(prnist(0:9,training_size+1:1000), d_size);
[test, test_labels] = preprocess(prnist(0:9,setdiff(x,randperm(1000,training_size))), d_size);
test_size = size(test_labels,1)/10;

%% Feature Extraction
% extract HOG features for both training and test sets
training_hog = getSetFeatures(training);
test_hog = getSetFeatures(test);

%% Training
% build classifier with SVM for HOG feature
 classifier_hog_SVM = fitcecoc(training_hog, training_labels);
% build classifier with knn
 classifier_hog_KNN = fitcknn(training_hog, training_labels);
% build cla ssifier with Decision tree                                                                                                                                                                                                                                               ssifier with decision tree
 classifier_hog_DT = fitctree(training_hog, training_labels);

 toc

%% Testing
% make class predictions using the test HOG features
 predicted_labels_hog_SVM = predict(classifier_hog_SVM, test_hog);
 predicted_labels_hog_KNN = predict(classifier_hog_KNN, test_hog);
 predicted_labels_hog_DT = predict(classifier_hog_DT, test_hog);

%% display results for hog
 confusion_matrix_hog_SVM = confusionmat(test_labels, predicted_labels_hog_SVM);
 helperDisplayConfusionMatrix(confusion_matrix_hog_SVM);
 confusion_matrix_hog_KNN = confusionmat(test_labels, predicted_labels_hog_KNN);
 helperDisplayConfusionMatrix(confusion_matrix_hog_KNN);
 confusion_matrix_hog_DT = confusionmat(test_labels, predicted_labels_hog_DT);
 helperDisplayConfusionMatrix(confusion_matrix_hog_DT);
 
 preditcted_strings_hog_SVM = cellstr(predicted_labels_hog_SVM);
 preditcted_strings_hog_KNN = cellstr(predicted_labels_hog_KNN);
 preditcted_strings_hog_DT = cellstr(predicted_labels_hog_DT);

 test_strings = cellstr(test_labels);
 true_hog_SVM = sum(strcmp(test_strings,preditcted_strings_hog_SVM));
 false_hog_SVM = test_size*10 - true_hog_SVM;
 true_hog_KNN = sum(strcmp(test_strings,preditcted_strings_hog_KNN));
 false_hog_KNN = test_size*10 - true_hog_KNN;
 true_hog_DT = sum(strcmp(test_strings,preditcted_strings_hog_DT));
 false_hog_DT = test_size*10 - true_hog_DT;

 disp(fprintf( 'Total hog SVM %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_SVM, false_hog_SVM, (true_hog_SVM/test_size*10)));
 disp(fprintf( 'Total hog KNN %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_KNN, false_hog_KNN, (true_hog_KNN/test_size*10)));
 disp(fprintf( 'Total hog DT %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_DT, false_hog_DT, (true_hog_DT/test_size*10)));
 
%% Training 800
% amount of training digits per class
training_size = 800;
% amount of test digits per class
%test_size = 5;
% image size
d_size = 50;
% total size of objects per class
x = [1:1000];

prwaitbar off;

%% Pipeline
tic

%% Preprocessing
% preprocess training and test sets and flatten the cell arrays
% create corresponding label cell arrays
%[training, training_labels] = preprocess(prnist(0:9,1:training_size), d_size);
[training, training_labels] = preprocess(prnist(0:9,randperm(1000,training_size)), d_size); 
training_size = size(training_labels,1)/10;

% Test from leftover main testset
% [test, test_labels] = preprocess(prnist(0:9,training_size+1:1000), d_size);
[test, test_labels] = preprocess(prnist(0:9,setdiff(x,randperm(1000,training_size))), d_size);
test_size = size(test_labels,1)/10;

%% Feature Extraction
% extract HOG features for both training and test sets
training_hog = getSetFeatures(training);
test_hog = getSetFeatures(test);

%% Training
% build classifier with SVM for HOG feature
 classifier_hog_SVM = fitcecoc(training_hog, training_labels);
% build classifier with knn
 classifier_hog_KNN = fitcknn(training_hog, training_labels);
% build cla ssifier with Decision tree                                                                                                                                                                                                                                               ssifier with decision tree
 classifier_hog_DT = fitctree(training_hog, training_labels);

 toc

%% Testing
% make class predictions using the test HOG features
 predicted_labels_hog_SVM = predict(classifier_hog_SVM, test_hog);
 predicted_labels_hog_KNN = predict(classifier_hog_KNN, test_hog);
 predicted_labels_hog_DT = predict(classifier_hog_DT, test_hog);

%% display results for hog
 confusion_matrix_hog_SVM = confusionmat(test_labels, predicted_labels_hog_SVM);
 helperDisplayConfusionMatrix(confusion_matrix_hog_SVM);
 confusion_matrix_hog_KNN = confusionmat(test_labels, predicted_labels_hog_KNN);
 helperDisplayConfusionMatrix(confusion_matrix_hog_KNN);
 confusion_matrix_hog_DT = confusionmat(test_labels, predicted_labels_hog_DT);
 helperDisplayConfusionMatrix(confusion_matrix_hog_DT);
 
 preditcted_strings_hog_SVM = cellstr(predicted_labels_hog_SVM);
 preditcted_strings_hog_KNN = cellstr(predicted_labels_hog_KNN);
 preditcted_strings_hog_DT = cellstr(predicted_labels_hog_DT);

 test_strings = cellstr(test_labels);
 true_hog_SVM = sum(strcmp(test_strings,preditcted_strings_hog_SVM));
 false_hog_SVM = test_size*10 - true_hog_SVM;
 true_hog_KNN = sum(strcmp(test_strings,preditcted_strings_hog_KNN));
 false_hog_KNN = test_size*10 - true_hog_KNN;
 true_hog_DT = sum(strcmp(test_strings,preditcted_strings_hog_DT));
 false_hog_DT = test_size*10 - true_hog_DT;

 disp(fprintf( 'Total hog SVM %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_SVM, false_hog_SVM, (true_hog_SVM/test_size*10)));
 disp(fprintf( 'Total hog KNN %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_KNN, false_hog_KNN, (true_hog_KNN/test_size*10)));
 disp(fprintf( 'Total hog DT %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_DT, false_hog_DT, (true_hog_DT/test_size*10)));

%% Sequential tests
% amount of training digits per class
training_size = 10;
% amount of test digits per class
%test_size = 5;
% image size
d_size = 50;
% total size of objects per class
x = [1:1000];

prwaitbar off;

%% Pipeline
tic

%% Preprocessing
% preprocess training and test sets and flatten the cell arrays
% create corresponding label cell arrays
[training, training_labels] = preprocess(prnist(0:9,1:training_size), d_size);
%[training, training_labels] = preprocess(prnist(0:9,randperm(1000,training_size)), d_size); 
training_size = size(training_labels,1)/10;

% Test from leftover main testset
[test, test_labels] = preprocess(prnist(0:9,training_size+1:1000), d_size);
%[test, test_labels] = preprocess(prnist(0:9,setdiff(x,randperm(1000,training_size))), d_size);
test_size = size(test_labels,1)/10;

%% Feature Extraction
% extract HOG features for both training and test sets
training_hog = getSetFeatures(training);
test_hog = getSetFeatures(test);

%% Training
% build classifier with SVM for HOG feature
 classifier_hog_SVM = fitcecoc(training_hog, training_labels);
% build classifier with knn
 classifier_hog_KNN = fitcknn(training_hog, training_labels);
% build cla ssifier with Decision tree                                                                                                                                                                                                                                               ssifier with decision tree
 classifier_hog_DT = fitctree(training_hog, training_labels);

 toc

%% Testing
% make class predictions using the test HOG features
 predicted_labels_hog_SVM = predict(classifier_hog_SVM, test_hog);
 predicted_labels_hog_KNN = predict(classifier_hog_KNN, test_hog);
 predicted_labels_hog_DT = predict(classifier_hog_DT, test_hog);

%% display results for hog
 confusion_matrix_hog_SVM = confusionmat(test_labels, predicted_labels_hog_SVM);
 helperDisplayConfusionMatrix(confusion_matrix_hog_SVM);
 confusion_matrix_hog_KNN = confusionmat(test_labels, predicted_labels_hog_KNN);
 helperDisplayConfusionMatrix(confusion_matrix_hog_KNN);
 confusion_matrix_hog_DT = confusionmat(test_labels, predicted_labels_hog_DT);
 helperDisplayConfusionMatrix(confusion_matrix_hog_DT);
 
 preditcted_strings_hog_SVM = cellstr(predicted_labels_hog_SVM);
 preditcted_strings_hog_KNN = cellstr(predicted_labels_hog_KNN);
 preditcted_strings_hog_DT = cellstr(predicted_labels_hog_DT);

 test_strings = cellstr(test_labels);
 true_hog_SVM = sum(strcmp(test_strings,preditcted_strings_hog_SVM));
 false_hog_SVM = test_size*10 - true_hog_SVM;
 true_hog_KNN = sum(strcmp(test_strings,preditcted_strings_hog_KNN));
 false_hog_KNN = test_size*10 - true_hog_KNN;
 true_hog_DT = sum(strcmp(test_strings,preditcted_strings_hog_DT));
 false_hog_DT = test_size*10 - true_hog_DT;

 disp(fprintf( 'Total hog SVM %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_SVM, false_hog_SVM, (true_hog_SVM/test_size*10)));
 disp(fprintf( 'Total hog KNN %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_KNN, false_hog_KNN, (true_hog_KNN/test_size*10)));
 disp(fprintf( 'Total hog DT %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_DT, false_hog_DT, (true_hog_DT/test_size*10)));
 
 %% Training 600
 % amount of training digits per class
training_size = 600;
% amount of test digits per class
%test_size = 5;
% image size
d_size = 50;
% total size of objects per class
x = [1:1000];

prwaitbar off;

%% Pipeline
tic

%% Preprocessing
% preprocess training and test sets and flatten the cell arrays
% create corresponding label cell arrays
[training, training_labels] = preprocess(prnist(0:9,1:training_size), d_size);
%[training, training_labels] = preprocess(prnist(0:9,randperm(1000,training_size)), d_size); 
training_size = size(training_labels,1)/10;

% Test from leftover main testset
[test, test_labels] = preprocess(prnist(0:9,training_size+1:1000), d_size);
% [test, test_labels] = preprocess(prnist(0:9,setdiff(x,randperm(1000,training_size))), d_size);
test_size = size(test_labels,1)/10;

%% Feature Extraction
% extract HOG features for both training and test sets
training_hog = getSetFeatures(training);
test_hog = getSetFeatures(test);

%% Training
% build classifier with SVM for HOG feature
 classifier_hog_SVM = fitcecoc(training_hog, training_labels);
% build classifier with knn
 classifier_hog_KNN = fitcknn(training_hog, training_labels);
% build cla ssifier with Decision tree                                                                                                                                                                                                                                               ssifier with decision tree
 classifier_hog_DT = fitctree(training_hog, training_labels);

 toc

%% Testing
% make class predictions using the test HOG features
 predicted_labels_hog_SVM = predict(classifier_hog_SVM, test_hog);
 predicted_labels_hog_KNN = predict(classifier_hog_KNN, test_hog);
 predicted_labels_hog_DT = predict(classifier_hog_DT, test_hog);

%% display results for hog
 confusion_matrix_hog_SVM = confusionmat(test_labels, predicted_labels_hog_SVM);
 helperDisplayConfusionMatrix(confusion_matrix_hog_SVM);
 confusion_matrix_hog_KNN = confusionmat(test_labels, predicted_labels_hog_KNN);
 helperDisplayConfusionMatrix(confusion_matrix_hog_KNN);
 confusion_matrix_hog_DT = confusionmat(test_labels, predicted_labels_hog_DT);
 helperDisplayConfusionMatrix(confusion_matrix_hog_DT);
 
 preditcted_strings_hog_SVM = cellstr(predicted_labels_hog_SVM);
 preditcted_strings_hog_KNN = cellstr(predicted_labels_hog_KNN);
 preditcted_strings_hog_DT = cellstr(predicted_labels_hog_DT);

 test_strings = cellstr(test_labels);
 true_hog_SVM = sum(strcmp(test_strings,preditcted_strings_hog_SVM));
 false_hog_SVM = test_size*10 - true_hog_SVM;
 true_hog_KNN = sum(strcmp(test_strings,preditcted_strings_hog_KNN));
 false_hog_KNN = test_size*10 - true_hog_KNN;
 true_hog_DT = sum(strcmp(test_strings,preditcted_strings_hog_DT));
 false_hog_DT = test_size*10 - true_hog_DT;

 disp(fprintf( 'Total hog SVM %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_SVM, false_hog_SVM, (true_hog_SVM/test_size*10)));
 disp(fprintf( 'Total hog KNN %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_KNN, false_hog_KNN, (true_hog_KNN/test_size*10)));
 disp(fprintf( 'Total hog DT %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_DT, false_hog_DT, (true_hog_DT/test_size*10)));
 
%% Training 800
% amount of training digits per class
training_size = 800;
% amount of test digits per class
%test_size = 5;
% image size
d_size = 50;
% total size of objects per class
x = [1:1000];

prwaitbar off;

%% Pipeline
tic

%% Preprocessing
% preprocess training and test sets and flatten the cell arrays
% create corresponding label cell arrays
[training, training_labels] = preprocess(prnist(0:9,1:training_size), d_size);
%[training, training_labels] = preprocess(prnist(0:9,randperm(1000,training_size)), d_size); 
training_size = size(training_labels,1)/10;

% Test from leftover main testset
 [test, test_labels] = preprocess(prnist(0:9,training_size+1:1000), d_size);
% [test, test_labels] = preprocess(prnist(0:9,setdiff(x,randperm(1000,training_size))), d_size);
test_size = size(test_labels,1)/10;

%% Feature Extraction
% extract HOG features for both training and test sets
training_hog = getSetFeatures(training);
test_hog = getSetFeatures(test);

%% Training
% build classifier with SVM for HOG feature
 classifier_hog_SVM = fitcecoc(training_hog, training_labels);
% build classifier with knn
 classifier_hog_KNN = fitcknn(training_hog, training_labels);
% build cla ssifier with Decision tree                                                                                                                                                                                                                                               ssifier with decision tree
 classifier_hog_DT = fitctree(training_hog, training_labels);

 toc

%% Testing
% make class predictions using the test HOG features
 predicted_labels_hog_SVM = predict(classifier_hog_SVM, test_hog);
 predicted_labels_hog_KNN = predict(classifier_hog_KNN, test_hog);
 predicted_labels_hog_DT = predict(classifier_hog_DT, test_hog);

%% display results for hog
 confusion_matrix_hog_SVM = confusionmat(test_labels, predicted_labels_hog_SVM);
 helperDisplayConfusionMatrix(confusion_matrix_hog_SVM);
 confusion_matrix_hog_KNN = confusionmat(test_labels, predicted_labels_hog_KNN);
 helperDisplayConfusionMatrix(confusion_matrix_hog_KNN);
 confusion_matrix_hog_DT = confusionmat(test_labels, predicted_labels_hog_DT);
 helperDisplayConfusionMatrix(confusion_matrix_hog_DT);
 
 preditcted_strings_hog_SVM = cellstr(predicted_labels_hog_SVM);
 preditcted_strings_hog_KNN = cellstr(predicted_labels_hog_KNN);
 preditcted_strings_hog_DT = cellstr(predicted_labels_hog_DT);

 test_strings = cellstr(test_labels);
 true_hog_SVM = sum(strcmp(test_strings,preditcted_strings_hog_SVM));
 false_hog_SVM = test_size*10 - true_hog_SVM;
 true_hog_KNN = sum(strcmp(test_strings,preditcted_strings_hog_KNN));
 false_hog_KNN = test_size*10 - true_hog_KNN;
 true_hog_DT = sum(strcmp(test_strings,preditcted_strings_hog_DT));
 false_hog_DT = test_size*10 - true_hog_DT;

 disp(fprintf( 'Total hog SVM %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_SVM, false_hog_SVM, (true_hog_SVM/test_size*10)));
 disp(fprintf( 'Total hog KNN %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_KNN, false_hog_KNN, (true_hog_KNN/test_size*10)));
 disp(fprintf( 'Total hog DT %d, correct: %d, err: %d\n, accuracy: %d\n', test_size*10, true_hog_DT, false_hog_DT, (true_hog_DT/test_size*10)));