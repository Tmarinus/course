%% Logistics
% change this to change training size
training_size = 200;

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

w = svc(pr_training);

%% Testing

results_svm = labeld(pr_test, w);

%% Confusion Matrices

confmat(pr_test.labels, results_svm);

%% nist_eval

e = nist_eval('my_rep', w);

