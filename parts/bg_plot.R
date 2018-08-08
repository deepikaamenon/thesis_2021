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


d<-read.csv("/Users/kaksonenlab/Desktop/dm/thesis_git/cloned/parts/strain_all_bg.csv")
#

#ggplot(d, aes(x=reorder(strain, rate), y=molecule_num)) + geom_point()+
#p2<- ggplot(d, aes(x=reorder(strain), gene, y=cy)) + geom_point()+
#  geom_errorbar(aes(ymin=cy-total_err, ymax=cy+total_err), width=.2,
#                position=position_dodge(.9)) 
#ggsave("cytoplasm.pdf", width=8,height=6)


p2<- ggplot(d, aes(x=reorder(gene,ploidy), y=cy)) + 
  geom_bar(stat="identity") +
  geom_errorbar(aes(ymin=cy-sem, ymax=cy+sem), width=.2,
                position=position_dodge(.9)) 
ggsave("cytoplasm_sem.pdf", width=8,height=6)

p1<- ggplot(d, aes(x=gene, y=molec)) + 
  geom_bar(stat="identity")+
  geom_errorbar(aes(ymin=molec-mole_err, ymax=molec+mole_err), width=0.2,
                position=position_dodge(.9)) 
ggsave("number_comp.pdf", width=8,height=6)

p3<- ggplot(d, aes(x= cy, y=rate, group=ploidy)) + 
  geom_point()+
  geom_errorbar(aes(ymin=rate-mole_err, ymax=rate+mole_err)) +
  geom_errorbarh(aes(xmin=cy-total_err, xmax=cy+total_err)) +
  geom_text(aes(label=gene),hjust=0, vjust=-1)+
geom_smooth(method = "lm", se = FALSE)
ggsave("rate_cy3.pdf", width=8,height=6)

p3<- ggplot(d, aes(x= cy_scale, y=rate, group=ploidy)) + 
  geom_point()+
  geom_errorbar(aes(ymin=rate-mole_err, ymax=rate+mole_err)) +
  geom_errorbarh(aes(xmin=cy_scale-total_err, xmax=cy_scale+total_err)) +
  geom_smooth(method = "lm", se = FALSE)
geom_text(aes(label=gene),hjust=0, vjust=1)
ggsave("rate_cyscale3.pdf", width=8,height=6)


p4<- ggplot(d, aes(x= decay, y=molec)) + 
  geom_point()+
  geom_errorbar(aes(ymin=molec-mole_err, ymax=molec+mole_err)) +
#  geom_errorbarh(aes(xmin=cy_scale-sem, xmax=cy_scale+sem)) +
  geom_text(aes(label=gene),hjust=0, vjust=1)
ggsave("decay2.pdf", width=8,height=6)

#geom_errorbarh(aes(xmax = resp + se, xmin = resp - se))

p5<- ggplot(d, aes(x= gene_num, y=rate, group=ploidy)) + 
  geom_point()+
  geom_errorbar(aes(ymin=rate-mole_err, ymax=rate+mole_err)) +
#  geom_errorbarh(aes(xmin=cy_scale-total_err, xmax=cy_scale+total_err)) +
 geom_smooth(method = "lm", se = FALSE)
geom_text(aes(label=gene_num),hjust=0, vjust=1)
ggsave("rate_gene.pdf", width=8,height=6)

p6<- ggplot(d, aes(x=sla1_rate, y=molec)) + 
  geom_point()+
  geom_errorbar(aes(ymin=molec-mole_err, ymax=molec+mole_err)) +
  geom_smooth(method = "lm", se = FALSE)
geom_text(aes(label=gene),hjust=0, vjust=1)
ggsave("sla1rate_bar.pdf", width=8,height=6)


p7 <- ggplot(data=d, aes(x=sla1_depth, y=molec)) + 
  geom_point()+
  geom_errorbar(aes(ymin=molec-mole_err, ymax=molec+mole_err)) +
  geom_smooth(method = "lm", se = FALSE)
geom_text(aes(label=gene),hjust=0, vjust=1)
ggsave("sla1depth_bar.pdf", width=8,height=6)
