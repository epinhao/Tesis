mydata = read.csv("/Users/Emilio/Documents/workspace/Tesis/distanciaprecioKUO.txt", header = FALSE)
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
y=lomax(val[1],val[2],100000)
l=val[1]
a=val[2]
#Medicion
cdf <- ecdf(vol)
b=cdf(knots(cdf))
c=plomax(knots(cdf),l,a)
d=abs(b-c)
e=knots(cdf)<round(-l *((1-0.8)^(1/a)-1)* (1-0.8)^(-1/a),0)
print("mean")
print(mean(d[e]))
print("max")
print(max(d[e]))
print("80%")
print(max(knots(cdf)[e]))
print("max d")
print(knots(cdf)[e][d[e]==max(d[e])])
#
p=0.99
#lim=-l *((1-p)^(1/a)-1)* (1-p)^(-1/a)
#lim=80000
#postscript("/Users/Emilio/Documents/workspace/Tesis/kuovolumenventaqq.eps", width=6, height=5, horizontal=FALSE)
#qqplot(y,vol,xlim=c(0,lim),ylim=c(0,lim),pch=20,cex=0.75,xlab="Teórico",ylab="Muestra")
#abline(0,1)
#dev.off()
#plot(cdf,verticals=TRUE,do.points=FALSE,xlim=c(0,80000),main=NULL)
#volf <- function(x) 1-(1+x/val[1])^(-val[2])
#curve(volf,0,80000,lwd=0.5,add=TRUE)
#legend('right', c("Empírica","Modelo"),cex=0.6,lty=c(1,1),lwd=c(2,0.5),bty="n")