# RLang

## Classification algorithms

### 1. [k-nearest neighbors algorithm](https://github.com/Dembele/RLang/tree/master/knn)
The most easy algorithm that classifies objects depending on neighbors and gives class that prevail among others. k-NN is a type of instance-based learning, or lazy learning, where the function is only approximated locally and all computation is deferred until classification. The k-NN algorithm is among the simplest of all machine learning algorithms.

![alt text](https://github.com/Dembele/RLang/blob/master/knn/knn.png?raw=true "4-NN")

Classification map for k=4

### 2.  [Parzen window](https://github.com/Dembele/RLang/tree/master/pw)
The Parzen-window method (also known as Parzen-Rosenblatt window method) is a widely used non-parametric approach to estimate a density. After choosing a metric you can use PW without probabilities. The idea of the method is that density is higher at the points where are a lot of data points.

![alt text](https://github.com/Dembele/RLang/blob/master/pw/PW.png?raw=true "class map")
![alt text](https://github.com/Dembele/RLang/blob/master/pw/loo.pw.png?raw=true "LOO error to Width ratio")

### 3. [Potential function method](https://github.com/Dembele/RLang/tree/master/pf)
Based on the basic property that the solution weight vector of the linear pattern classifier can be expressed as a linear function of the training patterns, it is shown that the increment error correction algorithm is a special case of the potential function method. For linearly separable training patterns, a form of potential function which appears to be useful is also proposed.

![alt text](https://github.com/Dembele/RLang/blob/master/pf/PF.png?raw=true "potentials")

### 4. [STOLP](https://github.com/Dembele/RLang/tree/master/stolp)
STOLP is an algorithm from similarity-based classifier family. The idea behind all similarity-based classifiers is very simple: all similar objects lie close to each other. Most popular algorithm from this family is KNN. In this article we well develop a simple implementation of these two algorithms.

### MISC1. LOO/CV (leave-one-out cross validation)
Leave one out cross validation works as follows:  the parameter optimisation is performed (automatically) on some of the given data pairs and then the performance of the tuned algorithm is tested on the data that has not been trained on.  So, in this step, the data is the test set and the other data pairs are the training data for optimising the free parameters of your algorithm.  Now, repeat the process given times, each time leaving out a different pair to use as the single test case.  You now get test performance for all data pairs.  That is the way that leave-one-out cross validation works.

![alt text](https://github.com/Dembele/RLang/blob/master/knn/loo.knn.png?raw=true "loo for knn")

### MISC2. Margin
Margin is an property that shows how deep the element is within its own class. The distance is calculated reletevle to all elements. 
If margin value is big negative number - classifier error on this element

![alt text](https://github.com/Dembele/RLang/blob/master/marg/margin.png?raw=true "margin for irises")

### 1. [naive Bayes](https://github.com/Dembele/RLang/tree/master/naiveBayes)
naive Bayes classifiers are a family of simple probabilistic classifiers based on applying Bayes' theorem with strong (naive) independence assumptions between the features. Naive Bayes is much faster than most of other algorithms because it doesnt iterate over parametres but calculate them once (linear time).
here is a map of classification:

![alt text](https://github.com/Dembele/RLang/blob/master/naiveBayes/naive.png?raw=true "Bayes class map")

### 2. [Expectation maximization (EM)](https://github.com/Dembele/RLang/tree/master/EM)
Expectation Maximisation algorithm is an iterative method to find maximum likelihood or maximum a posteriori (MAP) estimates of parameters in statistical models, where the model depends on unobserved latent variables. The EM iteration alternates between performing an expectation (E) step, which creates a function for the expectation of the log-likelihood evaluated using the current estimate for the parameters, and a maximization (M) step, which computes parameters maximizing the expected log-likelihood found on the E step. These parameter-estimates are then used to determine the distribution of the latent variables in the next E step.

![alt text](https://github.com/Dembele/RLang/blob/master/EM/init.png?raw=true "EM unclass")
![alt text](https://github.com/Dembele/RLang/blob/master/EM/done.png?raw=true "EM class")

### 1. [ADAptive LINear Element (ADALINE) or Adaptive Linear Neuron](https://github.com/Dembele/RLang/tree/master/ADALINE)
Adaline is a single layer neural network with multiple nodes where each node accepts multiple inputs and generates one output.
![alt text](https://github.com/Dembele/RLang/blob/master/ADALINE/Adaline.png?raw=true "ADALINE")

### 2. [Support vector machine (SVM)](https://github.com/Dembele/RLang/tree/master/SVM)
“Support Vector Machine” (SVM) is a supervised machine learning algorithm which can be used for both classification or regression challenges. However,  it is mostly used in classification problems. In this algorithm, we plot each data item as a point in n-dimensional space (where n is number of features you have) with the value of each feature being the value of a particular coordinate. Then, we perform classification by finding the hyper-plane that differentiate the two classes very well (look at the below snapshot).

![alt text](https://github.com/Dembele/RLang/blob/master/SVM/linear.png?raw=true "SVM no diff")
![alt text](https://github.com/Dembele/RLang/blob/master/SVM/linear_OK.png?raw=true "SVM with diff")

And some iris classy:

![alt text](https://github.com/Dembele/RLang/blob/master/SVM/iris.png?raw=true "SVM iris no diff")
![alt text](https://github.com/Dembele/RLang/blob/master/SVM/iris_OK.png?raw=true "SVM iris with diff")
