library(ggplot2)
# theme_set(theme_bw(text(size=rel(2))))
theme_set(
	theme_bw(base_size=18)
	## %+replace% theme(axis.text = element_text(size = rel(2.0)))
)

tstitle <- ifelse(is.null(gtitle), "Time series", gtitle)
ts <- (
	ggplot(dat, aes(x=x, y=y))
	+ geom_point() + geom_line()
	+ xlab(xlab) + ylab(ylab)
	+ ggtitle(tstitle)
)

print(ts)
print(ts + scale_y_log10())

steptitle <- ifelse(is.null(gtitle), "Step-forward", gtitle)
print(
	ggplot(dat, aes(x=y, y=yp))
	+ geom_point() + geom_smooth(method="lm", formula=y~poly(x, 2))
	+ geom_abline(slope=1, intercept=0)
	+ xlab(ylab) + ylab("Next observation")
	+ ggtitle(steptitle)
)

inctitle <- ifelse(is.null(gtitle), "Rate of increase", gtitle)
lamp <- (
	ggplot(dat, aes(x=y, y=lam))
	+ geom_point() + geom_smooth(method="lm")
	+ geom_abline(slope=0, intercept=1)
	+ xlab(ylab) + ylab("Finite rate of increase")
	+ ggtitle(inctitle)
)

print(lamp)

print(lamp+scale_x_log10())


