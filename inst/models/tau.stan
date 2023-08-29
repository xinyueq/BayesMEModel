data {
  int<lower=0> N;  // Number of observations
  real a;
  real Y[N];       // Observed array Y
  real Yp[N];      // Observed array Yp
}

parameters {
  real<lower=0> tau;  // Measurement noise parameter
}

model {
  // Prior distribution for tau
  //tau ~ cauchy(0,5);  // (0,25) You can adjust the scale parameter as needed
  //tau ~ gamma(10,2);
  tau ~ inv_gamma(0.1, 0.1); //(.1, 0.1) (.01, .01)
  //tau ~ inversegamma
  
  // Likelihood
  for (n in 1:N) {
    Yp[n] ~ normal(a * Y[n], tau);
  }
}

