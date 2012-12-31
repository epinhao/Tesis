f <- function(x) 2/3*exp(-2/3*x)
curve(f,0,3.2,xlim=c(-1.2,3.2),ylim=c(0,1),axes=FALSE,xlab="",ylab="")
axis(1, at=c(-1.5,-1,0,1,2,3,3.5), lab=c("","-T","0","T","2T","3T",""))
lines(c(0,0),c(0,0.8))
lines(c(1,1),c(0,2/3*exp(-2/3)))
lines(c(2,2),c(0,2/3*exp(-2/3*2)))
lines(c(3,3),c(0,2/3*exp(-2/3*3)))
text(0,0.7, "h(t)",2)
text(0,0.7, "h(t)=",-1.5)
text(0,0.7, expression(e^{-at}*"f(t)"),-2)

g1 <- function(x) {
	bp=x[(x>-2)&(x<=-1)]
	ap=x[(x>-1)&(x<=0)]
	a=x[(x>0)&(x<=1)]
	b=x[(x>1)&(x<=2)]
	c=x[(x>2)&(x<=3)]
	d=x[(x>3)&(x<=4)]
	bp=2/3*exp(-2/3*(2+bp))
	ap=2/3*exp(-2/3*(-ap))
	a=2/3*exp(-2/3*a)
	b=2/3*exp(-2/3*(2-b))
	c=2/3*exp(-2/3*(c-2))
	d=2/3*exp(-2/3*(4-d))
	return(c(bp,ap,a,b,c,d))
}
curve(g1,-1.2,3.2,xlim=c(-1.2,3.2),ylim=c(0,1),axes=FALSE,xlab="",ylab="")
axis(1, at=c(-1.5,-1,0,1,2,3,3.5), lab=c("","-T","0","T","2T","3T",""))
lines(c(-1,-1),c(0,2/3*exp(-2/3)))
lines(c(0,0),c(0,0.8))
lines(c(1,1),c(0,2/3*exp(-2/3)))
lines(c(2,2),c(0,2/3))
lines(c(3,3),c(0,2/3*exp(-2/3)))
text(0,0.7, expression(g[1](t)),-2)

g2 <- function(x) {
	bp=x[(x>-2)&(x<=-1)]
	ap=x[(x>-1)&(x<=0)]
	a=x[(x>0)&(x<=1)]
	b=x[(x>1)&(x<=2)]
	c=x[(x>2)&(x<=3)]
	d=x[(x>3)&(x<=4)]
	bp=2/3*exp(-2/3*(-bp))
	ap=2/3*exp(-2/3*(2+ap))
	a=2/3*exp(-2/3*(2-a))
	b=2/3*exp(-2/3*b)
	c=2/3*exp(-2/3*(4-c))
	d=2/3*exp(-2/3*(d-2))
	return(c(bp,ap,a,b,c,d))
}
curve(g2,-1.2,3.2,xlim=c(-1.2,3.2),ylim=c(0,1),axes=FALSE,xlab="",ylab="")
axis(1, at=c(-1.5,-1,0,1,2,3,3.5), lab=c("","-T","0","T","2T","3T",""))
lines(c(-1,-1),c(0,2/3*exp(-2/3)))
lines(c(0,0),c(0,0.8))
lines(c(1,1),c(0,2/3*exp(-2/3)))
lines(c(2,2),c(0,2/3*exp(-2/3*2)))
lines(c(3,3),c(0,2/3*exp(-2/3)))
text(0,0.7, expression(g[2](t)),-2)

g3 <- function(x) {
	bp=x[(x>-2)&(x<=-1)]
	ap=x[(x>-1)&(x<=0)]
	a=x[(x>0)&(x<=1)]
	b=x[(x>1)&(x<=2)]
	c=x[(x>2)&(x<=3)]
	d=x[(x>3)&(x<=4)]
	bp=2/3*exp(-2/3*(4+bp))
	ap=2/3*exp(-2/3*(2-ap))
	a=2/3*exp(-2/3*(a+2))
	b=2/3*exp(-2/3*(4-b))
	c=2/3*exp(-2/3*c)
	d=2/3*exp(-2/3*(6-d))
	return(c(bp,ap,a,b,c,d))
}
curve(g3,-1.2,3.2,xlim=c(-1.2,3.2),ylim=c(0,1),axes=FALSE,xlab="",ylab="")
axis(1, at=c(-1.5,-1,0,1,2,3,3.5), lab=c("","-T","0","T","2T","3T",""))
lines(c(-1,-1),c(0,2/3*exp(-2/3*3)))
lines(c(0,0),c(0,0.8))
lines(c(1,1),c(0,2/3*exp(-2/3*3)))
lines(c(2,2),c(0,2/3*exp(-2/3*2)))
lines(c(3,3),c(0,2/3*exp(-2/3*3)))
text(0,0.7, expression(g[3](t)),-2)