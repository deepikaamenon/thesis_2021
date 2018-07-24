
#Align Sla1/Abp1 (DV) to Sla1 (SC), to get Abp1-mC average

source("/Users/deepikaa/Desktop/data_desktop/Doc/align_tracks.R")

##single channel data that the dc data will be aligned to
##what is in Rdata?
path.abp1="/Volumes/MarkoKaksonenLab/Deepika/data_desktop/Tracking/SC/diploid/Rvs167/2017_07_07/529x551/motile.Rdata"
path.target=c()
output.label="rvsgfp1x"
##folder where the dc tracks are that need to be aligned
input.folder="/Volumes/MarkoKaksonenLab/Deepika/data_desktop/Tracking/DC/diploids/2018_02_21/559x521/tracks/"
dt=0.2715

perform_alignment(path.ref=path.abp1,path.target=path.target,inputfolder=input.folder,dt=dt,outputlabel=output.label,W1_fimax=FALSE,W2_fimax=FALSE,file_patternW1="*w2.txt$",file_patternW2="*w1.txt$")
