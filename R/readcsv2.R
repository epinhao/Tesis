mydata = read.csv("/Users/Emilio/Documents/workspace/Tesis/distanciaAMX.txt", header = FALSE)
#data = mydata[mydata$V1 == "Compra", ]
data = mydata[mydata$V1 == "CompraMod", ]
#data = mydata[mydata$V1 == "Venta", ]
#data = mydata[mydata$V1 == "VentaMod", ]

f <- function(a) {
	length(data)*log(a[2]) - length(data)*log(a[1])-(a[2]+1)*sum(log(1+data/a[1]))
}
g <- function(a) {
	c(length(data)/a[2]-sum(log(1+data/a[1])), -length(data)/a[1]+(a[2]+1)*sum(data/(a[1]*(a[1]+data))))
}

rm(mydata)

data=data[,3]-data[,4]
s=length(data)
data=data[data>0]
s2=length(data)
data=round(data*100,0)

m = maxLik(f,g,start=c(4,7),method="NM",tol=1e-16)
val = m$estimate
cdf=ecdf(data)
plot(cdf,verticals=TRUE,do.points=FALSE,xlim=c(0,1000),main=NULL)
lo <- function(x) 1-(1+x/val[1])^(-val[2])
curve(lo,0,1000,lwd=0.5,add=TRUE)
legend('right', c("Empírica","Modelo"),cex=0.6,lty=c(1,1),lwd=c(2,0.5),bty="n")