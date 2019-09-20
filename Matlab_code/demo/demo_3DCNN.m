clear;

addpath('../Training' , '../mdCNN' , '../utilCode' );
load('sensorimotor_3D_sample.mat');
net = CreateNet('3DCNN_config_sensorimotor.conf'); 

% start training
% net =  Train(FMRI,net); % train all 
tic
net =  Train(SEN,net,40000); % set number of volumes to use for training is 1000
toc
% testing
checkNetwork(net,Inf,SEN,1);

% save the network
save('net_sensorimotor_3D.mat','net');




