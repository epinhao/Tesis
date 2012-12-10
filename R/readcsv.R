mydata = read.csv("/Users/Emilio/Documents/workspace/Tesis/distanciaAMX.txt", header = FALSE)
mydatac = mydata[mydata$V1 == "Compra", ]
mydatacm = mydata[mydata$V1 == "CompraMod", ]
mydatav = mydata[mydata$V1 == "Venta", ]
mydatavm = mydata[mydata$V1 == "VentaMod", ]
distancec = round(mydatac[,3]-mydatac[,4],2)
distancecm = round(mydatacm[,3]-mydatacm[,4],2)
distancev = round(mydatav[,3]-mydatav[,4],2)
distancevm = round(mydatavm[,3]-mydatavm[,4],2)
distancec0 = distancec[distancec > -1]
distancecm0 = distancecm[distancecm > -1]
distancev0 = distancev[distancev > -1]
distancevm0 = distancevm[distancevm > -1]
par( mfrow = c( 2, 2 ) )
hist(distancec0[distancec0<1],100)
hist(distancecm0[distancecm0<1],100)
hist(distancev0[distancev0<1],100)
hist(distancevm0[distancevm0<1],100)


#distance = distance[distance > 0]
#hist(distance[distance < 10])
#alpha1 = power.law.fit(distance[distance<10]+1, xmin = 1)
#alpha2 = power.law.fit(distance[distance<10]+0.5, xmin = 0.5)
#qpareto=function(u, a=0.5, b=1) b/(1-u)^(1/a)
#rpareto=function(n, a=0.5, b=1) qpareto(runif(n),a,b)
#sim1 = rpareto(1000,coef(alpha1),1)
#sim2 = rpareto(1000,coef(alpha2),0.5)
#sim1 = sim1 - 1
#sim2 = sim2 - 0.5
#qqplot(sim1[sim1<5],sim2[sim2<5])
#abline(0,1)