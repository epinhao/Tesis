mydata = read.csv("/Users/Emilio/Documents/workspace/Tesis/distanciaprecioAMX.txt", header = FALSE)
#data = mydata[mydata$V1 == "Compra", ]
#data = mydata[mydata$V1 == "CompraMod", ]
data = mydata[mydata$V1 == "Venta", ]
#data = mydata[mydata$V1 == "VentaMod", ]
vol=data[,2]

f <- function(a) {
	length(vol)*log(a[2]) - length(vol)*log(a[1])-(a[2]+1)*sum(log(1+vol/a[1]))
}
g <- function(a) {
	c(length(vol)/a[2]-sum(log(1+vol/a[1])), -length(vol)/a[1]+(a[2]+1)*sum(vol/(a[1]*(a[1]+vol))))
}

m = maxLik(f,g,start=c(4,7),method="NM",tol=1e-16)
val = m$estimate
cdf=ecdf(vol)
plot(cdf,verticals=TRUE,do.points=FALSE,xlim=c(0,90000),main=NULL)
volf <- function(x) 1-(1+x/val[1])^(-val[2])
curve(volf,0,90000,lwd=0.5,add=TRUE)
legend('right', c("Distribución Empírica del Volumen","Modelo Ajustado"),cex=0.6,lty=c(1,1),lwd=c(2,0.5),bty="n")