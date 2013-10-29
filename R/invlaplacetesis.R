combin<-function(N,r) factorial(N)/(factorial(r)*factorial(N-r))

l=0.5

# laplacef<-function(s) exp(-s*a)*l/(l+s)
laplacef<-function(s) l/(l+s)
# laplacef<-function(s) -6/s^4+2/s^3+3/s^2

invlaplacef <- function(v,p,n) {
        A=18.4
        k=1
        
        ft1=exp(A/2)/(2*v)*Re(laplacef(A/(2*v)))
        ft2=vector()
        ft2[k]=0
        ft=vector()
        ft2[k+1]=ft2[k]+(-1)^k*Re(laplacef((A+2*k*pi*complex(real=0, imaginary=1))/(2*v)))
        ft[k]=ft1+exp(A/2)/v*ft2[length(ft2)]

        k=2
        ft2[k+1]=ft2[k]+(-1)^k*Re(laplacef((A+2*k*pi*complex(real=0, imaginary=1))/(2*v)))
        ft[k]=ft1+exp(A/2)/v*ft2[length(ft2)]
	  if(p>0) {
        while(abs(ft[k]-ft[k-1])>p) {
		    k=k+1
                ft2[k+1]=ft2[k]+(-1)^k*Re(laplacef((A+2*k*pi*complex(real=0, imaginary=1))/(2*v)))
                ft[k]=ft1+exp(A/2)/v*ft2[length(ft2)]
        }
        } else {
                while(k<n) {
		    k=k+1
                ft2[k+1]=ft2[k]+(-1)^k*Re(laplacef((A+2*k*pi*complex(real=0, imaginary=1))/(2*v)))
                ft[k]=ft1+exp(A/2)/v*ft2[length(ft2)]
        }

	  }
        return(c(ft[k],k))
}

invlaplacefeuler <- function(v) {
        A=18.4
        k=1
        m=11
        n=15
        
        ft1=exp(A/2)/(2*v)*Re(laplacef(A/(2*v)))
        ft2=vector()
        ft2[k]=0
        ft=vector()

        while(k<(m+n+1)) {
                ft2[k+1]=ft2[k]+(-1)^k*Re(laplacef((A+2*k*pi*complex(real=0, imaginary=1))/(2*v)))
                ft[k]=ft1+exp(A/2)/v*ft2[length(ft2)]
                k=k+1
        }

        e=0

        for(k in 0:m) {
                e=e+combin(m,k)*2^(-m)*ft[n+k]
        }
        return(e)
}