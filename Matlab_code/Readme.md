## MATLAB codes:
### Download sample data and trained model:
* Please download the sample data from this link: http://bspl.korea.ac.kr/Research_data/sensorimotor/sensorimotor_3D_sample.mat
* Please download the a trained model (for the visualization) in this link: http://bspl.korea.ac.kr/Research_data/sensorimotor/net_sensorimotor_3D.mat

### Data description:
* The sample 3D fMRI volume series data were acquired during the four sensorimotor tasks including left-hand clenching (LH), right-hand clenching (RH), auditory attention (AD), and visual stimulus (VS) tasks [1].
* Our sensorimotor dataset includes the data from 12 subjects, each subject performed each of the four tasks (three blocks per task; 20s per block). Thus, there were 30 3D fMRI volumes for each task per subject, 120 3D fMRI volumes across all four tasks per subject, and a total of 1440 3D fMRI volumes across all subjects.

### Data structure: 
* The input ‘.mat’ file is a ‘struct’ named ‘SEN’ with 4 elements:
- ‘I’: ‘cell’ type data for training, each cell is a 3D fMRI volume
- ‘labels’: labels for training data. ‘I’ and ‘labels’ should have same length
- ‘I_test’: ‘cell’ type data for testing, each cell is a 3D fMRI volume
- ‘labels_test’: labels for testing data. ‘I_test’ and ‘labels-test’ should have same length
* The sample data is prepared for leave-one-subject-out classification; hence, ‘I_test’ has 120 3D fMRI volumes from subject #1, and ‘I_train’ has 1320 3D fMRI volumes from 11 remaining subjects. The volumes and labels were randomized across all the 11 subjects.

### Running code:
Directory: demo folder
* Configure a network: a config file named ‘3DCNN_config_sensorimotor.conf’ describes the network structure, training parameters and other possible configurations for 3D-CNN model
* Train a network: run the file ‘demo_3DCNN.m’ to train the network using our sample data

Setting network configuration:
* All possible configuration settings and default values can be found in ‘mdCNN/CreateNet.m’ in ‘initNetDefaults’ function (e.g., Layer specification, Hyper params, Run params)

Training process [2]:
* The network state is saved after each iteration loop. The net is saved to a file called ‘net.mat’. This file contains the full state of the network, including the Training state, so we can halt the training process anytime and then load the network from file using load(‘net.mat’).
* It’s possible to load the network file, and then continue the training process by calling the ‘Train’ function.

Testing process: 
* 'utilCode/checkNetwork.m' is used to test the network and presented Confusion matrix.

### Visualization of a trained 3D-CNN:
* Class activation maps (CAM) [3]: Run the file 'CAM_sensorimotor.m'
* Supported file:
- File 'inbrain_mask.mat' is a vector of inbrain voxels of fully preprocessing 3D fMRI volume.
- Function 'imagall.m' plots 3D fMRI volume in 2D slices.
- Function 'map2jpg.m' changes to colormap of the heatmap (intensity map). 

### References:
[1] Jang, H., Plis, S.M., Calhoun, V.D. and Lee, J.H., 2017. Task-specific feature extraction and classification of fMRI volumes using a deep neural network initialized with a deep belief network: Evaluation using sensorimotor tasks. Neuroimage, 145, pp.314-328.
[2] https://github.com/hagaygarty/mdCNN
[3] Zhou, B., Khosla, A., Lapedriza, A., Oliva, A., Torralba, A., 2016. Learning deep features for discriminative localization. Proceedings of the IEEE conference on computer vision and pattern recognition, pp. 2921-2929.
