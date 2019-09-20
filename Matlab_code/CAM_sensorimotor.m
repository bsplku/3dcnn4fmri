% % CAM sensorimotor data
% clear;

% load a trained network
load net_sensorimotor_3D.mat
load inbrain_mask.mat

% visualize input
v_in = SEN.I_test{1};
figure; imagall(v_in,1:46,[7 7]);

% feed the input volume to the trained network
out = feedForward(net.layers,v_in,0);
score = out{5}.activation;
[value_class, idx_class] = sort(score,'descend');
weight_out = net.layers{5}.fcweight(2:end,:);
weight_score = weight_out(:,idx_class(1));
fc_input = out{4}.activation;
lastconv_input = out{3}.activation;

CAM = lastconv_input * abs((fc_input*weight_score));
avg_CAM = mean(CAM,4);

% map CAM back to input dimension
[y x z]=...
   ndgrid(linspace(1,size(CAM,1),53),...
          linspace(1,size(CAM,2),63),...
          linspace(1,size(CAM,3),46));
CAMtoInput = interp3(avg_CAM,x,y,z);
CAM1d = CAMtoInput(:); CAMinbrain = CAM1d(vmsk);
CAMtoInput_inbrain = zeros(53,63,46);
CAMtoInput_inbrain(vmsk) = CAMinbrain;

% threshold CAM with top 1 percentile
% msk = CAMtoInput_inbrain > prctile(CAMtoInput_inbrain(:), 99); 
% CAMtoInput_1d = CAMtoInput_inbrain(:); CAMthr = CAMtoInput_1d(msk);
% CAMthr3d = zeros(53,63,46);
% CAMthr3d(msk) = CAMthr; 
% CAMthr3d(:,:,1:10) = 0;

% visualize CAM
c = imagall(CAMtoInput_inbrain,1:46,[7 7]); 
cc = map2jpg(c, [], 'jet');
figure(); image(cc);
