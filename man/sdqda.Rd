\name{sdqda}
\alias{predict.sdqda}
\alias{print.sdqda}
\alias{sdqda}
\alias{sdqda.default}
\alias{sdqda.formula}
\title{Shrinkage-based Diagonal Quadratic Discriminant Analysis (SDQDA)}
\usage{
  sdqda(x, ...)

  \method{sdqda}{default} (x, y, prior = NULL,
    num_alphas = 101, est_mean = c("mle", "tong"), ...)

  \method{sdqda}{formula} (formula, data, prior = NULL,
    num_alphas = 101, est_mean = c("mle", "tong"), ...)

  \method{print}{sdqda} (x, ...)

  \method{predict}{sdqda} (object, newdata, ...)
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

  \item{num_alphas}{the number of values used to find the
  optimal amount of shrinkage}

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

  \item{object}{trained SDQDA object}

  \item{newdata}{matrix of observations to predict. Each
  row corresponds to a new observation.}

  \item{...}{additional arguments}
}
\value{
  \code{sdqda} object that contains the trained SDQDA
  classifier

  list predicted class memberships of each row in newdata
}
\description{
  Given a set of training data, this function builds the
  Shrinkage-based Diagonal Quadratic Discriminant Analysis
  (SDQDA) classifier, which is based on the DQDA
  classifier, often attributed to Dudoit et al. (2002). The
  DQDA classifier belongs to the family of Naive Bayes
  classifiers, where the distributions of each class are
  assumed to be multivariate normal. To improve the
  estimation of the class variances, Pang et al. (2009)
  proposed the SDQDA classifier which uses a
  shrinkage-based estimators of each class covariance
  matrix.

  Summarizes the trained SDQDA classifier in a nice manner.

  The SDQDA classifier is a modification to QDA, where the
  off-diagonal elements of the pooled sample covariance
  matrix are set to zero. To improve the estimation of the
  pooled variances, we use a shrinkage method from Pang et
  al.  (2009).
}
\details{
  The DQDA classifier is a modification to the well-known
  QDA classifier, where the off-diagonal elements of the
  pooled covariance matrix are assumed to be zero -- the
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
set.seed(42)
n <- nrow(iris)
train <- sample(seq_len(n), n / 2)
sdqda_out <- sdqda(Species ~ ., data = iris[train, ])
predicted <- predict(sdqda_out, iris[-train, -5])$class

sdqda_out2 <- sdqda(x = iris[train, -5], y = iris[train, 5])
predicted2 <- predict(sdqda_out2, iris[-train, -5])$class
all.equal(predicted, predicted2)
}
\references{
  Dudoit, S., Fridlyand, J., & Speed, T. P. (2002).
  "Comparison of Discrimination Methods for the
  Classification of Tumors Using Gene Expression Data,"
  Journal of the American Statistical Association, 97, 457,
  77-87.

  Pang, H., Tong, T., & Zhao, H. (2009). "Shrinkage-based
  Diagonal Discriminant Analysis and Its Applications in
  High-Dimensional Data," Biometrics, 65, 4, 1021-1029.

  Dudoit, S., Fridlyand, J., & Speed, T. P. (2002).
  "Comparison of Discrimination Methods for the
  Classification of Tumors Using Gene Expression Data,"
  Journal of the American Statistical Association, 97, 457,
  77-87.

  Pang, H., Tong, T., & Zhao, H. (2009). "Shrinkage-based
  Diagonal Discriminant Analysis and Its Applications in
  High-Dimensional Data," Biometrics, 65, 4, 1021-1029.
}
\keyword{internal}

