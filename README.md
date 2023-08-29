# BayesMEModel

## Overview

The `BayesMEModel` R package presents a comprehensive suite of functions tailored to fitting Bayesian regression models and performing statistical analyses. Seamlessly integrated with Stan models, the package encompasses Linear Regression, Logistic Regression, as well as their corresponding measurement error correction models. Additionally, the package includes utilities designed to assist in the estimation of specific parameters, thereby enhancing the accuracy of estimates.

## Installation

You can install the package using the `devtools` library:

```{r}
devtools::install_github("path/BayesMEModel")
```
Package can be loaded into R as follows:

```{r}
library('BayesMEModel')
```

## Functions

* `fit_linear_regression` and `fit_logistic_regression`

  - Required Inputs:
    + **model**: Compiled Stan model for Linear Regression or Logistic Regression.
    + **N**: Number of observations.
    + **x**: Independent variable.
    + **y**: Dependent variable.
  
  - Purpose: This function fits the provided Stan model for either Linear Regression or Logistic Regression and returns the summary of the fit.

---

* `fit_linear_regression_ME` and `fit_logistic_regression_ME`

  + Required Inputs:
    - **model**: Compiled Stan model for the corresponding regression type.
    - **N**: Number of observations.
    - **x_meas**: Measured independent variable (typically subject to measurement noise).
    - **y**: Dependent variable.
    - **a**: Coefficient parameter between true data and observed data *x_meas* subjected to measurement noise.
    - **tau**: parameter that depicts the measurement noise between true and observed data *x_meas*.
  
  + Purpose:
    Both functions fit the provided Bayesian measurement error correction model for linear regression or logistic regression and return a summary of the fit. The functions are particularly useful when dealing with scenarios where the independent variables are subject to measurement noise, allowing for more accurate parameter estimates and inference.

---

* `fit_tau`
  - Required Inputs:
    + **model**: Compiled Stan model for Tau.
    + **N**: Number of observations.
    + **Y**: Dependent variable.
    + **Yp**: Measured dependent variable.
    + **a**: Coefficient parameter.
  - Purpose: This function fits the provided Tau Stan model and returns the summary of the fit.

---

* `load_stan_models`
  - Required Inputs: None.
  - Purpose: This function loads the Stan models for various regression types, the measurement error correction models, and the measurement noise estimation model to find parameter *tau*, and provide a list of compiled Stan models.


## Usage

To use the package, first load the Stan models using the load_stan_models() function:

```{r}
library(BayesMEModel)
model_list <- load_stan_models()
```
Once the models are loaded, you can utilize the package's functions to fit and summarize Bayesian regression models for a range of scenarios. For additional usage examples, refer to the included `inst/rmd/simulation_linear_logistic.Rmd` file.


