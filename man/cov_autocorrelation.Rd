\name{cov_autocorrelation}
\alias{cov_autocorrelation}
\title{Generates a \eqn{p \times p} autocorrelated covariance matrix}
\usage{
  cov_autocorrelation(p, rho, sigma2 = 1)
}
\arguments{
  \item{p}{the size of the covariance matrix}

  \item{rho}{the autocorrelation parameter. Must be less
  than 1 in absolute value.}

  \item{sigma2}{the variance of each feature}
}
\value{
  autocorrelated covariance matrix
}
\description{
  This function generates a \eqn{p \times p} autocorrelated
  covariance matrix with autocorrelation parameter
  \code{rho}. The variance \code{sigma2} is constant for
  each feature and defaulted to 1.
}
\details{
  The autocorrelated covariance matrix is defined as: The
  \eqn{(i,j)}th entry of the autocorrelated covariance
  matrix is defined as: \eqn{\rho^{|i - j|}}.

  The value of \code{rho} must be such that \eqn{|\rho| <
  1} to ensure that the covariance matrix is positive
  definite.
}

