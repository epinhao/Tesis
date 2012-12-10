text="BIMBO20101116"
#postscript(paste("/Users/Emilio/Documents/workspace/Tesis/Bimbo/Latex/svsd",text,".eps",sep=""), width=6, height=5, horizontal=FALSE)

com <- readLines(paste("/Users/Emilio/Documents/workspace/Tesis/Bimbo/compra",text,".txt",sep=""))
ven <- readLines(paste("/Users/Emilio/Documents/workspace/Tesis/Bimbo/venta",text,".txt",sep=""))
test <- read.csv(paste("/Users/Emilio/Documents/workspace/Tesis/Bimbo/ordenes",text,".txt",sep=""), header=FALSE)
test2 <- read.csv(paste("/Users/Emilio/Documents/workspace/Tesis/Bimbo/ordenes2",text,".txt",sep=""), header=FALSE)
c <- list()
v <- list()
for(k in 1:length(com)) {
	c[[k]] <- as.numeric(strsplit(com[k],",")[[1]])
	v[[k]] <- as.numeric(strsplit(ven[k],",")[[1]])
}

t=vector()
f=vector()
g=vector()
cqpun=vector()
cppun=vector()
cpq=vector()
cpq5=vector()
cq=vector()
vqpun=vector()
vppun=vector()
vpq=vector()
vpq5=vector()
vq=vector()

for(k in 1:length(com)) {
	t[k]=c[[k]][1]
	cqpun[k]=c[[k]][3]
	cppun[k]=c[[k]][2]
	cpq[k]=sum(c[[k]][seq(2,length(c[[k]]),2)]*c[[k]][seq(3,length(c[[k]]),2)])
	cpq5[k]=sum(c[[k]][seq(2,min(10,length(c[[k]])),2)]*c[[k]][seq(3,min(11,length(c[[k]])),2)])
	cq[k]=sum(c[[k]][seq(3,length(c[[k]]),2)])
	vqpun[k]=v[[k]][3]
	vppun[k]=v[[k]][2]
	vpq[k]=sum(v[[k]][seq(2,length(v[[k]]),2)]*v[[k]][seq(3,length(v[[k]]),2)])
	vpq5[k]=sum(v[[k]][seq(2,min(10,length(v[[k]])),2)]*v[[k]][seq(3,min(11,length(v[[k]])),2)])
	vq[k]=sum(v[[k]][seq(3,length(v[[k]]),2)])
}

cp=cpq/cq
vp=vpq/vq

cpqp=cpq-cqpun*cppun
cqp=cq-cqpun
cpp=cpqp/cqp

vpqp=vpq-vqpun*vppun
vqp=vq-vqpun
vpp=vpqp/vqp

wt=(cpq*vpq)/(cp-vp)^2
wp=(cpqp*vpqp)/(cpp-vpp)^2
wpun=(cqpun*vqpun)/(cppun-vppun)^2

x=data.frame(wt=log(wt),wp=log(wp),wpun=log(wpun))
y=factor(test[,2])

for(k in 1:length(t)) {
	s = 30
	a=test[,4][test[,4]<t[k]+s*1000]
	f[k]=length(a[a>t[k]-s*1000])
}

for(k in 1:length(test[,4])) {
	g[k]=which(t==test[k,4])[1]
}
r= which(is.na(g))
g=g[!is.na(g)]
svsd=cpq[g]-vpq[g]
svsd=svsd/max(abs(svsd))
svsd5=cpq5[g]-vpq5[g]
svsd5=svsd5/max(abs(svsd5))
if(length(r)>0) p=test[-r,2] else p=test[,2]

plot(p[-length(p)],type='l')
par(new=TRUE)
plot(svsd,type='l',xaxt='n',yaxt='n',ylim=c(-1,1),col='red',xlab='',ylab='')
lines(svsd5,type='l',xaxt='n',yaxt='n',ylim=c(-1,1),col='blue',xlab='',ylab='')
axis(4)
abline(0,0)

div=round(length(test[,1])/20,0)
#div=30
p2=append(mat.or.vec(div,1),p)
p=append(p,mat.or.vec(div,1))
dp=p-p2
dp=dp[seq(div+1,length(p)-div,1)]
svsd=svsd[1:length(dp)]
svsd5=svsd5[1:length(dp)]
res=lm(dp~svsd5)

#dev.off()