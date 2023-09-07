data {
  int<lower=0> N;
  int<lower=1> D; // Number of input variables
  matrix[N, D] x; // Input matrix X of dimension N rows by D columns
  vector[N] y;
}

parameters {
  real alpha;
  vector[D] beta;
  real<lower=0> sigma;
}

model {
  y ~ normal(alpha + x * beta , sigma);
  alpha ~ normal(0, 10);
  beta ~ normal(0, 10);
  sigma ~ cauchy(0, 5);
}

