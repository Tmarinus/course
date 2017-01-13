tic
    prDataNist = prnist(0:9,1:1000);
toc

tic
    rawMatrix = equalizeSize(prDataNist);
toc
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

%% Example of how to show a specific image. Important note, if you dont squeeze
% it will not show it properly.
show(squeeze(digit_6(2,:,:)))