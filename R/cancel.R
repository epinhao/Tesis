mydata = read.csv("/Users/Emilio/Documents/workspace/Tesis/distanciaprecioKUO.txt", header = FALSE)
#data = mydata[mydata$V1 == "CancCompra", ]
data = mydata[mydata$V1 == "CancVenta", ]
data=data[,4]-data[,5]
data=round(data*100,0)
n=length(data)
data=data[data>0]
n=1-length(data)/n

f <- function(a) {
	length(data)*log(a[2]) - length(data)*log(a[1])-(a[2]+1)*sum(log(1+data/a[1]))
}
g <- function(a) {
	c(length(data)/a[2]-sum(log(1+data/a[1])), -length(data)/a[1]+(a[2]+1)*sum(data/(a[1]*(a[1]+data))))
}

m = maxLik(f,g,start=c(4,7),method="NM",tol=1e-16)
val = m$estimate
cdf=ecdf(data2)
plot(cdf,verticals=TRUE,do.points=FALSE,xlim=c(0,200),main=NULL)
cancf <- function(x) 1-(1+x/val[1])^(-val[2])
curve(cancf,0,200,lwd=0.5,add=TRUE)
legend('right', c("Empírica","Modelo"),cex=0.6,lty=c(1,1),lwd=c(2,0.5),bty="n")