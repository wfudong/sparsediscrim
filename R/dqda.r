# Diagonalized Quadratic Discriminant Analysis (DQDA)
#'
#' Given a set of training data, this function builds the DQDA classifier,
#' which is often attributed to Dudoit et al. (2002).
#'
# The DQDA classifier is a modification to QDA, where the off-diagonal elements
# of the sample covariance matrices for each class are set to zero.
#' 
#' @param x training data in matrix form.
#' @param y labels of the training data.
#'
#' @references Dudoit, S., Fridlyand, J., & Speed, T. P. (2002). "Comparison of Discrimination Methods for the Classification of Tumors Using Gene Expression Data," Journal of the American Statistical Association, 97, 457, 77-87. 
#' @return dqda obj
dqda <- function(x, y) {
	obj <- list()
	y <- factor(y)
	obj$labels <- y
	obj$N <- length(y)
	obj$p <- ncol(x)
	obj$groups <- levels(y)
	obj$num_groups <- nlevels(obj$labels)
	
	obj$est <- foreach(k=levels(y)) %do% {
		stats <- list()
		x_k <- x[which(y == k), ]
		stats$label <- k
		stats$n_k <- n_k <- nrow(x_k)
		stats$xbar_k <- colMeans(x_k)
		stats$var <- (n_k - 1) * apply(x_k, 2, var) / n_k
		stats
	}
	class(obj) <- "dqda"
	
	obj
}

predict_dqda <- function(obj, newdata) {
	if (!inherits(obj, "dqda"))  {
		stop("obj not of class 'dqda'")
	}
	if(is.vector(newdata)) newdata <- matrix(newdata, nrow = 1)

	scores <- apply(newdata, 1, function(obs) {
		sapply(obj$est, function(class_est) {
			sum((obs - class_est$xbar)^2 / class_est$var) 
		})
	})
	
	if(is.vector(scores)) {
		min_scores <- which.min(scores)
	} else {
		min_scores <- apply(scores, 1, which.min)
	}

	predicted <- factor(obj$groups[min_scores], levels = obj$groups)
	
	list(scores = scores, predicted = predicted)
}
