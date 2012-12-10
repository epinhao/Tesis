f<-function(t) {
	ans=ifelse(t<0,exp(t),exp(-t))
	return(1/2*ans)
}

laplacef<-function(s) 2*exp(-10*s)/(6-3*s)+2*exp(-10*s)/(3*(s+1))

invlaplacef<-function(t,a,T,N) {
	k=seq(1,N,1)
	tau=(k*pi)/T
	f=2*exp(a*t)/T*(1/2*Re(laplacef(a))
	+sum(Re(laplacef(a+tau*complex(real=0, imaginary=1)))*cos(tau*t))
	)
	# -sum(Im(laplacef(a+tau*complex(real=0, imaginary=1)))*sin(tau*t)))
	return(f)
}

calc<-function(a,b,dt,T,N,f) {
	c=seq(a,b,dt)
	g=vector()
	i=a
	for(k in 1:((b-a)/dt+1)) {
		g[k]=invlaplacef(i,f,T,N)
		i=i+dt
	}
	return(data.frame(c,g))
}