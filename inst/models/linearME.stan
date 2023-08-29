// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> N;       // number of cases
  vector[N] y;          // outcome (variate)
  vector[N] x_meas;      // measurement of x
  //vector[N] x_2;
  // array[N] real x_meas;
  real a;
  real<lower=0> tau;     // measurement noise
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.

parameters {
  //array[N] real x;   unknown true value
  vector[N] x;
  //real mu_x;          // prior location
  //real sigma_x; 
  //real a;
  real alpha;           
  real beta;
  //real beta_2;
  real<lower=0> sigma;  // outcome noise
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  x ~ normal(0, 1);  // prior
  //x_meas ~ normal(a * x, tau);    // measurement model
  x_meas ~ normal(a * x, tau);
  //y ~ normal(alpha + beta * x + beta_2 * x_2, sigma);
  y ~ normal(alpha + beta * x, sigma);
  //a ~ normal(0,10);
  alpha ~ normal(0, 10);
  beta ~ normal(0, 10);
  //beta_2 ~ normal(0, 10);
  sigma ~ cauchy(0, 5);
}
