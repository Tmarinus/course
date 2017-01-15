%% Change equalSize to equalsizeGpu if you want to obtain gpuArrays 
% in essence they should be faster and be using GPU for some computations
% do note that some functions cannot handle GPUarrays for those you can 
% obtain the normal array by using gather(gpuArray) 
% to go back to gpu array use gpuArray(array), or zeros(1,2,3, 'gpuArray')

tic
    prDataNist = prnist(0:9,1:1000);
toc

tic
    rawMatrix = equalizeSize(prDataNist);
%     rawMatrix = equalizeSizeGpu(prDataNist);
toc
tic
digit_0 = squeeze(rawMatrix(1,:,:,:));
digit_1 = squeeze(rawMatrix(2,:,:,:));
digit_2 = squeeze(rawMatrix(3,:,:,:));
digit_3 = squeeze(rawMatrix(4,:,:,:));
digit_4 = squeeze(rawMatrix(5,:,:,:));
digit_5 = squeeze(rawMatrix(6,:,:,:));
digit_6 = squeeze(rawMatrix(7,:,:,:));
digit_7 = squeeze(rawMatrix(8,:,:,:));
digit_8 = squeeze(rawMatrix(9,:,:,:));
digit_9 = squeeze(rawMatrix(10,:,:,:));
toc
%% Example of how to show a specific image. Important note, if you dont squeeze
% it will not show it properly.
show(squeeze(digit_6(2,:,:)))
% show(gather(squeeze(digit_6(2,:,:))))

testObject = squeeze(rawMatrix(1:10, 2, :,:));
test_digit = squeeze(testObject(7,:,:));