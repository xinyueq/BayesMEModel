#' Load and compile Stan models
#'
#' This function loads and compiles the Stan models.
#'
#' @return A list of compiled Stan models.
#'
#' @export
load_stan_models <- function() {

  library(rstan)

  LinReg <- stan_model(system.file("models", "linear.stan", package = "BayesMEModel"))
  LinRegME <- stan_model(system.file("models", "linearME.stan", package = "BayesMEModel"))
  LogisticReg <- stan_model(system.file("models", "logistic.stan", package = "BayesMEModel"))
  LogisticRegME <- stan_model(system.file("models", "logisticME.stan", package = "BayesMEModel"))
  tau <- stan_model(system.file("models", "tau.stan", package = "BayesMEModel"))

  model_list <- list(
    LinReg = LinReg,
    LinRegME = LinRegME,
    LogisticReg = LogisticReg,
    LogisticRegME = LogisticRegME,
    tau = tau
  )
}

#' Fit and summarize the Linear Regression Stan model
#'
#' This function fits the provided Linear Regression Stan model and returns the summary.
#'
#' @param model Compiled Stan model for Linear Regression.
#' @param N Number of observations.
#' @param D Number of covariates.
#' @param x Independent variable.
#' @param y Dependent variable.
#'
#' @return Summary of the fit.
#'
#' @export
fit_linear_regression <- function(model, N, D, x, y) {
  data_list <- list(N = N, D = D, x = x, y = y)
  fit <- sampling(model, data = data_list)
  return(fit)
}

#' Fit and summarize the Logistic Regression Stan model
#'
#' This function fits the Logistic Regression Stan model and returns the summary.
#'
#' @param N Number of observations.
#' @param D Number of covariates.
#' @param x Independent variable.
#' @param y Dependent variable.
#'
#' @return Summary of the fit.
#'
#' @export
fit_logistic_regression <- function(model, N, D, x, y) {
  data_list <- list(N = N, D = D, x = x, y = y)
  fit <- sampling(model, data = data_list)
  return(fit)
}

#' Fit and summarize the Linear Regression with Measurement Error Stan model
#'
#' This function fits the Linear Regression with Measurement Error Stan model and returns the summary.
#'
#' @param N Number of observations.
#' @param D Number of covariates, excluding the column with measurement noise
#' @param x_meas Input vector with measurement noise.
#' @param x_in Input matrix x_in for the additional D covariates, with dimensions N rows by D columns
#' @param y Dependent variable.
#' @param a Coefficient parameter.
#' @param tau Tau parameter.
#'
#' @return Summary of the fit.
#'
#' @export
fit_linear_regression_ME <- function(model, N, D, y, x_meas, x_in, a, tau) {
  data_list <- list(N = N, D = D, y = y, x_meas = x_meas, x_in = x_in, a = a, tau = tau)
  fit <- sampling(model, data = data_list)
  return(fit)
}

#' Fit and summarize the Logistic Regression with Measurement Error Stan model
#'
#' This function fits the Logistic Regression with Measurement Error Stan model and returns the summary.
#'
#' @param N Number of observations.
#' @param D Number of covariates, excluding the column with measurement noise
#' @param x_meas Input vector with measurement noise.
#' @param x_in Input matrix x_in for the additional D covariates, with dimensions N rows by D columns
#' @param y Dependent variable.
#' @param a Coefficient parameter.
#' @param tau Tau parameter.
#'
#' @return Summary of the fit.
#'
#' @export
fit_logistic_regression_ME <- function(model, N, D, y, x_meas, x_in, a, tau) {
  data_list <- list(N = N, D = D, y = y, x_meas = x_meas, x_in = x_in, a = a, tau = tau)
  fit <- sampling(model, data = data_list)
  return(fit)
}

#' Fit and summarize the Tau Stan model
#'
#' This function fits the provided Tau Stan model and returns the summary.
#'
#' @param model Compiled Stan model for Tau.
#' @param N Number of observations.
#' @param Y Dependent variable.
#' @param Yp Measured dependent variable.
#' @param a Coefficient parameter.
#'
#' @return Summary of the fit.
#'
#' @export
fit_tau <- function(model, N, Y, Yp, a) {
  tau_data <- list(N = N, Y = Y, Yp = Yp, a = a)
  fit <- sampling(model, data = tau_data)
  return(fit)
}

