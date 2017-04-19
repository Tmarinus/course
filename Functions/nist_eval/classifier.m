function [ w ] = classifier( string, training, labels )
%string is the abbreviation of the given classifier
%   Based on the abbreviations from the PRtools: the strings are
%   "knnc" for k nearest neighbor, "svc" for support vector machine, 
%   "dtc" for decision tree
%   labels are the training labels 
%   training is the training dataset

if string=='svc'
    w = fitcecoc(training, labels);
   
elseif string =='knnc'
    w=fitcknn(training, labels);
        
elseif string=='dtc'
    w=fitctree(training, labels);
        
end

