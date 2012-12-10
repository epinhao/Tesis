lambda=0.5
mu=0.4
s=3

res=vector()

for(k in 1:10000) {
	t=0
	x=2
	if(x==0) {
		t=t+rexp(1,lambda)
		x=1
	}
	while(x>0) {
		a=rexp(1,lambda)
		d=rexp(1,mu*min(s,x))
		t=t+min(a,d)
		v=which(c(a,d)==min(a,d))
		x=ifelse(v==1,x+1,x-1)
	}
	res[k]=t
}