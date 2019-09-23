# Variations-of-Back-Propagation
implement the Back propagation learning for a 2 layer perceptron. Moreover, we will discuss and experiment the aspects for influencing the training, including alpha, hidden units, and stopping condition; and test the Nguyen-Widrow initialization, back propagation with Momentum.
Develop Tools: MATLAB R2018a.

### Program running help: 
1.	In the MATLAB under the files’ directory, type “help [file Name]” to get running help.
```
help [file Name]
```
2.	For restoring the training more easily, please load "mablab_7.20.mat" first to get all the initial values.

### Case example:
Best case by experiment with different parameters( running help: tranepoch.m)

i.	Running the program, with initial values:
  1.	alpha = 0.02
  2.	Stopping criterion: Training epochs = 800 or alpha < 0.0045
  3.	Hidden layer units = 20
  4.	Initial weights/bias could be checked in the code(file "mablab_7.20.mat"- WW1,WW2,bb1,bb2)
  
ii.	Results:
  1.	Actually trained epochs = 733
  2.	Hit ratio = 387/447
iii. Learning curve: mean squared error = 0.0045 （below diagram: the error changed by epochs）
<img src="https://github.com/ayumiryu/Variations-of-Back-Propagation/blob/master/error.png"/>


### License:
personal project, only for communication and study.
