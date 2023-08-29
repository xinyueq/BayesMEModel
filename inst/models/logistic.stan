//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> N;       // number of cases
  vector[N] x;          // predictor (covariate)
  int<lower=0,upper=1> y[N];
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real alpha;           // intercept
  real beta;            // slope
   //real<lower=0> sigma;  // outcome noise
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  y ~ bernoulli_logit(alpha + beta * x);
  alpha ~ normal(0, 10);
  beta ~ normal(0, 10);
}

