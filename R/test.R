f <- function(a) {
	length(data)*loge(a[2]) - length(data)*loge(a[1])-(a[2]+1)*sum(loge(1+data/a[1]))
}
g <- function(a) {
	c(length(data)/a[2]-sum(loge(1+data/a[1])), -length(data)/a[1]+(a[2]+1)*sum(data/(a[1]*(a[1]+data))))
}

m = maxLik(f,g,start=c(4,7),method="NM",tol=1e-16)
val = m$estimate
cdf=ecdf(data)
plot(cdf,verticals=TRUE,do.points=FALSE,xlim=c(0,1000))
lo <- function(x) 1-(1+x/val[1])^(-val[2])
curve(lo,0,1000,add=TRUE)