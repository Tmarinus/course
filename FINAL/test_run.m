%% Logistics
training_size = 10;

%% NIST

% toggle if the data for training is chosen sequential
% training_data = prnist(0:9, 1:training_size);
% test_data = prnist(0:9, training_size+1:1000);

% toggle if the data for training is chosen at random
% training_data = prnist(0:9,randperm(1000,training_size));
% test_data = prnist(0:9,setdiff(1:1000,randperm(1000,training_size)));

%% my_rep
pr_training = my_rep(training_data);
pr_test = my_rep(test_data);

%% Training

w_svm = svc(pr_training);
w_knn = knnc(pr_training);
w_dtc = dtc(pr_training);

%% Testing

results_svm = labeld(pr_test, w_svm);
results_knn = labeld(pr_test, w_knn);
results_dtc = labeld(pr_test, w_dtc);

%% Confusion Matrices

confmat(pr_test.labels, results_svm);
confmat(pr_test.labels, results_knn);
confmat(pr_test.labels, results_dtc);

%% nist_eval

%e_svm = nist_eval('my_rep', w_svm);
e_knn = nist_eval('my_rep', w_knn);
%e_dtc = nist_eval('my_rep', w_dtc);


