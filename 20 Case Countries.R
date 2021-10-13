library(dplyr)
library(ggplot2)
library(scales)

world_covid <-read.csv("c:\\Users\\LENOVO\\Downloads\\Data R\\world_covid.csv",header = TRUE,sep=";")

View(world_covid)
world_covid <-read.csv("c:\\Users\\LENOVO\\Downloads\\Data R\\world_covid.csv",header = TRUE, sep=";")
View(world_covid)

world_covid <-read.csv("c:\\Users\\LENOVO\\Downloads\\Data R\\world_covid.csv",header= TRUE, stringsAsFactors = FALSE)
View(world_covid)
str(world_covid)
head(world_covid)
head(world_covid, n= 10)
vis1 <-world_covid%>% select(country,fatality_rate)
vis1
ggplot(data=vis1,mapping=aes(x= country, y=fatality_rate)) +geom_bar(stat="identity")
ggplot(data=vis1,mapping=aes(x= country, y=fatality_rate))+ geom_bar(stat="identity") + theme(axis.text.x= element_text(angle=90))
ggplot(data=vis1,mapping =aes(x= reorder(country, fatality_rate), y=fatality_rate)) +geom_bar(stat="identity")+ theme(axis.text=element_text(angle=90))
topn <-vis1 %>% arrange(desc(fatality_rate)) %>% head(n =20)
topn
ggplot(data=topn,mapping=aes(x = reorder(country, fatality_rate), y=fatality_rate))+ geom_bar(stat="identity") + theme(axis.text.x= element_text(angle=90))
ggplot(data=topn,mapping=aes(x = reorder(country, fatality_rate), y=fatality_rate)) +geom_bar(stat="identity") + theme(axis.text.x= element_text(angle=90))+ labs(title="Top Fatality Rate Countries", x="Country", y="Fatality Rate")
ggplot(data=topn,mapping=aes(x = reorder(country, fatality_rate), y=fatality_rate)) +geom_bar(stat="identity") + theme(axis.text.x= element_text(angle=90))+ labs(title="Top Fatality Rate Countries", x="Country", y="Fatality Rate")+ scale_y_continuous(labels = scales::percent_format(accuracy = 1))
ggplot(data=topn,mapping=aes(x = reorder(country, fatality_rate), y=fatality_rate)) +geom_bar(stat="identity") + theme(axis.text.x= element_text(angle=90))+ labs(title="Top Fatality Rate Countries", x="Country", y="Fatality Rate")+ scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +coord_flip()
ggplot(data=topn,mapping=aes(x = reorder(country, fatality_rate), y=fatality_rate)) +geom_bar(stat="identity") + theme(axis.text.x= element_text(angle=90))+ labs(title="Top Fatality Rate Countries", x="Country", y="Fatality Rate")+ scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +coord_flip()
ggplot(data=topn,mapping=aes(x = reorder(country, fatality_rate), y=fatality_rate)) +geom_bar(stat="identity") + labs(title="Top Fatality Rate Countries", x="Country", y="Fatality Rate")+ scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +coord_flip()
ggplot(data=topn,mapping=aes(x = reorder(country, fatality_rate), y=fatality_rate)) +geom_bar(stat="identity") + labs(title="Top Fatality Rate Countries", x="Country", y="Fatality Rate")+ scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +coord_flip()+theme_minimal()

ggplot(data=topn,mapping=aes(x = reorder(country, fatality_rate), y=fatality_rate)) +geom_bar(stat="identity", fill="orange", alpha=0.7) + labs(title="Top Fatality Rate Countries", x="Country", y="Fatality Rate")+ scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +coord_flip()+theme_minimal()

ggplot(data=topn,mapping=aes(x = reorder(country, fatality_rate), y=fatality_rate)) +geom_bar(stat="identity", fill="orange", alpha=0.7) + labs(title="Top Fatality rate Countries", x="Country", y="Fatality Rate")+ scale_y_continuous(labels = scales::percent_format(accuracy = 1),limits=c(0,0.30)) +coord_flip()+theme_minimal() + theme(panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank(),panel.grid.minor.x = element_blank())+geom_text(aes(label=paste0(fatality_rate*100,"%")), size= 3, hjust=-0.1) 

# Total Case setiap negara
# Top 20 Bar Chart
top20 <- world_covid%>% arrange(desc(total_cases))%>% head(n=20)
top20

ggplot(data=top20,mapping = aes(x=reorder(country,total_cases), y=total_cases)) + geom_bar(stat="identity",fill="skyblue",alpha=0.7)+ geom_text(aes(label=formatC(total_cases,big.mark = ",", decimal.mark = ".",format="d")), size=3, hjust=-0.1)+coord_flip()+labs(title = "Top 20 Total Case Countries", x="country", y="Total_Cases")+ theme_minimal()+ scale_y_continuous(labels=scales::number_format(big.mark = ","), limits=c(0,2.0*10^6))+theme(panel.grid.major.y = element_blank(),panel.grid.minor.y =element_blank(), panel.grid.minor.x = element_blank())  
