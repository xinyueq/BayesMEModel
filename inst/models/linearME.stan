data {
  int<lower=0> N;
  int<lower=0> D;
  vector[N] y;

  vector[N] x_meas;
  matrix[N, D] x_in;
  real a;
  real<lower=0> tau;
}

parameters {
  vector[N] x;
  real alpha;
  real beta_meas;
  vector[D] beta;
  real<lower=0> sigma;
}

model {
  x ~ normal(0, 1);
  x_meas ~ normal(a * x, tau);

  if (D > 0) {
    y ~ normal(alpha + x * beta_meas + x_in * beta, sigma);
  } else {
    y ~ normal(alpha + x * beta_meas, sigma);
  }

  alpha ~ normal(0, 10);
  beta_meas ~ normal(0, 10);
  beta ~ normal(0, 10);
  sigma ~ cauchy(0, 5);
}

