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
[imgArrayGrey, labelArray] = preprocess(prDataNist, 50);