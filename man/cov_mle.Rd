\name{cov_mle}
\alias{cov_mle}
\title{Computes the maximum likelihood estimator for the sample covariance matrix
under the assumption of multivariate normality.}
\usage{
  cov_mle(x, diag = FALSE)
}
\arguments{
  \item{x}{data matrix with \code{n} observations and
  \code{p} feature vectors}

  \item{diag}{logical value. If TRUE, assumes the
  population covariance matrix is diagonal. By default, we
  assume that \code{diag} is \code{FALSE}.}
}
\value{
  sample covariance matrix of size \eqn{p \times p}. If
  \code{diag} is \code{TRUE}, then a vector of length
  \code{p} is returned instead.
}
\description{
  For a sample matrix, \code{x}, we compute the sample
  covariance matrix of the data as the maximum likelihood
  estimator (MLE) of the population covariance matrix.
}
\details{
  If the \code{diag} option is set to \code{TRUE}, then we
  assume the population covariance matrix is diagonal, and
  the MLE is computed under this assumption. In this case,
  we return a vector of length \code{p} instead.
}

