data {
  int<lower=0> N;
  int<lower=1> D; // Number of input variables
  matrix[N, D] x; // Input matrix X of dimension N rows by D columns
  int<lower=0, upper=1> y[N];
}

parameters {
  real alpha;
  vector[D] beta;
}

model {
  y ~ bernoulli_logit(alpha + x * beta);
  alpha ~ normal(0, 10);
  beta ~ normal(0, 10);
}
