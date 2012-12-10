mydata = read.csv("/Users/Emilio/Documents/workspace/Tesis/distanciaprecioAMX.txt", header = FALSE)
data = mydata[mydata$V1 == "Compra", ]
#data = mydata[mydata$V1 == "CompraMod", ]
#data = mydata[mydata$V1 == "Venta", ]
#data = mydata[mydata$V1 == "VentaMod", ]

data=data[,4]-data[,5]
s=length(data)
ind=which(data>0)
data=data[data>0]
s2=length(data)
data=round(data*100,0)
vol=mydata[ind,2]

ind2=which(data<=1000)
data=data[data<=1000]
vol=vol[ind2]