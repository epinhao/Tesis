laplacef <- function(s,lambda,mu,n,i) {
	p=1
	while(i>0) {
		p=p*laplacefi(s,lambda,mu,n,i)
		i=i-1
	}
	return(p/s)
}