## Python codes with TensorFlow library:
### Sample data download:
* Please download the sample data from this link: http://bspl.korea.ac.kr/Research_data/sensorimotor/sensorimotor_4D_sample.mat

### Data description:
* The sample 3D fMRI volume series data were acquired during the four sensorimotor tasks including left-hand clenching (LH), right-hand clenching (RH), auditory attention (AD), and visual stimulus (VS) tasks [1].
* Our sensorimotor dataset includes the data from 12 subjects, each subject performed each of the four tasks (three blocks per task; 20s per block). Thus, there were 30 3D fMRI volumes for each task per subject, 120 3D fMRI volumes across all four tasks per subject, and a total of 1440 3D fMRI volumes across all subjects.

### Data structure: 
The input ‘.mat’ file includes:
- ‘X_train’, ‘X_test’ are training and testing set of data as 3D volume series (i.e., 4D arrays)
- ‘y_train’, ‘y_test’ are the labels for the training and testing (i.e., 1D arrays)
- 'X_train' contains 1320 3D fMRI volumes from 11 subjects
- 'X_test' contains 120 3D fMRI volumes from one remaining subject

### Running code: 
* Run the ‘3dcnn_fmri_demo.ipynb’ to train a 3D-CNN model using our sample data
* Changes such as adding/removing convolution and/or pooling layers can be easily done by tweaking the 3D-CNN network structure defined in this ipython notebook code.
* Folder 'model' contains the trained 3D-CNN model, that can be used for the visualization.

### Visualization of a trained 3D-CNN:
* Run the file 'saliency_map_basic.ipynb' for class saliency map visualization [2]
* Run the file 'receptive_field.ipynb' for effective receptive field visualization [3]

### References
[1] Jang, H., Plis, S.M., Calhoun, V.D. and Lee, J.H., 2017. Task-specific feature extraction and classification of fMRI volumes using a deep neural network initialized with a deep belief network: Evaluation using sensorimotor tasks. Neuroimage, 145, pp.314-328.
[2] Simonyan, K., Vedaldi, A., Zisserman, A., 2013. Deep inside convolutional networks: Visualising image classification models and saliency maps. arXiv preprint arXiv:1312.6034.
[4] Luo, W., Li, Y., Urtasun, R., Zemel, R., 2016. Understanding the effective receptive field in deep convolutional neural networks, in: Advances in Neural Information Processing Systems. pp. 4898–4906.
