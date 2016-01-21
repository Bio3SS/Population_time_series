if (!exists("dat")) dat <- read.table(input_files[[1]], header=TRUE)

print(names(dat))

# Also add xn and yn inference
if (!exists("xlab")){xlab <- xn}
if (!exists("ylab")){ylab <- yn}
if (!exists("gtitle")){gtitle <- "Population"}

