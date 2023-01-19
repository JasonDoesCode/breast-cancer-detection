# Breast Cancer Detection

We utlized Logistic Regression to determine if a tumor was malignant or benign based on 9 related parameters. The following sections serve to provide a quick overview of the steps taken during this project. The complete lists of steps and results can be found in the Final Report.pdf file. Additionally, an even shorter overview can be found in the Presentation.pdf file, which also contains helpful visualizations that showcase our findings.

### Data Gathering

Our data was gathered from a paper named ‘Multisurface method of pattern separation for medical diagnosis applied to breast cytology.’ In this paper, the authors were also attempting to create a mathematical model to detect Breast Cancer, however, they did not experiment with non-linearity or with the classification models we utilized - thus the novelty of our project. The researchers model resulted in 99.7% accuracy. We sought to replicate their results with our own models to better understand these classification techniques. For reference, the full paper is included as a pdf within this repo.

### Model Construction

Given that our outcome variable - Class, is binary the team decided we would like to experiment with Logisitc Regression, Linear Discriminant Analysis (LDA) and Bayes Classifier. After some preliminary testing, the team settled on Logistic Regression for our model as it produced the highest accuracy. We continued to tweak this model in our future sections.

### Model Validation

For model validation we employed a variety of techniques - Validation Set, Leave-One-Out Cross Validation, and k-cross fold validation. These validation techniques were used to accesses the accuracy of our model as we increased the polynomial degree. Regardless of how validation was performed, all techniques unanimously suggested that the model with the highest accuracy was a linear one. We assume strong linear relationships between parameters.

### Variable Selection

Following this we narrowed our variables by utilizing Forward Selection, Backward Selection, Ridge Regression, and Lasso techniques to determine which had the greatest impact. The best model was produced from Forward Selection and required 4 variables - Clump Thickness, Uniformity of Cell Size, Bare Nuclei, and Normal Nucleoli. This model resulted in an accuracy of 98.04%.

### Accommodating Non-Linearity

Finally, we relaxed our assumption of linearity by experimenting with Spline techniques. Given our previous benchmark of 98.04% using a linear model, we understood that it would be best to test incrementally. After testing, we eventually improved our model by giving Normal Nucleoli a spline with 5 degrees of freedom leading to an accuracy of 98.5%. However, we would still recommend using the linear model without splines as it is less prone to overfitting and less complex with only a sacrifice of 0.5% in accuracy.
