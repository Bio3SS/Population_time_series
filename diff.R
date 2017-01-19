dat <- data.frame(dat[[xn]], dat[[yn]])
names(dat) <- c("x", "y")

dat <- within(dat, {
	yp <- c(y[-1], NA)
	lam <- yp/y
})
