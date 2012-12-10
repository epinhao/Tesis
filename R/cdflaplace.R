ilf<-function(t) invlaplacef(t,1.85,0.94,0.71,1,1,20)
f=vector()
a=0.1
for(k in 1:300){
	f[k]=ilf(a)
	a=a+0.1
}