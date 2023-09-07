data {
  int<lower=0> N;
  int<lower=0> D; # Number of covariates, excluding the column with measurement noise
  int<lower=0,upper=1> y[N];
  vector[N] x_meas; # Input vector with measurement noise
  matrix[N, D] x_in; # Input matrix x_in for the additional D covariates, with dimensions N rows by D columns
  real a;
  real<lower=0> tau;
}

parameters {
  vector[N] x;
  real alpha;
  real beta_meas;
  vector[D] beta;
}

model {
  x ~ normal(0, 1);
  x_meas ~ normal(a * x, tau);

  if (D > 0) {
    y ~ bernoulli_logit(alpha + x * beta_meas + x_in * beta);
  } else {
    y ~ bernoulli_logit(alpha + x * beta_meas);
  }

  alpha ~ normal(0, 10);
  beta_meas ~ normal(0, 10);
  beta ~ normal(0, 10);
}
