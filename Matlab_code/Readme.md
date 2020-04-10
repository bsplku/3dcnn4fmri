## MATLAB codes:
### Download:
* Please download the sample data in this link: http://bspl.korea.ac.kr/Research_data/sensorimotor/sensorimotor_3D_sample.mat
* Please download the a trained model (for the visualization) in this link: http://bspl.korea.ac.kr/Research_data/sensorimotor/net_sensorimotor_3D.mat

### Data structure: 
* The input ‘.mat’ file is a ‘struct’ named ‘SEN’ with 4 elements:
- ‘I’: ‘cell’ type data for training, each cell is a 3D fMRI volume
- ‘labels’: labels for training data. ‘I’ and ‘labels’ should have same length
- ‘I_test’: ‘cell’ type data for testing, each cell is a 3D fMRI volume
- ‘labels_test’: labels for testing data. ‘I_test’ and ‘labels-test’ should have same length
* The sample data is prepared for leave-one-subject-out classification; hence, ‘I_test’ has 120 3D fMRI volumes from subject #1, and ‘I_train’ has 1320 3D fMRI volumes from 11 remaining subjects. The volumes and labels were randomized across all the 11 subjects.

### Running code:
* Configure a network: a config file named ‘3DCNN_config_sensorimotor.conf’ describes the network structure, training parameters and other possible configurations for 3D-CNN model
* Train a network: run the file ‘demo_3DCNN.m’ to train the network using our sample data

### Visualization of a trained 3D-CNN:
* Run the file 'CAM_sensorimotor.m' for CAM
