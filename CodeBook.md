
Experiments collect sensor signal data from six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
while earing a smartphone (Samsung Galaxy S II) on the waist. 

Using the phone's embedded accelerometer and gyroscope, 
3-axial linear acceleration and 3-axial angular velocity 
at a constant rate of 50Hz was collected. 

The dataset was randomly partitioned into two sets, 
where 70% of the volunteers selected for generating the 
training data and 30% the test data. 

For each record:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Variable definitions:
=========================================

x_train <- data from the training set
y_train <- training data labels
sub_train <- subject who carried out the experiment

x_test <- data from the test set
y_test <- test data labels
sub_test <- subject who carried out the test experiment

features <- shows information about the variable used on the feature vector

activities links the class labels with their activity name

