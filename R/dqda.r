# Diagonalized Quadratic Discriminant Analysis (DQDA)
# The DQDA classifier is a modification to LDA, where the off-diagonal elements
# of the pooled sample covariance matrix are set to zero.
# We assume the first column is named "labels" and holds a factor vector,
# which contains the class labels.

# We assume the first column is named "labels" and holds a factor vector,
# which contains the class labels.
dqda <- function(training.df, jointdiag = "none", verbose = FALSE, ...) {
	dqda.obj <- list()
	dqda.obj$training <- training.df
	
	if(jointdiag != "none") {
		if(verbose) message("Simultaneously diagonalizing covariance matrices... ", appendLF = FALSE)
		joint.diag.out <- joint.diagonalization(dqda.obj$training, method = jointdiag)
		dqda.obj$training <- joint.diag.out$transformed.df
		dqda.obj$jointdiag.B <- joint.diag.out$B
		dqda.obj$jointdiag.method <- joint.diag.out$method
		if(verbose) message("done!")
	}
	
	if(verbose) message("Building DQDA classifier... ", appendLF = FALSE)
	N <- nrow(dqda.obj$training)
	
	estimators <- dlply(dqda.obj$training, .(labels), function(class.df) {
		n.k <- nrow(class.df)
		p.hat <- n.k / N
		xbar <- as.vector(colMeans(class.df[, -1]))
		var <- apply(class.df[,-1], 2, function(col) {
			(n.k - 1) * var(col) / n.k
		})
		list(xbar = xbar, var = var, n = n.k, p.hat = p.hat)
	})
	
	if(verbose) message("done!")
	
	dqda.obj$N <- N
	dqda.obj$classes <- levels(dqda.obj$training$labels)
	dqda.obj$estimators <- estimators
	
	class(dqda.obj) <- "dqda"
	
	dqda.obj
}

predict.dqda <- function(object, newdata) {
	if (!inherits(object, "dqda"))  {
		stop("object not of class 'dqda'")
	}
	newdata <- data.matrix(newdata)
	
	if(!is.null(object$jointdiag.method) && object$jointdiag.method != "none") {
		newdata <- newdata %*% t(object$jointdiag.B)
	}
	
	predictions <- apply(newdata, 1, function(obs) {
		scores <- sapply(object$estimators, function(class.est) {
			sum((obs - class.est$xbar)^2 / class.est$var) + sum(log(class.est$var)) - 2 * log(class.est$p.hat)
		})
		predicted.class <- object$classes[which.min(scores)]
		predicted.class
	})
	
	predictions
}