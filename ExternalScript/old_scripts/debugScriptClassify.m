%% Personal debugScript for T

% testObject = squeeze(rawMatrix(1:10, 2, :,:));
% 
% [y , ~ ,~] = size(testObject);
% 
% for i = 1:y
%     getHoles(squeeze(testObject(i,:,:)))
%     disp(i);
%     show(squeeze(gather(testObject(i,:,:))));
%     pause(1);
% end

prwaitbar off


% 50% 50% training test
indexListTraining = [1:500, 1001:1500, 2001:2500, 3001:3500, 4001:4500, 5001:5500 ...
    , 6001:6500, 7001:7500, 8001:8500, 9001:9500];
indexListTest = [501:1000, 1501:2000, 2501:3000, 3501:4000, 4501:5000, 5501:6000 ...
    , 6501:7000, 7501:8000, 8501:9000, 9501:10000];

% 80 20 training test
% indexListTraining = [1:800, 1001:1800, 2001:2800, 3001:3800, 4001:4800, 5001:5800 ...
%     , 6001:6800, 7001:7800, 8001:8800, 9001:9800];
% indexListTest = [801:1000, 1801:2000, 2801:3000, 3801:4000, 4801:5000, 5801:6000 ...
%     , 6801:7000, 7801:8000, 8801:9000, 9801:10000];

%small testing set
% indexListTraining = [1:100, 1001:1100, 2001:2100, 3001:3100, 4001:4100, 5001:5100 ...
%     , 6001:6100, 7001:7100, 8001:8100, 9001:9100];
% indexListTest = [101:200, 1101:1200, 2101:2200, 3101:3200, 4101:4200, 5101:5200 ...
%     , 6101:6200, 7101:7200, 8101:8200, 9101:9200];

trainingData = imgArrayGrey(:,:,indexListTraining);
trainingLabels = labelArray(indexListTraining,:);

testData = imgArrayGrey(:,:,indexListTest);
testLabels = labelArray(indexListTest,:);


tic
%% Feature Extraction
% extract HOG features for both training and test sets
training_hog = hog(trainingData);
test_hog = hog(testData);

%% Training
% build classifier with SVM
classifier = fitcecoc(training_hog, trainingLabels);

toc

%% Testing
% make class predictions using the test HOG features
[predicted_labels, X0E, MPRED] = predict(classifier, test_hog);

% display results
confusion_matrix = confusionmat(testLabels, predicted_labels);
helperDisplayConfusionMatrix(confusion_matrix);

% shows every half a second the digit that got classified wrong.
clear wrongImgs wrongLabels wrongIndex;
x = 1;
for i = 1:size(testData, 3)
    if(strcmp(testLabels(i, :), predicted_labels(i, :)) == 0)
        wrongImgs(:,:,x) = testData(:,:,i);
        wrongLabels(x,:) = predicted_labels(i, :);
        wrongIndex(x) = i;
        x = x + 1;
    end
end
