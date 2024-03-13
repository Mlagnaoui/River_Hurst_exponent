libs <- c("pracma","ggplot2","graphicalExtremes","dplyr","plotly","datasets","FlowRegEnvCost","Renext")

installed_libs <- libs %in% row.names(installed.packages()) 

if (any(installed_libs == F)){
  install.packages(libs[!installed_libs],dependencies = T)
}



invisible(lapply(libs, library,character.only=T))


####Nile
str(Nile)
sum(is.na(Nile))#pas de valeurs manquantes
plot(Nile)

df.Nile <- data.frame(t=1:length(Nile),h=as.vector(Nile))


#quelques tracés avec ggplot2

ggplot(data=df.Nile,aes(x=t,y=h))+geom_point(size=3,colour='darkred')+geom_line(linetype='dashed')

ggplot(data=df.Nile,aes(x=t,y=h))+geom_point(size=3,colour='darkred')+geom_line(linetype='dashed')+stat_smooth()

ggplot(data=df.Nile,aes(x=t,y=h))+geom_point(size=3,colour='darkred')+geom_line(linetype='dashed')+stat_smooth(method=lm)

#quelques tracés avec plotly

plot_ly(data=df.Nile,type = 'scatter', mode = 'lines+markers')%>%
  add_trace(x = ~t, y = ~h,line = list(color = '#8FBC8F', dash = 'dot'),marker = list(color='#2F4F4F'))%>%
  layout(showlegend = F)


#calcul Hurst
hurstexp(Nile)

####flowdata
head(flowdata)
dim(flowdata)
sum(is.na(flowdata$Flow))

df.esla <- data.frame(t=1:dim(flowdata)[1],d=flowdata$Flow)

ggplot(data=df.esla,aes(x=t,y=d))+geom_point(size=3,colour='darkred')+geom_line(linetype='dashed')

plot_ly(data=df.esla,type = 'scatter', mode = 'lines+markers')%>%
  add_trace(x = ~t, y = ~d,line = list(color = '#8FBC8F', dash = 'dot'),marker = list(color='#2F4F4F'))%>%
  layout(showlegend = F)

hurstexp(flowdata$Flow)
