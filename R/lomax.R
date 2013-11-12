lomax <- function(l,a,n) {
y=runif(n)
x = -l *((1-y)^(1/a)-1)* (1-y)^(-1/a)
return(x)
}
plomax <- function(x,l,a) {
	1-(1+x/l)^(-a)
}