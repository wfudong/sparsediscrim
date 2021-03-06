\name{h}
\alias{h}
\title{Bias correction function from Pang et al. (2009).}
\usage{
  h(nu, p, t = -1)
}
\arguments{
  \item{nu}{a specified constant (nu = N - K)}

  \item{p}{the feature space dimension.}

  \item{t}{a constant specified by the user that indicates
  the exponent to use with the variance estimator. By
  default, t = -1 as in Pang et al. See the paper for more
  details.}
}
\value{
  the bias correction value
}
\description{
  This function computes the function \eqn{h_{nu, p}(t)} on
  page 1023 of Pang et al. (2009).
}
\references{
  Pang, H., Tong, T., & Zhao, H. (2009). "Shrinkage-based
  Diagonal Discriminant Analysis and Its Applications in
  High-Dimensional Data," Biometrics, 65, 4, 1021-1029.
  \url{http://onlinelibrary.wiley.com/doi/10.1111/j.1541-0420.2009.01200.x/abstract}
}

