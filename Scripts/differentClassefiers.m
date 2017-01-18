

prwaitbar off


% 50% 50% training test
% indexListTraining = [1:500, 1001:1500, 2001:2500, 3001:3500, 4001:4500, 5001:5500 ...
%     , 6001:6500, 7001:7500, 8001:8500, 9001:9500];
% indexListTest = [501:1000, 1501:2000, 2501:3000, 3501:4000, 4501:5000, 5501:6000 ...
%     , 6501:7000, 7501:8000, 8501:9000, 9501:10000];

% 80 20 training test
indexListTraining = [1:800, 1001:1800, 2001:2800, 3001:3800, 4001:4800, 5001:5800 ...
    , 6001:6800, 7001:7800, 8001:8800, 9001:9800];
indexListTest = [801:1000, 1801:2000, 2801:3000, 3801:4000, 4801:5000, 5801:6000 ...
    , 6801:7000, 7801:8000, 8801:9000, 9801:10000];

%small testing set
% indexListTraining = [1:100, 1001:1100, 2001:2100, 3001:3100, 4001:4100, 5001:5100 ...
%     , 6001:6100, 7001:7100, 8001:8100, 9001:9100];
% indexListTest = [101:200, 1101:1200, 2101:2200, 3101:3200, 4101:4200, 5101:5200 ...
%     , 6101:6200, 7101:7200, 8101:8200, 9101:9200];

trainingData = imgArrayGrey(:,:,indexListTraining);
trainingLabels = labelArray(indexListTraining,:);

testData = imgArrayGrey(:,:,indexListTest);
testLabels = labelArray(indexListTest,:);

%% Feature Extraction
% extract HOG features for both training and test sets
training_hog = hog(trainingData);
test_hog = hog(testData);
training_all = getSetFeatures(trainingData);
test_all = getSetFeatures(testData);
tic
knn_hog = fitcknn(training_hog, trainingLabels);
knn_all = fitcknn(training_all, trainingLabels);
cecoc_hog = fitcecoc(training_hog, trainingLabels);
cecoc_all = fitcecoc(training_all, trainingLabels);
toc
tic
[pred_knn_hog, ~, ~] = predict(knn_hog, test_hog);
[pred_knn_all, ~, ~] = predict(knn_all, test_all);
[pred_cecoc_hog, ~, ~] = predict(cecoc_hog, test_hog);
[pred_cecoc_all, ~, ~] = predict(cecoc_all, test_all);
toc
% display results
disp('pred_knn_hog')
confusion_matrix = confusionmat(testLabels, pred_knn_hog);
disp(max(confusion_matrix));
helperDisplayConfusionMatrix(confusion_matrix);

disp('pred_knn_all')
confusion_matrix = confusionmat(testLabels, pred_knn_all);
disp(max(confusion_matrix));
helperDisplayConfusionMatrix(confusion_matrix);

disp('pred_cecoc_hog')
confusion_matrix = confusionmat(testLabels, pred_cecoc_hog);
disp(max(confusion_matrix));
helperDisplayConfusionMatrix(confusion_matrix);

disp('pred_cecoc_all')
confusion_matrix = confusionmat(testLabels, pred_cecoc_all);
disp(max(confusion_matrix));
helperDisplayConfusionMatrix(confusion_matrix);



%% Comparison test for two classifiers.
disp('knn hog vs all')
testcholdout(pred_knn_hog,pred_knn_all,testLabels)
disp('cecoc hog vs all')
testcholdout(pred_cecoc_hog,pred_cecoc_all,testLabels)
disp('knn vs cecoc hog ')
testcholdout(pred_knn_hog,pred_cecoc_hog,testLabels)
disp('knn vs cecoc all ')
testcholdout(pred_knn_all,pred_cecoc_all,testLabels)

