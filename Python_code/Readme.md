## Python codes with TensorFlow library:
### Data structure: 
Please download the sample data in this link: http://bspl.korea.ac.kr/Research_data/sensorimotor/sensorimotor_4D_sample.mat
* The input ‘.mat’ file includes:
- ‘X_train’, ‘X_test’ are training and testing set of data as 3D volume series (i.e., 4D arrays)
- ‘y_train’, ‘y_test’ are the labels for the training and testing (i.e., 1D arrays)

### Running code: 
* Run the ‘3dcnn_fmri_demo.ipynb’ to train a 3D-CNN model using our sample data
* Changes such as adding/removing convolution and/or pooling layers can be easily done by tweaking the 3D-CNN network structure defined in this ipython notebook code.

### Visualization:
* Python code with TensorFlow library for class saliency map
- Run the file 'saliency_map_basic.ipynb'
* Python code for ERF
- Run the file 'receptive_field.ipynb'
