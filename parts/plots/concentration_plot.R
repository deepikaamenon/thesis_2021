library(ggplot2)
library(RColorBrewer)
library(gdata)
#set.seed(1)
#N=100;
#X=data.frame(C1=rnbinom(N,5,0.1), C2=rnbinom(N,5,0.1),C=rep(0,N)); 
#X$C=X$C1+X$C2;
#p <- ggplot(X,aes(x=C)) + geom_histogram()
#ggsave("trial.png", width=8,height=6)
#mol_nrs_all <- read.table("/Users/deepikaa/Desktop/data_desktop/nuf2/numbers_nuf2_2018_5.csv",header=TRUE, sep=",")
#mol_nrs_all$strain <-factor(mol_nrs_all$strain, 
#                            levels=c("WT","rvs_delsh3","51_del","52_del","5152_del", "bzz_del", "sh3del","WT", "wild type", "167d", "167d161d", "sh3del", "sh3deld","sh3deld161d", "4xdip", "2xdip", "1xdip", "mismatch", "4xRvsdip","2xRvsdip", "1xRvsdip", "3131hap", "4dRvsdhap"))
c <- data.frame(
 year=factor(sample(2010:2014, 400, replace=T)), 
 continent=factor(sample(c("EU", "US", "Asia"), 400, replace=T)),
 gender=factor(sample(c("male", "female"), 400, replace=T)),
 amount=sample(20:5000, 400, replace=T)
)


d<-read.csv("/Users/kaksonenlab/Desktop/dm/thesis_git/cloned/parts/concentrations3.csv")
#d<-data.frame(d)
# strain=factor(d$strain)
# protein=factor(d$protein)
# state=factor(d$state)
# percent=factor(d$percent)



#ggplot(data=d, aes(x=strain, y=percentage)) + geom_bar(stat="identity")

#ggplot(data=d, aes(x=year, y=amount, fill=year)) + geom_bar(stat="identity") # sorts by year, fills one color for each histogram
#ggplot(data=d, aes(x=strain, y=percentage, fill=strain)) + geom_bar(stat="identity") 

#ggplot(data=d, aes(x=year, y=amount, fill=gender)) + geom_bar(stat="identity") # sorts by year, fills with gender in random order
#ggplot(data=d, aes(x=strain, y=percentage, fill=movement)) + geom_bar(stat="identity")

#d <- with(d, d[order(strain, movement),])
#ggplot(data=d, aes(x=strain, y=percentage, fill=movement)) + geom_bar(stat="identity") # ordered by male/femals, plot by year
#ggplot(data=d, aes(x=strain, y=percentage, fill=movement)) + geom_bar(stat="identity")

#d <- with(d, d[order(year, gender, continent),])
#ggplot(data=d, aes(x=continent, y=amount, fill=gender)) + 
#  geom_bar(stat="identity") + 
#  facet_grid(~year)

#d <- with(d, d[order(concentration),])
#ggplot(d, aes(x=scaled_length, y=rate)) + geom_point()+
# ggplot(d, aes(x=reorder(strain,scaled_length), y=rate)) + geom_point()+


p2<- ggplot(d, aes(x=decay, y=molecule_num)) + geom_point()+
  geom_errorbar(aes(ymin=molecule_num-stdev, ymax=molecule_num+stdev), width=.2,
                position=position_dodge(.9)) 
ggsave("decay.pdf", width=8,height=6)
#  geom_errorbar(aes(ymin=len-se, ymax=len+se), width=.1) +
#  geom_line() +
#  geom_point()
#p + theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggplot(d, aes(x=reorder(strain, rate), y=molecule_num)) + geom_point()+
  geom_errorbar(aes(ymin=molecule_num-stdev, ymax=molecule_num+stdev), width=.2,
                position=position_dodge(.9)) 
ggsave("rate.pdf", width=8,height=6)

ggplot(d, aes(x=reorder(strain, time_to_max), y=molecule_num)) + geom_point()+
  geom_errorbar(aes(ymin=molecule_num-stdev, ymax=molecule_num+stdev), width=.2,
                position=position_dodge(.9)) 
ggsave("increase.pdf", width=8,height=6)


#ggplot(d, aes(x=reorder(strain, gene_copywhole), y=rate)) + geom_point()+
  ggplot(d, aes(x= gene_copywhole, y=rate)) + geom_point()+
  
  geom_errorbar(aes(ymin=rate-stdev, ymax=rate+stdev), width=.2,
                position=position_dodge(.9)) 
ggsave("rate_gene.pdf", width=8,height=6)


ggplot(d, aes(x= concentration, y=rate)) + geom_point()+
  
  geom_errorbar(aes(ymin=rate-stdev, ymax=rate+stdev), width=.2,
                position=position_dodge(.9)) 
ggsave("concentration.pdf", width=8,height=6)

######last used
#ggplot(tgc, aes(x=dose, y=len, colour=supp)) + 
#  geom_errorbar(aes(ymin=len-se, ymax=len+se), width=.1) +
#  geom_line() +
#  geom_point()

###d <- with(d, d[order(strain, movement, protein),])

###ggplot(data=d, aes(x=strain, y=percent, fill=movement)) + 
###  geom_bar(stat="identity") +
###  facet_grid(~strain) + 
###  labs(title="Customer Analysis 2010-2014", x="", y="$ Spent / Year", fill="Gender") + 
###  theme(plot.title = element_text(size=25, margin=margin(t=20, b=20)))

