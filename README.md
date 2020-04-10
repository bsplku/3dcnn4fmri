# 3D convolutional neural network (CNN) for 3D fMRI volume classification
* These are the MATLAB codes and Python codes for our 3D-CNN model which were used for 3D fMRI volume classification. The codes to visualize a trained 3D-CNN were also included.

## Sample data: 
* The sample 3D fMRI volume series data were acquired during the four sensorimotor tasks including left-hand clenching (LH), right-hand clenching (RH), auditory attention (AD), and visual stimulus (VS) tasks [1].
* Our sensorimotor dataset includes the data from 12 subjects, each subject performed each of the four tasks (three blocks per task; 20s per block). Thus, there were 30 3D fMRI volumes for each task per subject, 120 3D fMRI volumes across all four tasks per subject, and a total of 1440 3D fMRI volumes across all subjects.

## MATLAB codes:
* The code is originally from https://github.com/hagaygarty/mdCNN and was modified to fit our 3D-CNN model for fMRI volume classification.

### Data structure: 
* The input ‘.mat’ file is a ‘struct’ named ‘SEN’ with 4 elements:
- ‘I’: ‘cell’ type data for training, each cell is a 3D fMRI volume
- ‘labels’: labels for training data. ‘I’ and ‘labels’ should have same length
- ‘I_test’: ‘cell’ type data for testing, each cell is a 3D fMRI volume
- ‘labels_test’: labels for testing data. ‘I_test’ and ‘labels-test’ should have same length
* The sample data is prepared for leave-one-subject-out classification; thus, ‘I_test’ has 120 3D fMRI volumes from subject #1, and ‘I_train’ has 1320 3D fMRI volumes from 11 remaining subjects. The volumes and labels were randomized across all the 11 subjects.
* Please download the sample data from this link: http://bspl.korea.ac.kr/Research_data/sensorimotor/sensorimotor_3D_sample.mat

### Running code:
* Configure a network: a config file named ‘3DCNN_config_sensorimotor.conf’ describes the network structure, training parameters and other possible configurations for 3D-CNN model
* Train a network: run the file ‘demo_3DCNN.m’ to train the network using our sample data

## Python codes with TensorFlow library:
### Data structure: 
* The input ‘.mat’ file includes:
- ‘X_train’, ‘X_test’ are training and testing set of data as 3D volume series (i.e., 4D arrays)
- ‘y_train’, ‘y_test’ are the labels for the training and testing (i.e., 1D arrays)
* Please download the sample data from this link: http://bspl.korea.ac.kr/Research_data/sensorimotor/sensorimotor_4D_sample.mat

### Running code: 
* Run the ‘3dcnn_fmri_demo.ipynb’ to train a 3D-CNN model using our sample data
* Changes such as adding/removing convolution and/or pooling layers can be easily done by tweaking the 3D-CNN network structure defined in this ipython notebook code.

## Visualization of a trained 3D-CNN via a class saliency map, class activation map, and effective receptive field map:
* Three approaches including the visualization of class saliency map [2], class activation maps (CAM) [3], effective receptive field (ERF) map [4] were applied to visualize our trained 3D-CNN model.

### Python code with TensorFlow library for class saliency map [2]
* Run the file 'saliency_map_basic.ipynb'

### MATLAB code for CAM [3]:
* Run the file 'CAM_sensorimotor.m'

### Python code for ERF [4]:
* Run the file 'receptive_field.ipynb'

### References
* [1] Jang, H., Plis, S.M., Calhoun, V.D. and Lee, J.H., 2017. Task-specific feature extraction and classification of fMRI volumes using a deep neural network initialized with a deep belief network: Evaluation using sensorimotor tasks. Neuroimage, 145, pp.314-328.
* [2] Simonyan, K., Vedaldi, A., Zisserman, A., 2013. Deep inside convolutional networks: Visualising image classification models and saliency maps. arXiv preprint arXiv:1312.6034.
* [3] Zhou, B., Khosla, A., Lapedriza, A., Oliva, A., Torralba, A., 2016. Learning deep features for discriminative localization. Proceedings of the IEEE conference on computer vision and pattern recognition, pp. 2921-2929.
* [4] Luo, W., Li, Y., Urtasun, R., Zemel, R., 2016. Understanding the effective receptive field in deep convolutional neural networks, in: Advances in Neural Information Processing Systems. pp. 4898–4906.
