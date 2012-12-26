laplacef <- function(s,lambda,mu,theta,i,j) {
	p1=1
	while(i>0) {
		p1=p1*laplacefi(s,lambda,mu,theta,i)
		i=i-1
	}
	p2=1
	while(j>0) {
		p2=p2*laplacefi(-s,lambda,mu,theta,j)
		j=j-1
	}
	return(p1*p2*exp(-15*s))
}