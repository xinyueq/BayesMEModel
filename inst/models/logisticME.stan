// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> N;       // number of cases
  vector[N] x_meas;          // predictor (covariate)
  int<lower=0,upper=1> y[N];
  real<lower=0> tau;     // measurement noise
  real a;
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real alpha;           // intercept
  real beta;            // slope
  vector[N] x;
  // real a;
  // real<lower=0> sigma;  // outcome noise
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  x ~ normal(0, 1);  // prior
  x_meas ~ normal(a * x, tau); 
  y ~ bernoulli_logit(alpha + beta * x);
  alpha ~ normal(0, 10);
  beta ~ normal(0, 5);
}

