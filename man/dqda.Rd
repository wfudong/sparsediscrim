\name{dqda}
\alias{dqda}
\alias{dqda.default}
\alias{dqda.formula}
\alias{predict.dqda}
\alias{print.dqda}
\title{Diagonal Quadratic Discriminant Analysis (DQDA)}
\usage{
  dqda(x, ...)

  \method{dqda}{default} (x, y, prior = NULL,
    est_mean = c("mle", "tong"), ...)

  \method{dqda}{formula} (formula, data, prior = NULL,
    est_mean = c("mle", "tong"), ...)

  \method{print}{dqda} (x, ...)

  \method{predict}{dqda} (object, newdata, ...)
}
\arguments{
  \item{x}{matrix containing the training data. The rows
  are the sample observations, and the columns are the
  features.}

  \item{y}{vector of class labels for each training
  observation}

  \item{prior}{vector with prior probabilities for each
  class. If NULL (default), then equal probabilities are
  used. See details.}

  \item{est_mean}{the estimator for the class means. By
  default, we use the maximum likelihood estimator (MLE).
  To improve the estimation, we provide the option to use a
  shrunken mean estimator proposed by Tong et al. (2012).}

  \item{formula}{A formula of the form \code{groups ~ x1 +
  x2 + ...} That is, the response is the grouping factor
  and the right hand side specifies the (non-factor)
  discriminators.}

  \item{data}{data frame from which variables specified in
  \code{formula} are preferentially to be taken.}

  \item{x}{object to print}

  \item{...}{unused}

  \item{object}{trained DQDA object}

  \item{newdata}{matrix of observations to predict. Each
  row corresponds to a new observation.}

  \item{...}{additional arguments}
}
\value{
  \code{dqda} object that contains the trained DQDA
  classifier

  list predicted class memberships of each row in newdata
}
\description{
  Given a set of training data, this function builds the
  Diagonal Quadratic Discriminant Analysis (DQDA)
  classifier, which is often attributed to Dudoit et al.
  (2002). The DQDA classifier belongs to the family of
  Naive Bayes classifiers, where the distributions of each
  class are assumed to be multivariate normal. Note that
  the DLDA classifier is a special case of the DQDA
  classifier.

  Summarizes the trained DQDA classifier in a nice manner.

  The DQDA classifier is a modification to QDA, where the
  off-diagonal elements of the pooled sample covariance
  matrix are set to zero.
}
\details{
  The DQDA classifier is a modification to the well-known
  QDA classifier, where the off-diagonal elements of each
  class covariance matrix are assumed to be zero -- the
  features are assumed to be uncorrelated. Under
  multivariate normality, the assumption uncorrelated
  features is equivalent to the assumption of independent
  features. The feature-independence assumption is a
  notable attribute of the Naive Bayes classifier family.
  The benefit of these classifiers is that they are fast
  and have much fewer parameters to estimate, especially
  when the number of features is quite large.

  The matrix of training observations are given in
  \code{x}. The rows of \code{x} contain the sample
  observations, and the columns contain the features for
  each training observation.

  The vector of class labels given in \code{y} are coerced
  to a \code{factor}. The length of \code{y} should match
  the number of rows in \code{x}.

  An error is thrown if a given class has less than 2
  observations because the variance for each feature within
  a class cannot be estimated with less than 2
  observations.

  The vector, \code{prior}, contains the \emph{a priori}
  class membership for each class. If \code{prior} is NULL
  (default), the class membership probabilities are
  estimated as the sample proportion of observations
  belonging to each class. Otherwise, \code{prior} should
  be a vector with the same length as the number of classes
  in \code{y}. The \code{prior} probabilties should be
  nonnegative and sum to one.
}
\examples{
n <- nrow(iris)
train <- sample(seq_len(n), n / 2)
dqda_out <- dqda(Species ~ ., data = iris[train, ])
predicted <- predict(dqda_out, iris[-train, -5])$class

dqda_out2 <- dqda(x = iris[train, -5], y = iris[train, 5])
predicted2 <- predict(dqda_out2, iris[-train, -5])$class
all.equal(predicted, predicted2)
}
\references{
  Dudoit, S., Fridlyand, J., & Speed, T. P. (2002).
  "Comparison of Discrimination Methods for the
  Classification of Tumors Using Gene Expression Data,"
  Journal of the American Statistical Association, 97, 457,
  77-87.

  Dudoit, S., Fridlyand, J., & Speed, T. P. (2002).
  "Comparison of Discrimination Methods for the
  Classification of Tumors Using Gene Expression Data,"
  Journal of the American Statistical Association, 97, 457,
  77-87.
}
\keyword{internal}

