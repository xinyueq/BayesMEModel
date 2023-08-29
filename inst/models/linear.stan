// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> N;       // number of cases
  vector[N] x;
  //vector[N] x_1;          // predictor (covariate)
  //vector[N] x_2;
  vector[N] y;          // outcome (variate)
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  real alpha;           // intercept
  real beta; 
  //real beta_1;            // slope
  //real beta_2;            // slope
  real<lower=0> sigma;  // outcome noise
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  //y ~ normal(alpha + beta_1 * x_1 +  beta_2 * x_2 , sigma);
  y ~ normal(alpha + beta * x, sigma);
  alpha ~ normal(0, 10);
  beta ~ normal(0, 10);
  //beta_1 ~ normal(0, 10);
  //beta_2 ~ normal(0, 10);
  sigma ~ cauchy(0, 5);
}

