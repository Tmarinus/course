%% Run this script given that you have the data and label materials!!!

%% Logistics
dataset_size = 10000;
training_size = 10;

%% Processing
training = processed_data(:, :, 1:training_size);
training_labels = processed_labels(1:training_size, :);

test = processed_data(:, :, training_size+1:dataset_size);
test_labels = processed_labels(training_size+1:dataset_size, :);

%% Feature extraction
training_hog = hog(training);
test_hog = hog(test);

%% Conversion

pr_training = prdataset(training_hog, training_labels);
pr_test = prdataset(test_hog, test_labels);

%% Training

w_svm = svc(pr_training);
w_knn = knnc(pr_training);
w_dtc = dtc(pr_training);

%% Testing

results_svm = labeld(pr_test, w_svm);
results_knn = labeld(pr_test, w_knn);
results_dtc = labeld(pr_test, w_dtc);

%% Confusion Matrices

confmat(test_labels, results_svm);
confmat(test_labels, results_knn);
confmat(test_labels, results_dtc);

%% nist_eval

e_svm = nist_eval('my_rep', w_svm);
%e_knn = nist_eval('my_rep', w_knn);
%e_dtc = nist_eval('my_rep', w_dtc);


