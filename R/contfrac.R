laplacefi <- function(s,lambda,mup,n,i) {

	p=vector()
	q=vector()
	w=vector()

	r=min(n,i)
	mu=mup*r

	p[1]=0
	q[1]=1
	p[2]=-lambda*mu
	q[2]=lambda+mu+s
	w=p/q

	tol=TRUE
	k=3

	while(tol && k<100) {
		i=i+1
		r=min(n,i)
		mu=mup*r
		a=-lambda*mu
		b=lambda+mu+s
		p[k]=b*p[k-1]+a*p[k-2]
		q[k]=b*q[k-1]+a*q[k-2]
		if(k %% 10 == 9) {
			m=max(abs(p[k]),abs(q[k]))
			p[k]=p[k]/m
			q[k]=q[k]/m
		}
		if(k %% 10 == 0) {
			m=max(abs(p[k]),abs(q[k]))
			p[k]=p[k]/m
			q[k]=q[k]/m
		}
		w[k]=p[k]/q[k]
		if(abs(w[k]-w[k-1]) < 1.e-10)
			tol = FALSE
		k=k+1
	}
	return(-1/lambda*w[length(w)])
}