% amount of training digits per class
training_size = 1000;
% amount of test digits per class
test_size = 25;

% image size
d_size = 50;

prwaitbar off;

%% Pipeline

tic
%% Preprocessing
% preprocess training and test sets and flatten the cell arrays
% create corresponding label cell arrays
% [training, training_labels] = preprocess(prnist(0:9,1:training_size), d_size);

% Test from leftover main testset
% [test, test_labels] = preprocess(prnist(0:9, training_size+1:training_size+test_size), d_size);
% test with handwritting data
% [test, test_labels] = hand_writing_image_seperation(50);
% test_size = size(test_labels,1)/10;

% Training on handwritten 
% [test, test_labels] = preprocess(prnist(0:9,1:test_size), d_size);
% training = handTraining;
% training_labels = handLabels;
% training_size = size(training_labels,1)/10

% Test handwritten vs handwritten random selection
r = randperm(250,50);
x = [1:250];
rn = setdiff(x,r);
training = handTraining(:,:,r);
training_labels = handLabels(r,:);
test = handTraining(:,:,rn);
test_labels = handLabels(rn,:);


training_size = size(training_labels,1)/10;
test_size = size(test_labels,1)/10;


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

preditcted_strings = cellstr(predicted_labels);
test_strings = cellstr(test_labels);
true = sum(strcmp(test_strings,preditcted_strings));
false = test_size*10 - true;
% shows every half a second the digit that got classified wrong.
% for i = 1:test_size*10
%     if(strcmp(test_labels(i, :), predicted_labels(i, :)) == 0)
%         imshow(test(:,:,i));
%         title(predicted_labels(i, :));
%         pause(0.5);
%     end
% end
disp(fprintf( 'Total %d, correct: %d, err: %d\n', test_size*10, true, false));
