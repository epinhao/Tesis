lambda=0.1669
mu=0.1438
theta=0.6480

orderbook<-function(X,N) {

res=vector()

for(k in 1:N) {
	t=0
	x=X
	if(x==0) {
		t=t+rexp(1,lambda)
		x=1
	}
	while(x>0) {
		a=rexp(1,lambda)
		d=rexp(1,mu+theta*x)
		t=t+min(a,d)
		v=which(c(a,d)==min(a,d))
		x=ifelse(v==1,x+1,x-1)
	}
	res[k]=t
}
return(res)
}