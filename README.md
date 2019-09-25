# 3D convolutional neural network (CNN) for 3D fMRI volume classification
* These are the MATLAB codes and Python codes for our 3D-CNN model which was used for 3D fMRI volume classification. The saliency maps visualization codes were also included.

## Sample of data: 
* The sample 3D fMRI volume series data were acquired during the four sensorimotor tasks including left-hand clenching, right-hand clenching, auditory attention, and visual stimulus tasks [1].
* Our sensorimotor dataset includes the data from 12 subjects, each subject performed 30 3D fMRI volumes for each of the four tasks; therefore, a totally of 1440 3D fMRI volumes across all subjects.

## MATLAB codes:
* The code is originally from https://github.com/hagaygarty/mdCNN and was modified to fit our 3D-CNN model for fMRI volume classification.

### Data structure: 
* The input ‘.mat’ file is a ‘struct’ named ‘SEN’ with 4 elements:
- ‘I’: ‘cell’ type data for training, each cell is a 3D fMRI volume
- ‘labels’: labels for training data. ‘I’ and ‘labels’ should have same length
- ‘I_test’: ‘cell’ type data for testing, each cell is a 3D fMRI volume
- ‘labels_test’: labels for testing data. ‘I_test’ and ‘labels-test’ should have same length
* This data sample is for leave-one-subject-out classification; hence, ‘I_test’ has 120 3D fMRI volumes from subject #1, and ‘I_train’ has 1320 3D fMRI volumes from 11 remaining subjects. The volumes and labels were randomized across all the 11 subjects.
* Please download the sample data in this link: http://bspl.korea.ac.kr/Research_data/sensorimotor/sensorimotor_3D_sample.mat

### Run code:
* Configure a network: a config file named ‘3DCNN_config_sensorimotor.conf’ describes the network structure, training parameters and other possible configurations for 3D-CNN model
* Train a network: run the file ‘demo_3DCNN.m’ to train the network with our sample data

## Python codes with Tensorflow library:
### Data structure: 
* The input ‘.mat’ file includes:
- ‘X_train’, ‘X_test’ are training and testing set of data in 4D
- ‘y_train’, ‘y_test’ are the labels for the training and testing
* Please download the sample data in this link: http://bspl.korea.ac.kr/Research_data/sensorimotor/sensorimotor_4D_sample.mat

### Run code: 
* Run the ‘3dcnn_fmri_demo.ipynb’ to train our sample data
* The python code can be easier to add or remove pooling layers in the 3D-CNN network structure.

## Saliency maps visualization:
* Two approaches including the visualization of class saliency map (Simonyan et al., 2013)[2] and the class activation maps (CAM) (Zhou et al., 2016)[3] was applied to our 3D-CNN model.
### Matlab code for CAM (Zhou et al., 2016)[3]:
* Run the file 'CAM_sensorimotor.m'
### Python code with Tensorflow library for class saliency map (Simonyan et al., 2013)[2]
* Run the file 'saliency_map_basic.ipynb'

### References
* [1] Jang, H., Plis, S.M., Calhoun, V.D. and Lee, J.H., 2017. Task-specific feature extraction and classification of fMRI volumes using a deep neural network initialized with a deep belief network: Evaluation using sensorimotor tasks. Neuroimage, 145, pp.314-328.
* [2] Simonyan, K., Vedaldi, A., Zisserman, A., 2013. Deep inside convolutional networks: Visualising image classification models and saliency maps. arXiv preprint arXiv:1312.6034.
* [3] Zhou, B., Khosla, A., Lapedriza, A., Oliva, A., Torralba, A., 2016. Learning deep features for discriminative localization. Proceedings of the IEEE conference on computer vision and pattern recognition, pp. 2921-2929.

