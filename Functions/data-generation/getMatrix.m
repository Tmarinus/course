function [ bitMatrix ] = getMatrix( prDataset, digit, index )
%GETMATRIX get matrix from digit image
%The first class should be counted as class 1, so first file is as with all
%matlab 1,1.

    prDataIndex = ((digit-1)*1000)+index;
    bitMatrix = data2im(prDataset(prDataIndex));
end

