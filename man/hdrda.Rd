\name{hdrda}
\alias{hdrda}
\alias{hdrda.default}
\alias{hdrda.formula}
\alias{predict.hdrda}
\title{High-Dimensional Regularized Discriminant Analysis (HDRDA)}
\usage{
  hdrda(x, ...)

  \method{hdrda}{default} (x, y, lambda = 1,
    alpha = rep(1, K), gamma = 0, prior = NULL,
    tol = 1e-06, ...)

  \method{hdrda}{formula} (formula, data, ...)

  \method{predict}{hdrda} (object, newdata, ...)
}
\arguments{
  \item{x}{matrix containing the training data. The rows
  are the sample observations, and the columns are the
  features.}

  \item{y}{vector of class labels for each training
  observation}

  \item{lambda}{the HDRDA pooling parameter. Must be
  between 0 and 1, inclusively.}

  \item{alpha}{numeric vector of length \code{K} that
  scales the convex combination of covariance matrices in
  the HDRDA classifier. By default, each value is 1. See
  Ramey et al. (2013) for details.}

  \item{gamma}{a numeric values used for the shrinkage
  parameter.}

  \item{prior}{vector with prior probabilities for each
  class. If \code{NULL} (default), then the sample
  proportion of observations belonging to each class equal
  probabilities are used. See details.}

  \item{tol}{a threshold for determining nonzero
  eigenvalues.}

  \item{formula}{A formula of the form \code{groups ~ x1 +
  x2 + ...} That is, the response is the grouping factor
  and the right hand side specifies the feature vectors.}

  \item{data}{data frame from which variables specified in
  \code{formula} are preferentially to be taken.}

  \item{...}{arguments passed from the \code{formula} to
  the \code{default} method}

  \item{object}{object of type \code{hdrda} that contains
  the trained HDRDA classifier}

  \item{newdata}{matrix containing the unlabeled
  observations to classify. Each row corresponds to a new
  observation.}
}
\value{
  \code{hdrda} object that contains the trained HDRDA
  classifier

  list with predicted class and discriminant scores for
  each of the K classes
}
\description{
  Given a set of training data, this function builds the
  HDRDA classifier from Ramey, Stein, and Young (2013).
  Specially designed for small-sample, high-dimensional
  data, the HDRDA classifier incorporates dimension
  reduction and covariance-matrix shrinkage to enable a
  computationally efficient classifier.

  For a given \code{hdrda} object, we predict the class of
  each observation (row) of the the matrix given in
  \code{newdata}.
}
\details{
  The HDRDA classifier utilizes a covariance-matrix
  estimator that is a convex combination of the
  covariance-matrix estimators used in the Linear
  Discriminant Analysis (LDA) and Quadratic Discriminant
  Analysis (QDA) classifiers. For each of the \code{K}
  classes given in \code{y}, \eqn{(k = 1, \ldots, K)}, we
  first define this convex combination as
  \deqn{\hat{\Sigma}_k(\lambda) = (1 - \lambda)
  \hat{\Sigma}_k + \lambda \hat{\Sigma},} where \eqn{lambda
  \in [0, 1]} is the \emph{pooling} parameter. We then
  calculate the covariance-matrix estimator
  \deqn{\tilde{\Sigma}_k = \alpha_k \hat{\Sigma}_k(\lambda)
  + \gamma I_p,} where \eqn{I_p} is the \eqn{p \times p}
  identity matrix. The matrix \eqn{\tilde{\Sigma}_k} is
  substituted into the HDRDA classifier. See Ramey et al.
  (2013) for more details.

  The matrix of training observations are given in
  \code{x}. The rows of \code{x} contain the sample
  observations, and the columns contain the features for
  each training observation. The vector of class labels
  given in \code{y} are coerced to a \code{factor}. The
  length of \code{y} should match the number of rows in
  \code{x}.

  The vector \code{prior} contains the \emph{a priori}
  class membership for each class. If \code{prior} is
  \code{NULL} (default), the class membership probabilities
  are estimated as the sample proportion of observations
  belonging to each class. Otherwise, \code{prior} should
  be a vector with the same length as the number of classes
  in \code{y}. The \code{prior} probabilties should be
  nonnegative and sum to one. The order of the prior
  probabilties is assumed to match the levels of
  \code{factor(y)}.
}
\references{
  Ramey, J. A., Stein, C. K., and Young, D. M. (2013),
  "High-Dimensional Regularized Discriminant Analysis."

  Friedman, J. H. (1989), "Regularized Discriminant
  Analysis," Journal of American Statistical Association,
  84, 405, 165-175. \url{http://www.jstor.org/pss/2289860}
  (Requires full-text access).
}

