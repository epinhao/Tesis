combin<-function(N,r) factorial(N)/(factorial(r)*factorial(N-r))

invlaplacef <- function(v,lambda,mu,theta,i,j,a) {
	A=18.4
	k=1
	m=11
	n=1000
	
	ft1=exp(A/2)/(2*v)*laplacef(A/(2*v),lambda,mu,theta,i,j,a)
	ft2=vector()
	ft2[k]=0
	ft=vector()

	while(k<(m+n+1)) {
		ft2[k+1]=ft2[k]+(-1)^k*Re(laplacef((A+2*k*pi*complex(real=0, imaginary=1))/(2*v),lambda,mu,theta,i,j,a))
		ft[k]=ft1+exp(A/2)/v*ft2[length(ft2)]
		k=k+1
	}

	e=0

	for(k in 0:11) {
		e=e+combin(m,k)*2^(-m)*ft[n+k]
	}
	return(e)
}