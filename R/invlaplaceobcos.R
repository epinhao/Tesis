invlaplacefcos <- function(v,lambda,mu,theta,i,j,a,b) {
	ft=1/(b-a)*Re(laplacef(0,lambda,mu,theta,i,1))
	ft2=vector()
	k=1
	while(k<1000) {
		ft2[k]=Re(laplacef(complex(real=0, imaginary=1)*k*pi/(b-a),lambda,mu,theta,1,1))*cos(k*pi*v/(b-a))
		k=k+1
	}
	ft=ft+2/(b-a)*sum(ft2)
	return(ft)
}