
# Data Generation
# for a zero-inflated beta regression model
n <- 1e3 # sample size
x <- rnorm(n) # predictor value

# coefficients for alpha
a_b0 <- -2
a_b1 <- 0.3
alpha <- gtools::inv.logit(a_b0 + a_b1 * x)

# coefficients for gamma
g_b0 <- -1.5
g_b1 <- -0.5
gamma <- gtools::inv.logit(g_b0 + g_b1 * x)

# coefficients for mu
m_b0 <- 0.6
m_b1 <- -0.5
mu <- gtools::inv.logit(m_b0 + m_b1 * x)

# coefficients for phi
p_b0 <- 2.5
p_b1 <- 0.5
phi <- exp(p_b0 + p_b1 * x)

# calculating shape parameters for beta distribution
p <- mu * phi
q <- phi - mu * phi

# calculate, using alpha, if their score comes from bernoulli trial
y_is_discrete <- rbinom(n, 1, alpha)

# calculate y scores
y <- rep(NA, n) # initialize empty vector of outcomes
for (i in 1:n) {
  if (y_is_discrete[i] == 1) { # if y came from bernoulli...
    y[i] <- rbinom(1, 1, gamma[i]) # being 1 is determined by its gamma
  } else {
    y[i] <- rbeta(1, p[i], q[i]) # if it did not, draw from beta
  }
}

hist(y, breaks = 100)

## Try to generate the samples using brms
priors_beta = c(
  prior(normal(0, 1), class = b),
  prior(normal(0, 1), class = b, dpar = phi),
  prior(normal(0, 1), class = Intercept),
  prior(normal(2, 2), class = Intercept, dpar = phi),
  prior(beta(2, 2), class = coi),
  prior(beta(2, 2), class = zoi) #,
  #prior(exponential(2), class = sd)
)

df <- data.frame(y = y, x = x)

# try to fit the model to the data, and see if it can recover the parameters
fit_beta.pp <- brm(bf(y ~ x,  phi ~ x), family = zero_one_inflated_beta, prior = priors_beta, data = df, chains = 2, cores = 2)

