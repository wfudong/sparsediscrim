\name{cov_intraclass}
\alias{cov_intraclass}
\title{Generates a \eqn{p \times p} intraclass covariance matrix}
\usage{
  cov_intraclass(p, rho, sigma2 = 1)
}
\arguments{
  \item{p}{the size of the covariance matrix}

  \item{rho}{the value of the off-diagonal elements}

  \item{sigma2}{the variance of each feature}
}
\value{
  intraclass covariance matrix
}
\description{
  This function generates a \eqn{p \times p} intraclass
  covariance matrix with correlation \code{rho}. The
  variance \code{sigma2} is constant for each feature and
  defaulted to 1.
}
\details{
  The intraclass covariance matrix is defined as:
  \deqn{sigma2 * (\rho * J_p + (1 - \rho) * I_p),} where
  \eqn{J_p} is the \eqn{p \times p} matrix of ones and
  \eqn{I_p} is the \eqn{p \times p} identity matrix.

  By default, with \code{sigma2 = 1}, the diagonal elements
  of the intraclass covariance matrix are all 1, while the
  off-diagonal elements of the matrix are all \code{rho}.

  The value of \code{rho} must be between \eqn{(1 -
  p)^(-1)} and 1, exclusively, to ensure that the
  covariance matrix is positive definite.
}

