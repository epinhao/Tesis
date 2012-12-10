invlaplacef <- function(t,lambda,mu,theta,i,j,a,T,N) {
	ft1=1/2*Re(laplacef(a,lambda,mu,theta,i,j))
	ft2=0
	for(k in 1:N) {
		ft2=ft2+Re(laplacef(a+k*pi*complex(real=0, imaginary=1)/T,lambda,mu,theta,i,j))*cos(k*pi*t/T)
	}
	ft=2*exp(a*t)/T*(ft1+ft2)
	return(ft)
}

calc<-function(a,b,dt,T,N,at) {
	c=seq(a,b,dt)
	g=vector()
	i=a
	for(k in 1:((b-a)/dt+1)) {
		g[k]=invlaplacef(i,1.85,0.94,0.71,1,5,at,T,N)
		i=i+dt
	}
	h=c((g[1:(length(g)-1)]+g[2:length(g)])/2,0)
	return(data.frame(c,g,h))
}