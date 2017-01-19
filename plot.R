library(ggplot2)
theme_set(theme_bw())

ts <- (
	ggplot(dat, aes(x=x, y=y))
	+ geom_point() + geom_line()
	+ xlab(xlab) + ylab(ylab)
	+ ggtitle(gtitle)
)

print(ts)
print(ts + scale_y_log10())

print(
	ggplot(dat, aes(x=y, y=yp))
	+ geom_point() + geom_smooth(method="lm")
	+ geom_abline(slope=1, intercept=0)
	+ xlab(ylab) + ylab("Next observation")
)

lamp <- (
	ggplot(dat, aes(x=y, y=lam))
	+ geom_point() + geom_smooth(method="lm")
	+ geom_abline(slope=0, intercept=1)
	+ xlab(ylab) + ylab("Finite rate of increase")
)

print(lamp)

print(lamp+scale_x_log10())


