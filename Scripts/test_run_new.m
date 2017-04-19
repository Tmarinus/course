% amount of training digits per class
training_size = 10;
% image size
d_size = 50;

prwaitbar off;

e=nist_eval('svc',training_size,d_size);
disp(fprintf( 'accuracy: %d\n', e));