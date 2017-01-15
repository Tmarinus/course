datasize = 100;
d_size = 25;

prwaitbar off;

%% Pipeline

tic
%% Preprocessing
% preprocess training and test sets and flatten the cell arrays
% create corresponding label cell arrays
[training, training_labels] = preprocess(prnist(0:9,1:datasize), d_size);
[test, test_labels] = preprocess(prnist(0:9, datasize+1:datasize+25), d_size);

%% Feature Extraction
% extract HOG features for both training and test sets
training_hog = hog(training);
test_hog = hog(test);

%% Training
% build classifier with SVM
classifier = fitcecoc(training_hog, training_labels);

toc

%% Testing
% make class predictions using the test HOG features
predicted_labels = predict(classifier, test_hog);

% display results
confusion_matrix = confusionmat(test_labels, predicted_labels);
helperDisplayConfusionMatrix(confusion_matrix);

% shows every half a second the digit that got classified wrong.
for i = 1:d_size*10
    if(strcmp(test_labels(i, :), predicted_labels(i, :)) == 0)
        imshow(squeeze(test(i,:,:)));
        title(predicted_labels(i, :));
        pause(0.5);
    end
end