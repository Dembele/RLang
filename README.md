# RLang

## Метрические алгоритмы

### 1. [k-nearest neighbors algorithm](https://github.com/Dembele/RLang/tree/master/knn)
The most easy algorithm that classifies objects depending on neighbors and gives class that prevail among others. k-NN is a type of instance-based learning, or lazy learning, where the function is only approximated locally and all computation is deferred until classification. The k-NN algorithm is among the simplest of all machine learning algorithms.

![alt text](https://github.com/Dembele/RLang/blob/master/knn/knn.png?raw=true "4-NN")

Classification map for k=4

### 2.  [Parzen window](https://github.com/Dembele/RLang/tree/master/pw)
The Parzen-window method (also known as Parzen-Rosenblatt window method) is a widely used non-parametric approach to estimate a density. After choosing a metric you can use PW without probabilities. The idea of the method is that density is higher at the points where are a lot of data points.

![alt text](https://github.com/Dembele/RLang/blob/master/pw/PW.png?raw=true "class map")
![alt text](https://github.com/Dembele/RLang/blob/master/pw/loo.pw.png?raw=true "LOO error to Width ratio")

### 3. [Метод потенциальных функций](https://github.com/Dembele/RLang/tree/master/pf)
метрический классификатор, частный случай метода ближайших соседей. Позволяет с помощью простого алгоритма оценивать вес («важность») объектов обучающей выборки при решении задачи классификации.
Общая идея метода иллюстрируется на примере электростатического взаимодействия элементарных частиц. Известно, что потенциал («мера воздействия») электрического поля элементарной заряженной частицы в некоторой точке пространства пропорционален отношению заряда частицы к расстоянию до частицы
Метод потенциальных функций реализует полную аналогию указанного выше примера. При классификации объект проверяется на близость к объектам из обучающей выборки. Считается, что объекты из обучающей выборки «заряжены» своим классом, а мера «важности» каждого из них при классификации зависит от его «заряда» и расстояния до классифицируемого объекта.

![alt text](https://github.com/Dembele/RLang/blob/master/pf/PF.png?raw=true "потенциалы")

Rem: все алгоритмы классификации, за исключением пф показали себя примерно одинаково. А пф умудрился свести все к 1 ошибке. Грешу на выборку.

### 4. [Алгоритм СТОЛП](https://github.com/Dembele/RLang/tree/master/stolp)
алгоритм отбора эталонных объектов для метрического классификатора.
Эталоны — это такое подмножество выборки X^l, что все объекты X^l (или их большая часть) классифицируются правильно при использовании в качестве обучающей выборки множества эталонов.
Эталонами i-го класса при классификации методом ближайшего соседа может служить такое подмножество объектов этого класса, что расстояние от любого принадлежащего ему объекта из выборки X^l до ближайшего «своего» эталона меньше, чем до ближайшего «чужого» эталона.
Простой перебор для отбора эталонов не эффективен. Алгоритм STOLP позволяет сократить этот перебор

### MISC1. Скользящий контроль/кросс-проверка/кросс-валидация (cross-validation, CV)
Скользящий контроль или кросс-проверка или кросс-валидация (cross-validation, CV) — процедура эмпирического оценивания обобщающей способности алгоритмов, обучаемых по прецедентам.
Фиксируется некоторое множество разбиений исходной выборки на две подвыборки: обучающую и контрольную. Для каждого разбиения выполняется настройка алгоритма по обучающей подвыборке, затем оценивается его средняя ошибка на объектах контрольной подвыборки. Оценкой скользящего контроля называется средняя по всем разбиениям величина ошибки на контрольных подвыборках.
Если выборка независима, то средняя ошибка скользящего контроля даёт несмещённую оценку вероятности ошибки. Это выгодно отличает её от средней ошибки на обучающей выборке, которая может оказаться смещённой (оптимистически заниженной) оценкой вероятности ошибки, что связано с явлением переобучения.
Скользящий контроль является стандартной методикой тестирования и сравнения алгоритмов классификации, регрессии и прогнозирования.

![alt text](https://github.com/Dembele/RLang/blob/master/knn/loo.knn.png?raw=true "loo для knn")

### MISC2. Отступ (для классификатора)
Отступ (для классификатора) — эвристика, оценивающая то, насколько объект "погружён" в свой класс, насколько эталонным представителем он является. Чем меньше значение отступа, тем ближе объект находится к границе класса, соответственно тем выше вероятность ошибочного прогноза.

Отступ отрицателен - классификатор допускает на этом объекте ошибку.

![alt text](https://github.com/Dembele/RLang/blob/master/marg/margin.png?raw=true "loo для knn")

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
