data {
  int<lower=0> N;  // Number of observations
  real a;
  real Z[N];       // Observed array Z
  real Zp[N];      // Observed array Zp
}

parameters {
  real<lower=0> tau;  // Measurement noise parameter
}

model {

  // Prior distribution for tau
  tau ~ inv_gamma(0.1, 0.1);

  // Likelihood
  for (n in 1:N) {
    Zp[n] ~ normal(a * Z[n], tau);
  }
}

