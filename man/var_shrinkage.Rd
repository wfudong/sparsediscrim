\name{var_shrinkage}
\alias{var_shrinkage}
\title{Shrinkage-based estimator of variances for each feature from Pang et al. (2009).}
\usage{
  var_shrinkage(N, K, var_feature, num_alphas = 101, t =
  -1)
}
\arguments{
  \item{N}{the sample size.}

  \item{the}{number of classes.}

  \item{var_feature}{a vector of the sample variances for
  each feature.}

  \item{num_alphas}{The number of values used to find the
  optimal amount of shrinkage.}

  \item{t}{a constant specified by the user. By default, t
  = -1 in Pang et al. (2009).}
}
\value{
  a vector of the shrunken variances for each feature.
}
\description{
  This function computes the shrinkage-based estimator of
  variance of each feature (variable) from Pang et al.
  (2009) for the SDLDA classifier.
}
\references{
  Pang, H., Tong, T., & Zhao, H. (2009). "Shrinkage-based
  Diagonal Discriminant Analysis and Its Applications in
  High-Dimensional Data," Biometrics, 65, 4, 1021-1029.
}
