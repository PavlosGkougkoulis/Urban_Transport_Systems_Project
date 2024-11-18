#####Working Directory#####
getwd()
setwd('E:/University/9ο ΕΞΑΜΗΝΟ/ΣΥΣΤΗΜΑΤΑ ΑΣΤΙΚΩΝ ΣΥΓΚΟΙΝΩΝΙΩΝ/ERGASIA EKSAMHNOU/Final_SAS_B_G_G_K/Data/Erwthmatologia/Apanthseis/All_R')



#####Paketa#####
install.packages("stats")
install.packages("ggplot2")
install.packages("car")
install.packages("plotly")
install.packages("lattice")
install.packages("cowplot")
install.packages("lubridate")
install.packages("data.table")
install.packages("readr")
install.packages("readxl")
install.packages("janitor")
install.packages("tidyverse")
install.packages("psych")
install.packages("e1071")
install.packages("plyr")
install.packages("DT")
install.packages("gridExtra")
install.packages("pheatmap")
install.packages("reshape2")
install.packages("corrplot")
library("stats")
library("ggplot2")
library("car")
library("plotly")
library("lattice")
library("cowplot")
library("lubridate")
library("data.table")
library("readr")
library("readxl")
library("janitor")
library("tidyverse")
library("psych")
library("e1071")
library("plyr")
library("DT")
library("gridExtra")
library("pheatmap")
library("reshape2")
library("corrplot")

#####Data#####
metrhsh_vainas <- data.frame(read_xlsx('E:/University/9ο ΕΞΑΜΗΝΟ/ΣΥΣΤΗΜΑΤΑ ΑΣΤΙΚΩΝ ΣΥΓΚΟΙΝΩΝΙΩΝ/ERGASIA EKSAMHNOU/Final_SAS_B_G_G_K/Data/Erwthmatologia/Apanthseis/All_R/Έντυπο_Μέτρησης_στην_Στάση (Απαντήσεις).xlsx'))
metrhsh_zaras <- data.frame(read_xlsx('E:/University/9ο ΕΞΑΜΗΝΟ/ΣΥΣΤΗΜΑΤΑ ΑΣΤΙΚΩΝ ΣΥΓΚΟΙΝΩΝΙΩΝ/ERGASIA EKSAMHNOU/Final_SAS_B_G_G_K/Data/Erwthmatologia/Apanthseis/All_R/Έντυπο_Μέτρησης_στο_Λεωφορείο (Απαντήσεις).xlsx'))
erwt_pavlos <- data.frame(read_xlsx('E:/University/9ο ΕΞΑΜΗΝΟ/ΣΥΣΤΗΜΑΤΑ ΑΣΤΙΚΩΝ ΣΥΓΚΟΙΝΩΝΙΩΝ/ERGASIA EKSAMHNOU/Final_SAS_B_G_G_K/Data/Erwthmatologia/Apanthseis/All_R/Ερωτηματολόγιο_Βαϊνάς_Γκουγκουλής (Απαντήσεις).xlsx'))
erwt_gialouris <- data.frame(read_xlsx('E:/University/9ο ΕΞΑΜΗΝΟ/ΣΥΣΤΗΜΑΤΑ ΑΣΤΙΚΩΝ ΣΥΓΚΟΙΝΩΝΙΩΝ/ERGASIA EKSAMHNOU/Final_SAS_B_G_G_K/Data/Erwthmatologia/Apanthseis/All_R/Ερωτηματολόγιο_Κάλλης_Γιαλούρης (Απαντήσεις).xlsx'))
data_tilematikh1 <- data.frame(read_xlsx('E:/University/9ο ΕΞΑΜΗΝΟ/ΣΥΣΤΗΜΑΤΑ ΑΣΤΙΚΩΝ ΣΥΓΚΟΙΝΩΝΙΩΝ/ERGASIA EKSAMHNOU/Final_SAS_B_G_G_K/Data/Erwthmatologia/Apanthseis/All_R/data_tilematikh1.xlsx'))
data_tilematikh2 <- data.frame(read_xlsx('E:/University/9ο ΕΞΑΜΗΝΟ/ΣΥΣΤΗΜΑΤΑ ΑΣΤΙΚΩΝ ΣΥΓΚΟΙΝΩΝΙΩΝ/ERGASIA EKSAMHNOU/Final_SAS_B_G_G_K/Data/Erwthmatologia/Apanthseis/All_R/data_tilematikh2.xlsx'))
data_tilematikh3 <- data.frame(read_xlsx('E:/University/9ο ΕΞΑΜΗΝΟ/ΣΥΣΤΗΜΑΤΑ ΑΣΤΙΚΩΝ ΣΥΓΚΟΙΝΩΝΙΩΝ/ERGASIA EKSAMHNOU/Final_SAS_B_G_G_K/Data/Erwthmatologia/Apanthseis/All_R/data_tilematikh3.xlsx'))

###h me choosefiles###
##>metrhsh_vainas <- choose.files()
##>metrhsh_zaras <- choose.files()
##>erwt_pavlos <- choose.files()
##>erwt_gialouris <- choose.files()
##>data_tilematikh1 <- choose.files()
##>data_tilematikh2 <- choose.files()
##>data_tilematikh3 <- choose.files()


#####Data Prep#####


####Gia tis metrhseis

###Katharizw ta colnames###
metrhsh_vainas <- clean_names(metrhsh_vainas)
metrhsh_zaras <- clean_names(metrhsh_zaras)

###Ta NAI/OXI se Factors###
metrhsh_vainas[sapply(metrhsh_vainas, is.character)] <- lapply(metrhsh_vainas[sapply(metrhsh_vainas, is.character)], as.factor)
metrhsh_zaras[sapply(metrhsh_zaras, is.character)] <- lapply(metrhsh_zaras[sapply(metrhsh_zaras, is.character)], as.factor)

###Ta line se factor###
metrhsh_vainas$line <- factor(metrhsh_vainas$line)
metrhsh_zaras$line <- factor(metrhsh_zaras$line)

###Drop thn hmeromhnia prin thn wra h opoia einai lathos###
metrhsh_vainas$time_arr <- gsub("1899-12-31 ", "", metrhsh_vainas$time_arr)
metrhsh_vainas$time_dep <- gsub("1899-12-31 ", "", metrhsh_vainas$time_dep)
metrhsh_zaras$time_arr <- gsub("1899-12-31 ", "", metrhsh_zaras$time_arr)
metrhsh_zaras$time_dep <- gsub("1899-12-31 ", "", metrhsh_zaras$time_dep)

###Orizw thn wra me lubridate###
metrhsh_vainas$time_arr <- hms(metrhsh_vainas$time_arr)
metrhsh_vainas$time_dep <- hms(metrhsh_vainas$time_dep)
metrhsh_zaras$time_arr <- hms(metrhsh_zaras$time_arr)
metrhsh_zaras$time_dep <- hms(metrhsh_zaras$time_dep)
metrhsh_vainas$sec_stop <- seconds(metrhsh_vainas$sec_stop)
metrhsh_zaras$sec_stop <- seconds(metrhsh_zaras$sec_stop)


####Gia ta erwthmatologia

###Katharizw ta colnames###
erwt_gialouris <- clean_names(erwt_gialouris)
erwt_pavlos <- clean_names(erwt_pavlos)
names(erwt_gialouris) <- gsub("\r\n", "", names(erwt_gialouris))
names(erwt_pavlos) <- gsub("\r\n", "", names(erwt_pavlos))

###Metatroph metavlhtwn se factors###
erwt_gialouris[sapply(erwt_gialouris, is.character)] <- lapply(erwt_gialouris[sapply(erwt_gialouris, is.character)], as.factor)
erwt_pavlos[sapply(erwt_pavlos, is.character)] <- lapply(erwt_pavlos[sapply(erwt_pavlos, is.character)], as.factor)
erwt_gialouris$move_reas <- factor(erwt_gialouris$move_reas)
erwt_gialouris$bus_use_freq <- factor(erwt_gialouris$bus_use_freq)
erwt_gialouris$reliab_score <- factor(erwt_gialouris$reliab_score)
erwt_gialouris$clean_score <- factor(erwt_gialouris$clean_score)
erwt_gialouris$price_score <- factor(erwt_gialouris$price_score)
erwt_gialouris$time_waited_score <- factor(erwt_gialouris$time_waited_score)
erwt_gialouris$comfort_score <- factor(erwt_gialouris$comfort_score)
erwt_gialouris$safety_score <- factor(erwt_gialouris$safety_score)
erwt_gialouris$distance_to_stop_score <- factor(erwt_gialouris$distance_to_stop_score)
erwt_gialouris$overall_score <- factor(erwt_gialouris$overall_score)
erwt_gialouris$gender <- factor(erwt_gialouris$gender)
erwt_gialouris$age <- factor(erwt_gialouris$age)
erwt_pavlos$move_reas <- factor(erwt_pavlos$move_reas)
erwt_pavlos$bus_use_freq <- factor(erwt_pavlos$bus_use_freq)
erwt_pavlos$reliab_score <- factor(erwt_pavlos$reliab_score)
erwt_pavlos$clean_score <- factor(erwt_pavlos$clean_score)
erwt_pavlos$price_score <- factor(erwt_pavlos$price_score)
erwt_pavlos$time_waited_score <- factor(erwt_pavlos$time_waited_score)
erwt_pavlos$comfort_score <- factor(erwt_pavlos$comfort_score)
erwt_pavlos$safety_score <- factor(erwt_pavlos$safety_score)
erwt_pavlos$distance_to_stop_score <- factor(erwt_pavlos$distance_to_stop_score)
erwt_pavlos$overall_score <- factor(erwt_pavlos$overall_score)
erwt_pavlos$gender <- factor(erwt_pavlos$gender)
erwt_pavlos$age <- factor(erwt_pavlos$age)

###Min_of_travel se lepta me lubridate###
erwt_gialouris$min_of_travel <- minutes(erwt_gialouris$min_of_travel)
erwt_pavlos$min_of_travel <- minutes(erwt_pavlos$min_of_travel)


####Gia to data ths tilematikhs

###Katharizw ta colnames###
data_tilematikh1 <- clean_names(data_tilematikh1)
data_tilematikh2 <- clean_names(data_tilematikh2)
data_tilematikh3 <- clean_names(data_tilematikh3)

###Metatroph metavlhtwn se factors###
data_tilematikh1$stops_line_2 <- factor(data_tilematikh1$stops_line_2)
data_tilematikh2$lines <- factor(data_tilematikh2$lines)
data_tilematikh3$line_p_mella <- factor(data_tilematikh3$line_p_mella)

###Drop thn hmeromhnia prin thn wra h opoia einai lathos###
data_tilematikh1$time_stop_line_2 <- gsub("1899-12-31 ", "", data_tilematikh1$time_stop_line_2)
data_tilematikh3$time_line_p_mella <- gsub("1899-12-31 ", "", data_tilematikh3$time_line_p_mella)

###Orizw thn wra me lubridate###
data_tilematikh3$time_line_p_mella <- hms(data_tilematikh3$time_line_p_mella)
data_tilematikh1$time_stop_line_2 <- hms(data_tilematikh1$time_stop_line_2)

###Ta lepta me lubridate###
data_tilematikh2$time_break <- minutes(data_tilematikh2$time_break)
data_tilematikh2$time_line <- minutes(data_tilematikh2$time_line)

###Drop ta NA###
valid_rows1 <- !is.na(data_tilematikh2$km_lines)
valid_rows2 <- !is.na(data_tilematikh3$time_line_p_mella)


####Checks
head(metrhsh_vainas)
head(metrhsh_zaras)
head(erwt_gialouris)  
head(erwt_pavlos)
head(data_tilematikh1)
head(data_tilematikh2)
head(data_tilematikh3)
tail(metrhsh_vainas)
tail(metrhsh_zaras)
tail(erwt_gialouris)  
tail(erwt_pavlos)
tail(data_tilematikh1)
tail(data_tilematikh2)
tail(data_tilematikh3)
summary(metrhsh_vainas)
summary(metrhsh_zaras)
summary(erwt_gialouris)  
summary(erwt_pavlos)
summary(data_tilematikh1)
summary(data_tilematikh2)
summary(data_tilematikh3)
str(metrhsh_vainas)
str(metrhsh_zaras)
str(erwt_gialouris)  
str(erwt_pavlos)
str(data_tilematikh1)
str(data_tilematikh2)
str(data_tilematikh3)

#####Data Analysis####


####Metrhsh Sthn Stash

###Epivivaseis/Apovivaseis Epivatwn###
##Synolika##
#Epivivaseis
sum(metrhsh_vainas$ppl_boarded)
mean(metrhsh_vainas$ppl_boarded)
range(metrhsh_vainas$ppl_boarded)
median(metrhsh_vainas$ppl_boarded)
max(metrhsh_vainas$ppl_boarded)
min(metrhsh_vainas$ppl_boarded)
#Apovivaseis
sum(metrhsh_vainas$ppl_unboarded)
mean(metrhsh_vainas$ppl_unboarded)
range(metrhsh_vainas$ppl_unboarded)
median(metrhsh_vainas$ppl_unboarded)
max(metrhsh_vainas$ppl_unboarded)
min(metrhsh_vainas$ppl_unboarded)
##Ana grammh##
#Epivivaseis
ppl_boarded_per_line_max_vainas <- aggregate(metrhsh_vainas$ppl_boarded ~ metrhsh_vainas$line, data = metrhsh_vainas, max)
ppl_boarded_per_line_max_vainas
ppl_boarded_per_line_mean_vainas <- aggregate(metrhsh_vainas$ppl_boarded ~ metrhsh_vainas$line, data = metrhsh_vainas, mean)
ppl_boarded_per_line_mean_vainas
ppl_boarded_per_line_sum_vainas <- aggregate(metrhsh_vainas$ppl_boarded ~ metrhsh_vainas$line, data = metrhsh_vainas, sum)
ppl_boarded_per_line_sum_vainas
#Apovivaseis
ppl_unboarded_per_line_max_vainas <- aggregate(metrhsh_vainas$ppl_unboarded ~ metrhsh_vainas$line, data = metrhsh_vainas, max)
ppl_unboarded_per_line_max_vainas
ppl_unboarded_per_line_mean_vainas <- aggregate(metrhsh_vainas$ppl_unboarded ~ metrhsh_vainas$line, data = metrhsh_vainas, mean)
ppl_unboarded_per_line_mean_vainas
ppl_unboarded_per_line_sum_vainas <- aggregate(metrhsh_vainas$ppl_unboarded ~ metrhsh_vainas$line, data = metrhsh_vainas, sum)
ppl_unboarded_per_line_sum_vainas
###Kathysterhseis###
mean_sec_stop_vainas <- aggregate(metrhsh_vainas$sec_stop ~ metrhsh_vainas$line, data = metrhsh_vainas, mean)
mean_sec_stop_vainas
max_sec_stop_vainas <- aggregate(metrhsh_vainas$sec_stop ~ metrhsh_vainas$line, data = metrhsh_vainas, max)
max_sec_stop_vainas
sum_sec_stop_vainas <-aggregate(metrhsh_vainas$sec_stop ~ metrhsh_vainas$line, data = metrhsh_vainas, sum)
sum_sec_stop_vainas

###tparamonhs gia kathe grammh me paradoxh oti tdoor = 3 sec###
t_paramonhs_vainas <- metrhsh_vainas$sec_stop + 3
t_paramonhs_vainas
mean_t_paramonhs_vainas <- aggregate(t_paramonhs_vainas ~ metrhsh_vainas$line, data = metrhsh_vainas, mean)
mean_t_paramonhs_vainas
max_t_paramonhs_vainas <- aggregate(t_paramonhs_vainas ~ metrhsh_vainas$line, data = metrhsh_vainas, max)
max_t_paramonhs_vainas
sum_t_paramonhs_vainas <-aggregate(t_paramonhs_vainas ~ metrhsh_vainas$line, data = metrhsh_vainas, sum)
sum_t_paramonhs_vainas

###skip stashs ana grammh###
skips_data_vainas <- subset(metrhsh_vainas, metrhsh_vainas$ppl_boarded == 0 & metrhsh_vainas$ppl_unboarded == 0 & metrhsh_vainas$sec_stop == 0)
skips_data_vainas
skips_data_vainas_c <- skips_data_vainas %>%
select(ppl_boarded, ppl_unboarded, sec_stop, line)
skips_data_vainas_c
skips_counts_vainas <- table(skips_data_vainas_c$line)
skips_counts_vainas

###Poia grammh prosilthe perissotero###
line_count_vainas <- table(metrhsh_vainas$line)
line_count_vainas

###Syxnothta grammwn f ( gia tis 2 wres aixmhs )###
time_diff_vainas <- seconds((last(metrhsh_vainas$time_arr)) - (first(metrhsh_vainas$time_arr)))
time_diff_vainas <- as.numeric(time_diff_vainas/60)
time_diff_vainas
syxnothta_vainas <- 60*(line_count_vainas/time_diff_vainas)
syxnothta_vainas

#Xronoapostash grammwn ( gia tis 2 wres aixmhs )###
xronoapostash_vainas <- 60/syxnothta_vainas
xronoapostash_vainas

###Arithmos leoforeiwn ( gia tis 2 wres aixmhs )###
bus_count_vainas <- table(metrhsh_vainas$line)
bus_count_vainas

###Kathisterhsh Grammwn se sxesh me tis pragmatikes###
time_arr_vainas_filter <- metrhsh_vainas$time_arr[valid_rows2]
time_line_p_mella_filter <- data_tilematikh3$time_line_p_mella[valid_rows2]
line_filter_tilematikh_vainas <- metrhsh_vainas$line[valid_rows2]
time_arr_vainas_period <- as.period(hms(time_arr_vainas_filter))
time_line_p_mella_period <- as.period(hms(time_line_p_mella_filter))
time_diff_tilematikh_vainas <- as.numeric((time_arr_vainas_period - time_line_p_mella_period) / minutes(1))
time_diff_tilematikh_vainas
time_diff_tilematikh_df_vainas <- data.frame(line = line_filter_tilematikh_vainas, time_diff = time_diff_tilematikh_vainas, asb_time_diff = abs(time_diff_tilematikh_vainas))
time_diff_tilematikh_df_vainas

###Mesh taxythta kathe grammhs###
data_tilematikh2$time_line_sec <- as.numeric(data_tilematikh2$time_line)
data_tilematikh2$mesh_u <- ((data_tilematikh2$km_line*1000)/data_tilematikh2$time_line_sec)
data_tilematikh2$mesh_u <- data_tilematikh2$mesh_u*(3600/1000)
data_tilematikh2$mesh_u

###Synolikh Apostash kathe grammhs###
km_per_line <- aggregate(2*(data_tilematikh2$km_lines) ~ data_tilematikh2$lines, data = data_tilematikh2, sum)
km_per_line

###tkyklou kathe grammhs###
data_tilematikh2$t_kyklou_grammhs <- (2*(as.numeric(data_tilematikh2$time_break))/60) + (2*as.numeric(data_tilematikh2$time_line)/60)
t_kyklou_ana_grammh <- aggregate(data_tilematikh2$t_kyklou_grammhs ~ data_tilematikh2$lines, data = data_tilematikh2, sum)
t_kyklou_ana_grammh 


###Arithmos leoforeiwn mesw tou tcycle/h ( gia tis 2 wres aixmhs )###
data_tilematikh2$xronoapostash <- xronoapostash_vainas
data_tilematikh2$bus_count_tilematikh <- ceiling((data_tilematikh2$t_kyklou_grammhs/data_tilematikh2$xronoapostash))
bus_count_me_tkyklou <- aggregate(data_tilematikh2$bus_count_tilematikh ~ data_tilematikh2$lines, data = data_tilematikh2, sum)
bus_count_me_tkyklou

###tepanaforas kathe grammhs sthn metrhsh kai officially###
data_tilematikh2$time_break <- (as.numeric(data_tilematikh2$time_break))/60
t_epanaforas_grammhs <- aggregate(2*(data_tilematikh2$time_break) ~ data_tilematikh2$lines, data = data_tilematikh2, sum)
t_epanaforas_grammhs


####Metrhsh Sto Leoforeio

###Epivivaseis/Apovivaseis Epivatwn###
##Synolika##
#Epivivaseis
sum(metrhsh_zaras$ppl_boarded)
mean(metrhsh_zaras$ppl_boarded)
range(metrhsh_zaras$ppl_boarded)
median(metrhsh_zaras$ppl_boarded)
max(metrhsh_zaras$ppl_boarded)
min(metrhsh_zaras$ppl_boarded)
#Apovivaseis
sum(metrhsh_zaras$ppl_unboarded)
mean(metrhsh_zaras$ppl_unboarded)
range(metrhsh_zaras$ppl_unboarded)
median(metrhsh_zaras$ppl_unboarded)
max(metrhsh_zaras$ppl_unboarded)
min(metrhsh_zaras$ppl_unboarded)
##Ana stash##
#Epivivaseis
ppl_boarded_per_stop_max_zaras <- aggregate(metrhsh_zaras$ppl_boarded ~ metrhsh_zaras$stop, data = metrhsh_zaras, max)
ppl_boarded_per_stop_max_zaras
ppl_boarded_per_stop_mean_zaras <- aggregate(metrhsh_zaras$ppl_boarded ~ metrhsh_zaras$stop, data = metrhsh_zaras, mean)
ppl_boarded_per_stop_mean_zaras
ppl_boarded_per_stop_sum_zaras <- aggregate(metrhsh_zaras$ppl_boarded ~ metrhsh_zaras$stop, data = metrhsh_zaras, sum)
ppl_boarded_per_stop_sum_zaras
#Apovivaseis
ppl_unboarded_per_stop_max_zaras <- aggregate(metrhsh_zaras$ppl_unboarded ~ metrhsh_zaras$stop, data = metrhsh_zaras, max)
ppl_unboarded_per_stop_max_zaras
ppl_unboarded_per_stop_mean_zaras <- aggregate(metrhsh_zaras$ppl_unboarded ~ metrhsh_zaras$stop, data = metrhsh_zaras, mean)
ppl_unboarded_per_stop_mean_zaras
ppl_unboarded_per_stop_sum_zaras <- aggregate(metrhsh_zaras$ppl_unboarded ~ metrhsh_zaras$stop, data = metrhsh_zaras, sum)
ppl_unboarded_per_stop_sum_zaras

###Kathysterhseis###
valid_rows4 <- !is.na(metrhsh_zaras$sec_stop)
mean_sec_stop_zaras <- aggregate(metrhsh_zaras$sec_stop[valid_rows4] ~ metrhsh_zaras$stop[valid_rows4], data = metrhsh_zaras, mean)
mean_sec_stop_zaras
max_sec_stop_zaras <- aggregate(metrhsh_zaras$sec_stop[valid_rows4] ~ metrhsh_zaras$stop[valid_rows4], data = metrhsh_zaras, max)
max_sec_stop_zaras
sum_sec_stop_zaras <-aggregate(metrhsh_zaras$sec_stop[valid_rows4] ~ metrhsh_zaras$stop[valid_rows4], data = metrhsh_zaras, sum)
sum_sec_stop_zaras

###tparamonhs gia kathe stop me paradoxh oti tdoor = 3 sec###
t_paramonhs_zaras <- metrhsh_zaras$sec_stop[valid_rows4] + 3
t_paramonhs_zaras
mean_t_paramonhs_zaras <- aggregate(t_paramonhs_zaras ~ metrhsh_zaras$stop[valid_rows4], data = metrhsh_zaras, mean)
mean_t_paramonhs_zaras
max_t_paramonhs_zaras <- aggregate(t_paramonhs_zaras ~ metrhsh_zaras$stop[valid_rows4], data = metrhsh_zaras, max)
max_t_paramonhs_zaras
sum_t_paramonhs_zaras <-aggregate(t_paramonhs_zaras ~ metrhsh_zaras$stop[valid_rows4], data = metrhsh_zaras, sum)
sum_t_paramonhs_zaras

###skips stashs###
skips_data_zaras <- subset(metrhsh_zaras, metrhsh_zaras$ppl_boarded == 0 & metrhsh_zaras$ppl_unboarded == 0 & metrhsh_zaras$sec_stop == 0)
skips_data_zaras
skips_data_zaras_c <- skips_data_zaras %>%
  select(ppl_boarded, ppl_unboarded, sec_stop, stop)
skips_data_zaras_c
skips_counts_zaras <- table(skips_data_zaras_c$stop)
skips_counts_zaras

###Kathisterhsh Stasewn se sxesh me tis pragmatikes###
time_arr_zaras_period <- as.period(hms(metrhsh_zaras$time_arr[1:59]))
time_stop_line_2_period <- as.period(hms(data_tilematikh1$time_stop_line_2))
time_diff_tilematikh_zaras <- as.numeric((time_arr_zaras_period - time_stop_line_2_period) / minutes(1))
time_diff_tilematikh_zaras
time_diff_tilematikh_df_zaras <- data.frame(stop = data_tilematikh1$stops_line_2, time_diff = time_diff_tilematikh_zaras, asb_time_diff = abs(time_diff_tilematikh_zaras))
valid_rows3 <- !is.na(time_diff_tilematikh_df_zaras$time_diff)
time_diff_tilematikh_df_zaras_c <- time_diff_tilematikh_df_zaras$time_diff[valid_rows3]
time_diff_tilematikh_df_zaras_c
time_diff_staseis_zaras <- aggregate(time_diff_tilematikh_df_zaras$asb_time_diff ~ time_diff_tilematikh_df_zaras$stop, data = time_diff_tilematikh_df_zaras, max)
time_diff_staseis_zaras

###Mesh taxythta grammhs 2###
na_pos_time_arr <- which(is.na(metrhsh_zaras$time_arr))
na_pos_time_arr
sec_na_pos_time_arr <- na_pos_time_arr[2]
time_arr_arxh <- as.numeric(metrhsh_zaras$time_arr[na_pos_time_arr[1] + 1])
time_arr_telos <- as.numeric(metrhsh_zaras$time_arr[sec_na_pos_time_arr - 1])
time_synolika_grammhs_2 <- ((time_arr_telos - time_arr_arxh)/3600)
time_synolika_grammhs_2
mesh_u_grammh_2 <- (km_per_line[2,2]/2)/time_synolika_grammhs_2
mesh_u_grammh_2

###Synolikh Apostash grammhs 2###
km_grammhs_2 <- km_per_line[2,]
km_grammhs_2

###tkyklou grammhs 2 kai sygkrish me data apthn thlematikh###
time_arr_afet_1 <- as.numeric(metrhsh_zaras$time_arr[na_pos_time_arr[1] + 1])
time_arr_afet_2 <- as.numeric(metrhsh_zaras$time_arr[na_pos_time_arr[3] - 1])
tkyklou_line_2 <- ((time_arr_afet_2 - time_arr_afet_1)/60)
tkyklou_line_2
t_diff_line_2 <- abs(data_tilematikh2$t_kyklou_grammhs[2] - tkyklou_line_2)
t_diff_line_2

###tepanaforas grammhs 2###
na_pos_time_dep <- which(is.na(metrhsh_zaras$time_dep))
na_pos_time_dep 
t_ep_1 <- as.numeric(metrhsh_zaras$time_arr[na_pos_time_arr[3] - 1])
t_ep_2 <- as.numeric(metrhsh_zaras$time_dep[na_pos_time_dep[2] + 1])
tepanaforas_grammhs_2 <- 2*(((t_ep_2 - t_ep_1)/60))
tepanaforas_grammhs_2

####Erwthmatologio sthn stash

###Descriptive statistics###
Desc_Stats_Apotelesmata_p <- data.frame()
desc_stas_p <- function(x, column_name1){
  if (is.factor(x)) {
    x <- as.numeric(as.character(x))  
  }
  if (!is.numeric(x)) {
    stop(paste("The variable for", column_name1, "is not numeric."))
  } 
  Mean_x_p = mean(x, na.rm = T)
  std_x_p = sd(x, na.rm = T)
  N_p = length(x)
  Max_x_p = max(x)
  Min_x_p = min(x)
  mode_p = as.numeric(names(sort(table(x), decreasing = T)[1]))
  median_p = median(x)
  range_p = max(x) - min(x)
  variance_p = var(x)
  IQR_p = IQR(x)
  CV_p = (sd(x))/(mean(x)) *100
  Q1_p = quantile(x, 0.25)
  Q2_p = median(x)
  Q3_p = quantile(x, 0.25)
  skewness_p = skewness(x)
  kurtosis_p = kurtosis(x)
  p10_p = quantile(x, 0.10, na.rm = T)
  p25_p = quantile(x, 0.25, na.rm = T)
  p50_p = median(x, na.rm = T)
  p75_p = quantile(x, 0.75, na.rm = T)
  p90_p = quantile(x, 0.90, na.rm = T)
  apotelesmata_p <- data.frame(
    Statistic_p = c("Mean", "Standard Deviation", "N", "Mode", "Median", 
                  "Range", "Variance", "IQR","Max","Min", "Coefficient of Variation", 
                  "Q1", "Q2", "Q3", "Skewness", "Kurtosis", "P10", 
                  "P25", "P50", "P75", "P90"),
    Value_p = c(Mean_x_p, std_x_p, N_p, mode_p, median_p, range_p, 
              variance_p, IQR_p, Max_x_p, Min_x_p, CV_p, Q1_p, Q2_p, Q3_p, skewness_p, 
              kurtosis_p, p10_p, p25_p, p50_p, p75_p, p90_p)
  )
  colnames(apotelesmata_p)[2] <- column_name1
  if (nrow(Desc_Stats_Apotelesmata_p) == 0) {
    Desc_Stats_Apotelesmata_p <<- apotelesmata_p
  } else {
    Desc_Stats_Apotelesmata_p <<- merge(Desc_Stats_Apotelesmata_p, apotelesmata_p, by = "Statistic_p", all = T)
  }
}
desc_stas_p(erwt_pavlos$move_reas, "Move Reason")
desc_stas_p(erwt_pavlos$safety_score, "Safety Score")
desc_stas_p(erwt_pavlos$bus_use_freq, "Bus Use Frequency")
desc_stas_p(erwt_pavlos$reliab_score, "Reliability Score")
desc_stas_p(erwt_pavlos$clean_score, "Cleanliness Score")
desc_stas_p(erwt_pavlos$price_score, "Ticket Price Score")
desc_stas_p(erwt_pavlos$time_waited_score, "Time Waited Score")
desc_stas_p(erwt_pavlos$comfort_score, "Comfort Score")
desc_stas_p(erwt_pavlos$distance_to_stop_score, "Distance to Stop Score")
desc_stas_p(erwt_pavlos$overall_score, "Overall Score")
Desc_Stats_Apotelesmata_p

###Syxnothtes Apanthsewn###
Syxnothtes_p <- function(x) {
  prop.table(table(x)) * 100
}
Move_Reason_p <- Syxnothtes_p(erwt_pavlos$move_reas)
Safety_Score_p <- Syxnothtes_p(erwt_pavlos$safety_score)
Bus_use_Frequency_p <- Syxnothtes_p(erwt_pavlos$bus_use_freq)
Reliability_Score_p <- Syxnothtes_p(erwt_pavlos$reliab_score)
Cleanliness_Score_p <- Syxnothtes_p(erwt_pavlos$clean_score)
Ticket_Price_Score_p <- Syxnothtes_p(erwt_pavlos$price_score)
Time_Waited_Score_p <- Syxnothtes_p(erwt_pavlos$time_waited_score)
Comfort_Score_p <- Syxnothtes_p(erwt_pavlos$comfort_score)
Distance_to_Stop_Score_p <- Syxnothtes_p(erwt_pavlos$distance_to_stop_score)
Overall_Score_p <- Syxnothtes_p(erwt_pavlos$overall_score)
Gender_p <- Syxnothtes_p(as.numeric(erwt_pavlos$gender))
Age_p <- Syxnothtes_p(erwt_pavlos$age)
categories <- 1:9
Move_Reason_p <- setNames(rep(0, length(categories)), categories)
Move_Reason_p[names(Move_Reason_p) %in% names(Syxnothtes_p(erwt_pavlos$move_reas))] <- Syxnothtes_p(erwt_pavlos$move_reas)
Safety_Score_p <- setNames(rep(0, length(categories)), categories)
Safety_Score_p[names(Safety_Score_p) %in% names(Syxnothtes_p(erwt_pavlos$safety_score))] <- Syxnothtes_p(erwt_pavlos$safety_score)
Bus_use_Frequency_p <- setNames(rep(0, length(categories)), categories)
Bus_use_Frequency_p[names(Bus_use_Frequency_p) %in% names(Syxnothtes_p(erwt_pavlos$bus_use_freq))] <- Syxnothtes_p(erwt_pavlos$bus_use_freq)
Reliability_Score_p <- setNames(rep(0, length(categories)), categories)
Reliability_Score_p[names(Reliability_Score_p) %in% names(Syxnothtes_p(erwt_pavlos$reliab_score))] <- Syxnothtes_p(erwt_pavlos$reliab_score)
Cleanliness_Score_p <- setNames(rep(0, length(categories)), categories)
Cleanliness_Score_p[names(Cleanliness_Score_p) %in% names(Syxnothtes_p(erwt_pavlos$clean_score))] <- Syxnothtes_p(erwt_pavlos$clean_score)
Ticket_Price_Score_p <- setNames(rep(0, length(categories)), categories)
Ticket_Price_Score_p[names(Ticket_Price_Score_p) %in% names(Syxnothtes_p(erwt_pavlos$price_score))] <- Syxnothtes_p(erwt_pavlos$price_score)
Time_Waited_Score_p <- setNames(rep(0, length(categories)), categories)
Time_Waited_Score_p[names(Time_Waited_Score_p) %in% names(Syxnothtes_p(erwt_pavlos$time_waited_score))] <- Syxnothtes_p(erwt_pavlos$time_waited_score)
Comfort_Score_p <- setNames(rep(0, length(categories)), categories)
Comfort_Score_p[names(Comfort_Score_p) %in% names(Syxnothtes_p(erwt_pavlos$comfort_score))] <- Syxnothtes_p(erwt_pavlos$comfort_score)
Distance_to_Stop_Score_p <- setNames(rep(0, length(categories)), categories)
Distance_to_Stop_Score_p[names(Distance_to_Stop_Score_p) %in% names(Syxnothtes_p(erwt_pavlos$distance_to_stop_score))] <- Syxnothtes_p(erwt_pavlos$distance_to_stop_score)
Overall_Score_p <- setNames(rep(0, length(categories)), categories)
Overall_Score_p[names(Overall_Score_p) %in% names(Syxnothtes_p(erwt_pavlos$overall_score))] <- Syxnothtes_p(erwt_pavlos$overall_score)
Gender_p <- setNames(rep(0, length(categories)), categories)
Gender_p[names(Gender_p) %in% names(Syxnothtes_p(as.numeric(erwt_pavlos$gender)))] <- Syxnothtes_p(as.numeric(erwt_pavlos$gender))
Age_p <- setNames(rep(0, length(categories)), categories)
Age_p[names(Age_p) %in% names(Syxnothtes_p(erwt_pavlos$age))] <- Syxnothtes_p(erwt_pavlos$age)
Syxnothtes_df_p <- data.frame(Move_Reason_p, Safety_Score_p, Bus_use_Frequency_p, Reliability_Score_p, Cleanliness_Score_p, Ticket_Price_Score_p, Time_Waited_Score_p, Comfort_Score_p, Distance_to_Stop_Score_p, Overall_Score_p, Gender_p, Age_p)
Syxnothtes_df_p

###Pososto apanthsewn###
nrow(erwt_pavlos)
pos_apant_p <- 100*((nrow(erwt_pavlos))/35)
pos_apant_p

###Synithesteros skopos metakinhshs###
skopos_metak_p <- prop.table(table(erwt_pavlos$move_reas))*100
skopos_metak_p

###Xronos metakinhshs###
mesos_xronos_metak_p <- mean((as.numeric(erwt_pavlos$min_of_travel))/60)
mesos_xronos_metak_p
max_xronos_metak_p <- max((as.numeric(erwt_pavlos$min_of_travel))/60)
max_xronos_metak_p
min_xronos_metak_p <- min((as.numeric(erwt_pavlos$min_of_travel))/60)
min_xronos_metak_p

###Mean vs Overall Score gia kathe eggrafh###
erwt_pavlos$reliab_score <- as.numeric(as.character(erwt_pavlos$reliab_score))
erwt_pavlos$clean_score <- as.numeric(as.character(erwt_pavlos$clean_score))
erwt_pavlos$price_score <- as.numeric(as.character(erwt_pavlos$price_score))
erwt_pavlos$time_waited_score <- as.numeric(as.character(erwt_pavlos$time_waited_score))
erwt_pavlos$comfort_score <- as.numeric(as.character(erwt_pavlos$comfort_score))
erwt_pavlos$safety_score <- as.numeric(as.character(erwt_pavlos$safety_score))
erwt_pavlos$distance_to_stop_score <- as.numeric(as.character(erwt_pavlos$distance_to_stop_score))
erwt_pavlos$overall_score <- as.numeric(as.character(erwt_pavlos$overall_score))
Eggrafh_Mean_p <- rowMeans(erwt_pavlos[, c("reliab_score", "clean_score", "price_score", "time_waited_score", "comfort_score", "safety_score", "distance_to_stop_score")], na.rm = TRUE)
Eggrafh_Mean_p
diafora_means_p <- Eggrafh_Mean_p - erwt_pavlos$overall_score
Mean_vs_Overall_Score_p <- data.frame(Eggrafh_Mean_p, erwt_pavlos$overall_score)
Mean_vs_Overall_Score_p$Sygkrish_Means <- diafora_means_p
Mean_vs_Overall_Score_p$Apolyto_Sygkrishs <- abs(diafora_means_p)
Mean_vs_Overall_Score_p

###Overall Mean and Scaled Mean###
Eggrafh_Mean2_p <- rowMeans(erwt_pavlos[, c("reliab_score", "clean_score", "price_score", "time_waited_score", "comfort_score", "safety_score", "distance_to_stop_score","overall_score")], na.rm = TRUE)
Eggrafh_Mean2_p
Overall_Mean_p <- mean(Eggrafh_Mean2_p)
Overall_Mean_p
Scaled_Mean_Percentage_p <- (Overall_Mean_p/5)*100
Scaled_Mean_Percentage_p

###Inferential Statistics###
###dokimh x^2###
columns_x_tetr_p <- c("move_reas", "bus_use_freq","reliab_score", "clean_score", "price_score", "time_waited_score", "comfort_score", "safety_score", "distance_to_stop_score", "overall_score", "gender", "age")
x_tetr_results_p <- data.frame(Variable1_p = character(),Variable2_p = character(),Chi_squared_p = numeric(), Degrees_of_freedom_p = integer(), p_value_p = numeric(), stringsAsFactors = FALSE)
for (i in 1:(length(columns_x_tetr_p) - 1)) {
  for (j in (i + 1):length(columns_x_tetr_p)) {
    col1_p <- columns_x_tetr_p[i]
    col2_p <- columns_x_tetr_p[j]
    contingency_table_p <- table(erwt_pavlos[[col1_p]], erwt_pavlos[[col2_p]])
    if (all(rowSums(contingency_table_p) > 0) && all(colSums(contingency_table_p) > 0)) {
        x_tetr_p <- tryCatch(
        chisq.test(contingency_table_p),
        warning = function(w) chisq.test(contingency_table_p, simulate.p.value = TRUE)
      )
        x_tetr_results_p <- rbind(x_tetr_results_p, data.frame(
        Variable1_p = col1_p,
        Variable2_p = col2_p,
        Chi_squared_p = x_tetr_p$statistic,
        Degrees_of_freedom_p = ifelse(is.null(x_tetr_p$parameter), NA, x_tetr_p$parameter),
        p_value_p = x_tetr_p$p.value
      ))
    } else {
      x_tetr_results_p <- rbind(x_tetr_results_p, data.frame(
        Variable1_p = col1_p,
        Variable2_p = col2_p,
        Chi_squared_p = NA,
        Degrees_of_freedom_p = NA,
        p_value_p = NA
      ))
    }
  }
}
x_tetr_results_p

###t test me gender ###
t_test_results_p <- data.frame(Variable1_t_p = character(),Variable2_t_p = character(),t_value_t_p = numeric(),p_value_t_p = numeric(),stringsAsFactors = F)
numerical_vars_t_p <- c("reliab_score", "clean_score", "price_score", "time_waited_score", "comfort_score", "safety_score", "distance_to_stop_score", "overall_score")
categorical_vars_t_p <- c("move_reas", "bus_use_freq", "gender", "age")
for (var_t_p in numerical_vars_t_p) {
  if (is.factor(erwt_pavlos[[var_t_p]])) {
    erwt_pavlos[[var_t_p]] <- as.numeric(as.character(erwt_pavlos[[var_t_p]]))
  }
}
for (num_var_t_p in numerical_vars_t_p) {
  for (cat_var_t_p in categorical_vars_t_p) {
    if (length(unique(erwt_pavlos[[cat_var_t_p]])) == 2) { 
      t_test_p <- t.test(erwt_pavlos[[num_var_t_p]] ~ erwt_pavlos[[cat_var_t_p]], data = erwt_pavlos)
      t_test_results_p <- rbind(t_test_results_p, data.frame(
        Variable1_t_p = num_var_t_p,
        Variable2_t_p = cat_var_t_p,
        t_value_t_p = t_test_p$statistic,
        p_value_t_p = t_test_p$p.value
      ))
    }
  }
}
t_test_results_p

###Anova Test###
anova_results_p <- data.frame(Variable1_a_p = character(),Variable2_a_p = character(),F_value_a_p = numeric(),p_value_a_p = numeric(),stringsAsFactors = F)
numerical_vars_a_p <- c("reliab_score", "clean_score", "price_score", "time_waited_score", "comfort_score", "safety_score", "distance_to_stop_score", "overall_score")
categorical_vars_a_p <- c("move_reas", "bus_use_freq", "gender", "age")
for (num_var_a_p in numerical_vars_a_p) {
  for (cat_var_a_p in categorical_vars_a_p) {
    if (length(unique(erwt_pavlos[[cat_var_a_p]])) > 2) { 
      anova_test_p <- aov(erwt_pavlos[[num_var_a_p]] ~ as.factor(erwt_pavlos[[cat_var_a_p]]), data = erwt_pavlos)
      anova_summary_p <- summary(anova_test_p)[[1]]
      anova_results_p <- rbind(anova_results_p, data.frame(
        Variable1_a_p = num_var_a_p,
        Variable2_a_p = cat_var_a_p,
        F_value_a_p = anova_summary_p[1, "F value"],
        p_value_a_p = anova_summary_p[1, "Pr(>F)"]
      ))
    }
  }
}
anova_results_p

###linear regression###
linear_regrr_p <- lm(erwt_pavlos$overall_score ~ erwt_pavlos$reliab_score + erwt_pavlos$clean_score + erwt_pavlos$price_score + erwt_pavlos$time_waited_score + erwt_pavlos$comfort_score + erwt_pavlos$safety_score + erwt_pavlos$distance_to_stop_score + erwt_pavlos$move_reas + erwt_pavlos$bus_use_freq, data = erwt_pavlos)
summary(linear_regrr_p)

###logistic regression###
logistic_regrr_p <- glm(erwt_pavlos$gender ~ erwt_pavlos$reliab_score + erwt_pavlos$clean_score + erwt_pavlos$price_score + erwt_pavlos$time_waited_score + erwt_pavlos$comfort_score + erwt_pavlos$safety_score + erwt_pavlos$distance_to_stop_score + erwt_pavlos$overall_score, data = erwt_pavlos, family = "binomial")
summary(logistic_regrr_p)

###HTLM FILES###
datatable(anova_results_p)
datatable(t_test_results_p)
datatable(x_tetr_results_p)
datatable(Syxnothtes_df_p)
datatable(Desc_Stats_Apotelesmata_p)


####Erwthmatologio sto leoforeio

###Descriptive statistics###
Desc_Stats_Apotelesmata_g <- data.frame()
desc_stas_g <- function(x, column_name3){
  if (is.factor(x)) {
    x <- as.numeric(as.character(x))  
  }
  if (!is.numeric(x)) {
    stop(paste("The variable for", column_name3, "is not numeric."))
  } 
  Mean_x_g = mean(x, na.rm = T)
  std_x_g = sd(x, na.rm = T)
  N_g = length(x)
  Max_x_g = max(x)
  Min_x_g = min(x)
  mode_g = as.numeric(names(sort(table(x), decreasing = T)[1]))
  median_g = median(x)
  range_g = max(x) - min(x)
  variance_g = var(x)
  IQR_g = IQR(x)
  CV_g = (sd(x))/(mean(x)) *100
  Q1_g = quantile(x, 0.25)
  Q2_g = median(x)
  Q3_g = quantile(x, 0.25)
  skewness_g = skewness(x)
  kurtosis_g = kurtosis(x)
  p10_g = quantile(x, 0.10, na.rm = T)
  p25_g = quantile(x, 0.25, na.rm = T)
  p50_g = median(x, na.rm = T)
  p75_g = quantile(x, 0.75, na.rm = T)
  p90_g = quantile(x, 0.90, na.rm = T)
  apotelesmata_g <- data.frame(
    Statistic_g = c("Mean", "Standard Deviation", "N", "Mode", "Median", 
                  "Range", "Variance", "IQR","Max","Min", "Coefficient of Variation", 
                  "Q1", "Q2", "Q3", "Skewness", "Kurtosis", "P10", 
                  "P25", "P50", "P75", "P90"),
    Value_g = c(Mean_x_g, std_x_g, N_g, mode_g, median_g, range_g, 
              variance_g, IQR_g, Max_x_g, Min_x_g, CV_g, Q1_g, Q2_g, Q3_g, skewness_g, 
              kurtosis_g, p10_g, p25_g, p50_g, p75_g, p90_g)
  )
  colnames(apotelesmata_g)[2] <- column_name3
  if (nrow(Desc_Stats_Apotelesmata_g) == 0) {
    Desc_Stats_Apotelesmata_g <<- apotelesmata_g
  } else {
    Desc_Stats_Apotelesmata_g <<- merge(Desc_Stats_Apotelesmata_g, apotelesmata_g, by = "Statistic_g", all = T)
  }
}
desc_stas_g(erwt_gialouris$move_reas, "Move Reason")
desc_stas_g(erwt_gialouris$safety_score, "Safety Score")
desc_stas_g(erwt_gialouris$bus_use_freq, "Bus Use Frequency")
desc_stas_g(erwt_gialouris$reliab_score, "Reliability Score")
desc_stas_g(erwt_gialouris$clean_score, "Cleanliness Score")
desc_stas_g(erwt_gialouris$price_score, "Ticket Price Score")
desc_stas_g(erwt_gialouris$time_waited_score, "Time Waited Score")
desc_stas_g(erwt_gialouris$comfort_score, "Comfort Score")
desc_stas_g(erwt_gialouris$distance_to_stop_score, "Distance to Stop Score")
desc_stas_g(erwt_gialouris$overall_score, "Overall Score")
Desc_Stats_Apotelesmata_g

###Syxnothtes Apanthsewn###
Syxnothtes_g <- function(x) {
  prop.table(table(x)) * 100
}
Move_Reason_g <- Syxnothtes_g(erwt_gialouris$move_reas)
Safety_Score_g <- Syxnothtes_g(erwt_gialouris$safety_score)
Bus_use_Frequency_g <- Syxnothtes_g(erwt_gialouris$bus_use_freq)
Reliability_Score_g <- Syxnothtes_g(erwt_gialouris$reliab_score)
Cleanliness_Score_g <- Syxnothtes_g(erwt_gialouris$clean_score)
Ticket_Price_Score_g <- Syxnothtes_g(erwt_gialouris$price_score)
Time_Waited_Score_g <- Syxnothtes_g(erwt_gialouris$time_waited_score)
Comfort_Score_g <- Syxnothtes_g(erwt_gialouris$comfort_score)
Distance_to_Stop_Score_g <- Syxnothtes_g(erwt_gialouris$distance_to_stop_score)
Overall_Score_g <- Syxnothtes_g(erwt_gialouris$overall_score)
Gender_g <- Syxnothtes_g(as.numeric(erwt_gialouris$gender))
Age_g <- Syxnothtes_g(erwt_gialouris$age)
categories <- 1:9
Move_Reason_g <- setNames(rep(0, length(categories)), categories)
Move_Reason_g[names(Move_Reason_g) %in% names(Syxnothtes_g(erwt_gialouris$move_reas))] <- Syxnothtes_g(erwt_gialouris$move_reas)
Safety_Score_g <- setNames(rep(0, length(categories)), categories)
Safety_Score_g[names(Safety_Score_g) %in% names(Syxnothtes_g(erwt_gialouris$safety_score))] <- Syxnothtes_g(erwt_gialouris$safety_score)
Bus_use_Frequency_g <- setNames(rep(0, length(categories)), categories)
Bus_use_Frequency_g[names(Bus_use_Frequency_g) %in% names(Syxnothtes_g(erwt_gialouris$bus_use_freq))] <- Syxnothtes_g(erwt_gialouris$bus_use_freq)
Reliability_Score_g <- setNames(rep(0, length(categories)), categories)
Reliability_Score_g[names(Reliability_Score_g) %in% names(Syxnothtes_g(erwt_gialouris$reliab_score))] <- Syxnothtes_g(erwt_gialouris$reliab_score)
Cleanliness_Score_g <- setNames(rep(0, length(categories)), categories)
Cleanliness_Score_g[names(Cleanliness_Score_g) %in% names(Syxnothtes_g(erwt_gialouris$clean_score))] <- Syxnothtes_g(erwt_gialouris$clean_score)
Ticket_Price_Score_g <- setNames(rep(0, length(categories)), categories)
Ticket_Price_Score_g[names(Ticket_Price_Score_g) %in% names(Syxnothtes_g(erwt_gialouris$price_score))] <- Syxnothtes_g(erwt_gialouris$price_score)
Time_Waited_Score_g <- setNames(rep(0, length(categories)), categories)
Time_Waited_Score_g[names(Time_Waited_Score_g) %in% names(Syxnothtes_g(erwt_gialouris$time_waited_score))] <- Syxnothtes_g(erwt_gialouris$time_waited_score)
Comfort_Score_g <- setNames(rep(0, length(categories)), categories)
Comfort_Score_g[names(Comfort_Score_g) %in% names(Syxnothtes_g(erwt_gialouris$comfort_score))] <- Syxnothtes_g(erwt_gialouris$comfort_score)
Distance_to_Stop_Score_g <- setNames(rep(0, length(categories)), categories)
Distance_to_Stop_Score_g[names(Distance_to_Stop_Score_g) %in% names(Syxnothtes_g(erwt_gialouris$distance_to_stop_score))] <- Syxnothtes_g(erwt_gialouris$distance_to_stop_score)
Overall_Score_g <- setNames(rep(0, length(categories)), categories)
Overall_Score_g[names(Overall_Score_g) %in% names(Syxnothtes_g(erwt_gialouris$overall_score))] <- Syxnothtes_g(erwt_gialouris$overall_score)
Gender_g <- setNames(rep(0, length(categories)), categories)
Gender_g[names(Gender_g) %in% names(Syxnothtes_g(as.numeric(erwt_gialouris$gender)))] <- Syxnothtes_g(as.numeric(erwt_gialouris$gender))
Age_g <- setNames(rep(0, length(categories)), categories)
Age_g[names(Age_g) %in% names(Syxnothtes_g(erwt_gialouris$age))] <- Syxnothtes_g(erwt_gialouris$age)
Syxnothtes_df_g <- data.frame(Move_Reason_g, Safety_Score_g, Bus_use_Frequency_g, Reliability_Score_g, Cleanliness_Score_g, Ticket_Price_Score_g, Time_Waited_Score_g, Comfort_Score_g, Distance_to_Stop_Score_g, Overall_Score_g, Gender_g, Age_g)
Syxnothtes_df_g

###Pososto apanthsewn###
nrow(erwt_gialouris)
pos_apant_g <- 100*((nrow(erwt_pavlos))/40)
pos_apant_g

###Synithesteros skopos metakinhshs###
skopos_metak_g <- prop.table(table(erwt_gialouris$move_reas))*100
skopos_metak_g

###Xronos metakinhshs###
mesos_xronos_metak_g <- mean((as.numeric(erwt_gialouris$min_of_travel))/60)
mesos_xronos_metak_g
max_xronos_metak_g <- max((as.numeric(erwt_gialouris$min_of_travel))/60)
max_xronos_metak_g
min_xronos_metak_g <- min((as.numeric(erwt_gialouris$min_of_travel))/60)
min_xronos_metak_g

###Mean vs Overall Score gia kathe eggrafh###
erwt_gialouris$reliab_score <- as.numeric(as.character(erwt_gialouris$reliab_score))
erwt_gialouris$clean_score <- as.numeric(as.character(erwt_gialouris$clean_score))
erwt_gialouris$price_score <- as.numeric(as.character(erwt_gialouris$price_score))
erwt_gialouris$time_waited_score <- as.numeric(as.character(erwt_gialouris$time_waited_score))
erwt_gialouris$comfort_score <- as.numeric(as.character(erwt_gialouris$comfort_score))
erwt_gialouris$safety_score <- as.numeric(as.character(erwt_gialouris$safety_score))
erwt_gialouris$distance_to_stop_score <- as.numeric(as.character(erwt_gialouris$distance_to_stop_score))
erwt_gialouris$overall_score <- as.numeric(as.character(erwt_gialouris$overall_score))
Eggrafh_Mean_g <- rowMeans(erwt_gialouris[, c("reliab_score", "clean_score", "price_score", "time_waited_score", "comfort_score", "safety_score", "distance_to_stop_score")], na.rm = TRUE)
Eggrafh_Mean_g
diafora_means_g <- Eggrafh_Mean_g - erwt_gialouris$overall_score
Mean_vs_Overall_Score_g <- data.frame(Eggrafh_Mean_g, erwt_gialouris$overall_score)
Mean_vs_Overall_Score_g$Sygkrish_Means <- diafora_means_g
Mean_vs_Overall_Score_g$Apolyto_Sygkrishs <- abs(diafora_means_g)
Mean_vs_Overall_Score_g

###Overall Mean and Scaled Mean###
Eggrafh_Mean2_g <- rowMeans(erwt_gialouris[, c("reliab_score", "clean_score", "price_score", "time_waited_score", "comfort_score", "safety_score", "distance_to_stop_score","overall_score")], na.rm = TRUE)
Eggrafh_Mean2_g
Overall_Mean_g <- mean(Eggrafh_Mean2_g)
Overall_Mean_g
Scaled_Mean_Percentage_g <- (Overall_Mean_g/5)*100
Scaled_Mean_Percentage_g

###Inferential Statistics###
###dokimh x^2###
columns_x_tetr_g <- c("move_reas", "bus_use_freq","reliab_score", "clean_score", "price_score", "time_waited_score", "comfort_score", "safety_score", "distance_to_stop_score", "overall_score", "gender", "age")
x_tetr_results_g <- data.frame(Variable1_g = character(),Variable2_g = character(),Chi_squared_g = numeric(), Degrees_of_freedom_g = integer(), p_value_g = numeric(), stringsAsFactors = FALSE)
for (i in 1:(length(columns_x_tetr_g) - 1)) {
  for (j in (i + 1):length(columns_x_tetr_g)) {
    col1_g <- columns_x_tetr_g[i]
    col2_g <- columns_x_tetr_g[j]
    contingency_table_g <- table(erwt_gialouris[[col1_g]], erwt_gialouris[[col2_g]])
    if (all(rowSums(contingency_table_g) > 0) && all(colSums(contingency_table_g) > 0)) {
      x_tetr_g <- tryCatch(
        chisq.test(contingency_table_g),
        warning = function(w) chisq.test(contingency_table_g, simulate.p.value = TRUE)
      )
      x_tetr_results_g <- rbind(x_tetr_results_g, data.frame(
        Variable1_g = col1_g,
        Variable2_g = col2_g,
        Chi_squared_g = x_tetr_g$statistic,
        Degrees_of_freedom_g = ifelse(is.null(x_tetr_g$parameter), NA, x_tetr_g$parameter),
        p_value_g = x_tetr_g$p.value
      ))
    } else {
      x_tetr_results_g <- rbind(x_tetr_results_g, data.frame(
        Variable1_g = col1_g,
        Variable2_g = col2_g,
        Chi_squared_g = NA,
        Degrees_of_freedom_g = NA,
        p_value_g = NA
      ))
    }
  }
}
x_tetr_results_g

###t test me gender ###
t_test_results_g <- data.frame(Variable1_t_g = character(),Variable2_t_g = character(),t_value_t_g = numeric(),p_value_t_g = numeric(),stringsAsFactors = F)
numerical_vars_t_g <- c("reliab_score", "clean_score", "price_score", "time_waited_score", "comfort_score", "safety_score", "distance_to_stop_score", "overall_score")
categorical_vars_t_g <- c("move_reas", "bus_use_freq", "gender", "age")
for (var_t_g in numerical_vars_t_g) {
  if (is.factor(erwt_gialouris[[var_t_g]])) {
    erwt_gialouris[[var_t_g]] <- as.numeric(as.character(erwt_gialouris[[var_t_g]]))
  }
}
for (num_var_t_g in numerical_vars_t_g) {
  for (cat_var_t_g in categorical_vars_t_g) {
    if (length(unique(erwt_gialouris[[cat_var_t_g]])) == 2) { 
      t_test_g <- t.test(erwt_gialouris[[num_var_t_g]] ~ erwt_gialouris[[cat_var_t_g]], data = erwt_gialouris)
      t_test_results_g <- rbind(t_test_results_g, data.frame(
        Variable1_t_g = num_var_t_g,
        Variable2_t_g = cat_var_t_g,
        t_value_t_g = t_test_g$statistic,
        p_value_t_g = t_test_g$p.value
      ))
    }
  }
}
t_test_results_g

###Anova Test###
anova_results_g <- data.frame(Variable1_a_g = character(),Variable2_a_g = character(),F_value_a_g = numeric(),p_value_a_g = numeric(),stringsAsFactors = F)
numerical_vars_a_g <- c("reliab_score", "clean_score", "price_score", "time_waited_score", "comfort_score", "safety_score", "distance_to_stop_score", "overall_score")
categorical_vars_a_g <- c("move_reas", "bus_use_freq", "gender", "age")
for (num_var_a_g in numerical_vars_a_g) {
  for (cat_var_a_g in categorical_vars_a_g) {
    if (length(unique(erwt_gialouris[[cat_var_a_g]])) > 2) { 
      anova_test_g <- aov(erwt_gialouris[[num_var_a_g]] ~ as.factor(erwt_gialouris[[cat_var_a_g]]), data = erwt_gialouris)
      anova_summary_g <- summary(anova_test_g)[[1]]
      anova_results_g <- rbind(anova_results_g, data.frame(
        Variable1_a_g = num_var_a_g,
        Variable2_a_g = cat_var_a_g,
        F_value_a_g = anova_summary_g[1, "F value"],
        p_value_a_g = anova_summary_g[1, "Pr(>F)"]
      ))
    }
  }
}
anova_results_g

###linear regression###
linear_regrr_g <- lm(erwt_gialouris$overall_score ~ erwt_gialouris$reliab_score + erwt_gialouris$clean_score + erwt_gialouris$price_score + erwt_gialouris$time_waited_score + erwt_gialouris$comfort_score + erwt_gialouris$safety_score + erwt_gialouris$distance_to_stop_score + erwt_gialouris$move_reas + erwt_gialouris$bus_use_freq, data = erwt_gialouris)
summary(linear_regrr_g)

###logistic regression###
logistic_regrr_g <- glm(erwt_gialouris$gender ~ erwt_gialouris$reliab_score + erwt_gialouris$clean_score + erwt_gialouris$price_score + erwt_gialouris$time_waited_score + erwt_gialouris$comfort_score + erwt_gialouris$safety_score + erwt_gialouris$distance_to_stop_score + erwt_gialouris$overall_score, data = erwt_gialouris, family = "binomial")
summary(logistic_regrr_g)

###HTLM FILES###
datatable(anova_results_g)
datatable(t_test_results_g)
datatable(x_tetr_results_g)
datatable(Syxnothtes_df_g)
datatable(Desc_Stats_Apotelesmata_g)


####Plots####


####Metrhsh sthn stash

###Epivivaseis/Apovivaseis Epivatwn###
##Synolika##
total_boarded_v <- sum(metrhsh_vainas$ppl_boarded)
total_unboarded_v <- sum(metrhsh_vainas$ppl_unboarded)
totals_v <- c(total_boarded_v, total_unboarded_v)
labels_v <- c("Total Boarded", "Total Unboarded")
totals_df_v <- data.frame(
  Category = labels_v,
  Total = totals_v)
ggplot(totals_df_v, aes(x = Category, y = Total, fill = Category)) +
  geom_bar(stat = "identity",color = "black") +
  scale_fill_manual(values = c("skyblue", "lightcoral")) +
  labs(x = "Category", y = "Total People", title = "Total Number of People Boarded vs. Unboarded")
mean_boarded_v <- mean(metrhsh_vainas$ppl_boarded)
mean_unboarded_v <- mean(metrhsh_vainas$ppl_unboarded)
means_v <- c(mean_boarded_v, mean_unboarded_v)
labels_mean_v <- c("Average Boarded", "Average Unboarded")
means_df_v <- data.frame(
  Category = labels_mean_v,
  Average = means_v
)
ggplot(means_df_v, aes(x = Category, y = Average, fill = Category)) +
  geom_bar(stat = "identity",color = "black") +
  scale_fill_manual(values = c("skyblue", "lightcoral")) +
  labs(x = "Category", y = "Average People", title = "Average Number of People Boarded vs. Unboarded")
boxplot_df_v <- data.frame(
  Category = rep(c("Boarded", "Unboarded"), each = length(metrhsh_vainas$ppl_boarded)),
  Value = c(metrhsh_vainas$ppl_boarded, metrhsh_vainas$ppl_unboarded)
)
ggplot(boxplot_df_v, aes(x = Category, y = Value, fill = Category)) +
  geom_boxplot(color = "black") +
  scale_fill_manual(values = c("lightblue", "lightpink")) +
  labs(y = "Number of People", title = "Distribution of People Boarded and Unboarded")
##Ana grammh##
#Epivivaseis
colnames(ppl_boarded_per_line_max_vainas) <- c("line_v", "max_ppl_boarded_v")
ggplot(ppl_boarded_per_line_max_vainas, aes(x = factor(line_v), y = max_ppl_boarded_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") + 
  labs(x = "Bus Line", y = "Max People Boarded", title = "Max People Boarded per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
colnames(ppl_boarded_per_line_mean_vainas) <- c("line_v", "mean_ppl_boarded_v")
ggplot(ppl_boarded_per_line_mean_vainas, aes(x = factor(line_v), y = mean_ppl_boarded_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") + 
  labs(x = "Bus Line", y = "Average People Boarded", title = "Average People Boarded per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
colnames(ppl_boarded_per_line_sum_vainas) <- c("line_v", "sum_ppl_boarded_v")
ggplot(ppl_boarded_per_line_sum_vainas, aes(x = factor(line_v), y = sum_ppl_boarded_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") + 
  labs(x = "Bus Line", y = "Sum of People Boarded", title = "Sum of People Boarded per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(metrhsh_vainas, aes(x = factor(line), y = ppl_boarded)) +
  geom_boxplot(fill = "lightcoral",color = "black") +
  labs(x = "Line", y = "People Boarded", title = "Box Plot of People Boarded per Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
#Apovivaseis
colnames(ppl_unboarded_per_line_max_vainas) <- c("line_v", "max_ppl_unboarded_v")
ggplot(ppl_unboarded_per_line_max_vainas, aes(x = factor(line_v), y = max_ppl_unboarded_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +  
  labs(x = "Bus Line", y = "Max People Unboarded", title = "Max People Unboarded per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
colnames(ppl_unboarded_per_line_mean_vainas) <- c("line_v", "mean_ppl_unboarded_v")
ggplot(ppl_unboarded_per_line_mean_vainas, aes(x = factor(line_v), y = mean_ppl_unboarded_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +  
  labs(x = "Bus Line", y = "Average People Unboarded", title = "Average People Unboarded per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
colnames(ppl_unboarded_per_line_sum_vainas) <- c("line_v", "sum_ppl_unboarded_v")
ggplot(ppl_unboarded_per_line_sum_vainas, aes(x = factor(line_v), y = sum_ppl_unboarded_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +  
  labs(x = "Bus Line", y = "Sum of People Unboarded", title = "Sum of People Unboarded per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(metrhsh_vainas, aes(x = factor(line), y = ppl_unboarded)) +
  geom_boxplot(fill = "lightcoral",color = "black") +  
  labs(x = "Line", y = "People Unboarded", title = "Box Plot of People Unboarded per Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Kathysterhseis###
colnames(mean_t_paramonhs_vainas) <- c("line_v", "mean_t_paramonhs_v")
ggplot(mean_t_paramonhs_vainas, aes(x = factor(line_v), y = mean_t_paramonhs_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +  
  labs(x = "Bus Line", y = "Average Time per Stop (s)", title = "Average Time per Stop per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
colnames(max_t_paramonhs_vainas) <- c("line_v", "max_t_paramonhs_v")
ggplot(max_t_paramonhs_vainas, aes(x = factor(line_v), y = max_t_paramonhs_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +  
  labs(x = "Bus Line", y = "Max Time per Stop (s)", title = "Max Time per Stop per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
colnames(sum_t_paramonhs_vainas) <- c("line_v", "sum_t_paramonhs_v")
ggplot(sum_t_paramonhs_vainas, aes(x = factor(line_v), y = sum_t_paramonhs_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +  
  labs(x = "Bus Line", y = "Total Time per Stop (s)", title = "Total Time per Stop per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###skip stashs ana grammh###
skips_counts_df_v <- as.data.frame(skips_counts_vainas)
colnames(skips_counts_df_v) <- c("line_v", "skips_count_v")
ggplot(skips_counts_df_v, aes(x = factor(line_v), y = skips_count_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +
  labs(x = "Bus Line", y = "Number of Skips", title = "Number of Skips per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Poia grammh prosilthe perissotero###
line_count_df_v <- as.data.frame(line_count_vainas)
colnames(line_count_df_v) <- c("line_v", "count_v")
ggplot(line_count_df_v, aes(x = factor(line_v), y = count_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +
  labs(x = "Bus Line", y = "Frequency", title = "Number of Buses") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Syxnothta grammwn f ( gia tis 2 wres aixmhs )###
syxnothta_df_v <- data.frame(line_v = names(syxnothta_vainas), syxnothta_v = as.numeric(syxnothta_vainas))
ggplot(syxnothta_df_v, aes(x = factor(line_v), y = syxnothta_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +
  labs(x = "Bus Line", y = "Frequency (bus/hour)", title = "Frequency per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#Xronoapostash grammwn ( gia tis 2 wres aixmhs )###
xronoapostash_df_v <- data.frame(line_v = names(xronoapostash_vainas), xronoapostash_v = as.numeric(xronoapostash_vainas))
ggplot(xronoapostash_df_v, aes(x = factor(line_v), y = xronoapostash_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +
  labs(x = "Bus Line", y = "Xronoapostash (min)", title = "Time Distance per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Arithmos leoforeiwn ( gia tis 2 wres aixmhs )###
bus_count_df_v <- data.frame(line_v = names(bus_count_vainas), bus_count_v = as.numeric(bus_count_vainas))
ggplot(bus_count_df_v, aes(x = factor(line_v), y = bus_count_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +
  labs(x = "Bus Line", y = "Bus Count", title = "Bus Count per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Kathisterhsh Grammwn se sxesh me tis pragmatikes###
aggr_time_diff_v <- aggregate(asb_time_diff ~ line, data = time_diff_tilematikh_df_vainas, sum)
ggplot(aggr_time_diff_v, aes(x = factor(line), y = asb_time_diff)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +
  labs(x = "Bus Line", y = "Sum of Absolute Time Differences (min)", title = "Sum of Absolute Time Difference per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Mesh taxythta kathe grammhs###
data_tilematikh2 <- data_tilematikh2[!is.na(data_tilematikh2$mesh_u), ]
data_tilematikh2$line_v <- as.factor(data_tilematikh2$lines)
ggplot(data_tilematikh2, aes(x = line_v, y = mesh_u)) +
  geom_col(fill = "lightcoral",color = "black") +
  labs(x = "Bus Line", y = "Average Speed (km/h)", title = "Average Speed per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Synolikh Apostash kathe grammhs###
ggplot(km_per_line, aes(x = `data_tilematikh2$lines`, y = `2 * (data_tilematikh2$km_lines)`)) +
  geom_col(fill = "lightcoral",color = "black") +
  labs(x = "Bus Line", y = "Total Distance (km)", title = "Total Distance per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###tkyklou kathe grammhs###
ggplot(t_kyklou_ana_grammh, aes(x = `data_tilematikh2$lines`, y = `data_tilematikh2$t_kyklou_grammhs`)) +
  geom_col(fill = "lightcoral",color = "black") +
  labs(x = "Bus Line", y = "Total Cycle Time (min)", title = "Total Cycle Time per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Arithmos leoforeiwn mesw tou tcycle/h ( gia tis 2 wres aixmhs )###
colnames(bus_count_me_tkyklou) <- c("line_v", "bus_count_tilematikh_v")
ggplot(bus_count_me_tkyklou, aes(x = factor(line_v), y = bus_count_tilematikh_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +
  labs(x = "Bus Line", y = "Bus Count", title = "Bus Count per Line via Tcycle") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###tepanaforas kathe grammhs sthn metrhsh kai officially###
colnames(t_epanaforas_grammhs) <- c("line_v", "time_break_v")
ggplot(t_epanaforas_grammhs, aes(x = factor(line_v), y = time_break_v)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +
  labs(x = "Bus Line", y = "Time Break (min)", title = "Total Time Break per Bus Line") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Pie plot gia parked car kai bus lane###
parked_car_counts_v <- table(metrhsh_vainas$parked_car)
parked_car_df_v <- data.frame(parked_car_v = names(parked_car_counts_v), count_v = as.vector(parked_car_counts_v))
ggplot(parked_car_df_v, aes(x = "", y = count_v, fill = parked_car_v)) +
  geom_bar(stat = "identity", width = 1,color = "black") +
  coord_polar(theta = "y") +
  labs(title = "Parked Car (ΝΑΙ/ΟΧΙ)", fill = "Parked Car") +
  theme_void() +
  theme(plot.title = element_text(hjust = 0.5))
bus_line_counts_v <- table(metrhsh_vainas$bus_line)
bus_line_df_v <- data.frame(bus_line_v = names(bus_line_counts_v), count_v = as.vector(bus_line_counts_v))
ggplot(bus_line_df_v, aes(x = "", y = count_v, fill = bus_line_v)) +
  geom_bar(stat = "identity", width = 1,color = "black") +
  coord_polar(theta = "y") +
  labs(title = "Bus Lane (ΝΑΙ/ΟΧΙ)", fill = "Bus Lane") +
  theme_void() +
  theme(plot.title = element_text(hjust = 0.5))

###Histogram gia ppl boarded kai unboarded per 1 min###
time_arr_1min_v <- floor(as.numeric(metrhsh_vainas$time_arr) / 60) * 60
metrhsh_vainas$time_arr_1min <- as.POSIXct(time_arr_1min_v, origin = "1970-01-01", tz = "UTC")
ggplot(metrhsh_vainas, aes(x = time_arr_1min, y = ppl_boarded)) +
  geom_bar(stat = "identity", width = 60, color = "black", fill = "skyblue") +
  geom_smooth(method = "loess", se = FALSE, color = "red") +
  labs(title = "People Boarded per 1-Minute Interval", x = "Arrival Time (1-Minute Intervals)", y = "People Boarded") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(metrhsh_vainas, aes(x = time_arr_1min, y = ppl_unboarded)) +
  geom_bar(stat = "identity", width = 60, color = "black", fill = "orange") +
  geom_smooth(method = "loess", se = FALSE, color = "red") +
  labs(title = "People Unboarded per 1-Minute Interval", x = "Arrival Time (1-Minute Intervals)", y = "People Unboarded") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Scatter Plots###
##kathysterhsh/nrow##
time_diff_df_v_p <- data.frame(Index = 1:length(time_diff_tilematikh_df_vainas$asb_time_diff),
                               Time_Difference_v_p = time_diff_tilematikh_df_vainas$asb_time_diff)
ggplot(time_diff_df_v_p, aes(x = Index, y = Time_Difference_v_p)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "loess", se = TRUE, color = "red") +  
  labs(title = "Scatter Plot of Time Differences",
       x = "Index",
       y = "Time Difference (min)") +
  theme_minimal()
##ppl boarded/nrow##
ppl_boarded_df_v_p <- data.frame(Index = 1:length(metrhsh_vainas$ppl_boarded),
                                 People_Boarded_v_p = metrhsh_vainas$ppl_boarded)
ggplot(ppl_boarded_df_v_p, aes(x = Index, y = People_Boarded_v_p)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "loess", se = TRUE, color = "red") +  
  labs(title = "Scatter Plot of People Boarded",
       x = "Index",
       y = "Number of People Boarded") +
  theme_minimal()
##ppl unboarded/nrow##
ppl_unboarded_df_v_p <- data.frame(Index = 1:length(metrhsh_vainas$ppl_unboarded),
                                   People_unboarded_v_p = metrhsh_vainas$ppl_unboarded)
ggplot(ppl_unboarded_df_v_p, aes(x = Index, y = People_unboarded_v_p)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "loess", se = TRUE, color = "red") +  
  labs(title = "Scatter Plot of People Unoarded",
       x = "Index",
       y = "Number of People Boarded") +
  theme_minimal()
##tparamonhs/nrow
as.numeric(t_paramonhs_vainas)
t_paramonhs_df_v_p <- data.frame(Index = 1:length(as.numeric(t_paramonhs_vainas)),
                                 Value_v_p = as.numeric(t_paramonhs_vainas))
ggplot(t_paramonhs_df_v_p, aes(x = Index, y = Value_v_p)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "loess", se = TRUE, color = "red") +  
  labs(title = "Scatter Plot of Time in Stop Values",
       x = "Index",
       y = "Value") +
  theme_minimal()


####Metrhsh sthn sto leoforeio

###Epivivaseis/Apovivaseis Epivatwn###
##Synolika##
total_boarded_g <- sum(metrhsh_zaras$ppl_boarded)
total_unboarded_g <- sum(metrhsh_zaras$ppl_unboarded)
totals_g <- c(total_boarded_g, total_unboarded_g)
labels_g <- c("Total Boarded", "Total Unboarded")
totals_df_g <- data.frame(
  Category = labels_g,
  Total = totals_g)
ggplot(totals_df_g, aes(x = Category, y = Total, fill = Category)) +
  geom_bar(stat = "identity",color = "black") +
  scale_fill_manual(values = c("skyblue", "lightcoral")) +
  labs(x = "Category", y = "Total People", title = "Total Number of People Boarded vs. Unboarded")
mean_boarded_g <- mean(metrhsh_zaras$ppl_boarded)
mean_unboarded_g <- mean(metrhsh_zaras$ppl_unboarded)
means_g <- c(mean_boarded_g, mean_unboarded_g)
labels_mean_g <- c("Average Boarded", "Average Unboarded")
means_df_g <- data.frame(
  Category = labels_mean_g,
  Average = means_g
)
ggplot(means_df_g, aes(x = Category, y = Average, fill = Category)) +
  geom_bar(stat = "identity",color = "black") +
  scale_fill_manual(values = c("skyblue", "lightcoral")) +
  labs(x = "Category", y = "Average People", title = "Average Number of People Boarded vs. Unboarded")
boxplot_df_g <- data.frame(
  Category = rep(c("Boarded", "Unboarded"), each = length(metrhsh_zaras$ppl_boarded)),
  Value = c(metrhsh_zaras$ppl_boarded, metrhsh_zaras$ppl_unboarded)
)
ggplot(boxplot_df_g, aes(x = Category, y = Value, fill = Category)) +
  geom_boxplot(color = "black") +
  scale_fill_manual(values = c("lightblue", "lightpink")) +
  labs(y = "Number of People", title = "Distribution of People Boarded and Unboarded")
##Ana stash##
#Epivivaseis
colnames(ppl_boarded_per_stop_max_zaras) <- c("stop_g", "max_ppl_boarded_g")
ggplot(ppl_boarded_per_stop_max_zaras, aes(x = factor(stop_g), y = max_ppl_boarded_g)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") + 
  labs(x = "Bus Stop", y = "Max People Boarded", title = "Max People Boarded per Stop") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
colnames(ppl_boarded_per_stop_mean_zaras) <- c("stop_g", "mean_ppl_boarded_g")
ggplot(ppl_boarded_per_stop_mean_zaras, aes(x = factor(stop_g), y = mean_ppl_boarded_g)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") + 
  labs(x = "Bus Stop", y = "Average People Boarded", title = "Average People Boarded per Stop") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
colnames(ppl_boarded_per_stop_sum_zaras) <- c("stop_g", "sum_ppl_boarded_g")
ggplot(ppl_boarded_per_stop_sum_zaras, aes(x = factor(stop_g), y = sum_ppl_boarded_g)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") + 
  labs(x = "Bus Stop", y = "Sum of People Boarded", title = "Sum of People Boarded per Stop") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(metrhsh_zaras, aes(x = factor(stop), y = ppl_boarded)) +
  geom_boxplot(fill = "lightcoral",color = "black") +
  labs(x = "Stop", y = "People Boarded", title = "Box Plot of People Boarded per Stop") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
#Apovivaseis
colnames(ppl_unboarded_per_stop_max_zaras) <- c("stop_g", "max_ppl_unboarded_g")
ggplot(ppl_unboarded_per_stop_max_zaras, aes(x = factor(stop_g), y = max_ppl_unboarded_g)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +  
  labs(x = "Bus Stop", y = "Max People Unboarded", title = "Max People Unboarded per Stop") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
colnames(ppl_unboarded_per_stop_mean_zaras) <- c("stop_g", "mean_ppl_unboarded_g")
ggplot(ppl_unboarded_per_stop_mean_zaras, aes(x = factor(stop_g), y = mean_ppl_unboarded_g)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +  
  labs(x = "Bus Stop", y = "Average People Unboarded", title = "Average People Unboarded per Stop") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
colnames(ppl_unboarded_per_stop_sum_zaras) <- c("stop_g", "sum_ppl_unboarded_g")
ggplot(ppl_unboarded_per_stop_sum_zaras, aes(x = factor(stop_g), y = sum_ppl_unboarded_g)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +  
  labs(x = "Bus Stop", y = "Sum of People Unboarded", title = "Sum of People Unboarded per Stop") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(metrhsh_zaras, aes(x = factor(stop), y = ppl_unboarded)) +
  geom_boxplot(fill = "lightcoral",color = "black") +  
  labs(x = "Stop", y = "People Unboarded", title = "Box Plot of People Unboarded per Stop") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Kathysterhseis###
colnames(mean_t_paramonhs_zaras) <- c("stop_g", "mean_t_paramonhs_g")
ggplot(mean_t_paramonhs_zaras, aes(x = factor(stop_g), y = mean_t_paramonhs_g)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") + 
  labs(x = "Stop", y = "Average Time per Stop (s)", title = "Average Time per Stop") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
colnames(max_t_paramonhs_zaras) <- c("stop_g", "max_t_paramonhs_g")
ggplot(max_t_paramonhs_zaras, aes(x = factor(stop_g), y = max_t_paramonhs_g)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +  
  labs(x = "Bus Stop", y = "Max Time per Stop (s)", title = "Max Time per Stop") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
colnames(sum_t_paramonhs_zaras) <- c("stop_g", "sum_t_paramonhs_g")
ggplot(sum_t_paramonhs_zaras, aes(x = factor(stop_g), y = sum_t_paramonhs_g)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +  
  labs(x = "Bus Stop", y = "Total Time per Stop (s)", title = "Total Time per Stop") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###skips stashs###
skips_counts_df_g <- as.data.frame(skips_counts_zaras)
colnames(skips_counts_df_g) <- c("stop_g", "skips_count_g")
ggplot(skips_counts_df_g, aes(x = factor(stop_g), y = skips_count_g)) +
  geom_bar(stat = "identity", fill = "lightcoral",color = "black") +
  labs(x = "Bus Stop", y = "Number of Skips", title = "Number of Skips per Bus Stop") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Kathisterhsh Stasewn se sxesh me tis pragmatikes###
ggplot(time_diff_staseis_zaras, aes(x = `time_diff_tilematikh_df_zaras$asb_time_diff`)) +
  geom_histogram(binwidth = 1, fill = "lightcoral", color = "black", alpha = 0.7) +
  labs(x = "Maximum Absolute Time Difference (min)", y = "Frequency", 
       title = "Histogram of Maximum Absolute Time Difference per Stop") +
  theme_minimal()

### Pie plot gia parked car kai bus lane###
parked_car_counts_g <- table(metrhsh_zaras$parked_car)
parked_car_df_g <- data.frame(parked_car_g = names(parked_car_counts_g), count_g = as.vector(parked_car_counts_g))
ggplot(parked_car_df_g, aes(x = "", y = count_g, fill = parked_car_g)) +
  geom_bar(stat = "identity", width = 1,color = "black") +
  coord_polar(theta = "y") +
  labs(title = "Parked Car (ΝΑΙ/ΟΧΙ)", fill = "Parked Car") +
  theme_void() +
  theme(plot.title = element_text(hjust = 0.5))
bus_line_counts_g <- table(metrhsh_zaras$bus_line)
bus_line_df_g <- data.frame(bus_line_g = names(bus_line_counts_g), count_g = as.vector(bus_line_counts_g))
ggplot(bus_line_df_g, aes(x = "", y = count_g, fill = bus_line_g)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar(theta = "y") +
  labs(title = "Bus Lane (ΝΑΙ/ΟΧΙ)", fill = "Bus Lane") +
  theme_void() +
  theme(plot.title = element_text(hjust = 0.5))

### Histogram gia ppl boarded kai unboarded per 1 min###
time_arr_1min_g <- floor(as.numeric(metrhsh_zaras$time_arr) / 60) * 60
metrhsh_zaras$time_arr_1min_g <- as.POSIXct(time_arr_1min_g, origin = "1970-01-01", tz = "UTC")
ggplot(metrhsh_zaras, aes(x = time_arr_1min_g, y = ppl_boarded)) +
  geom_bar(stat = "identity", width = 60, color = "black", fill = "skyblue") +
  geom_smooth(method = "loess", se = FALSE, color = "red") +
  labs(title = "People Boarded per 1-Minute Interval", x = "Arrival Time (1-Minute Intervals)", y = "People Boarded") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(metrhsh_zaras, aes(x = time_arr_1min_g, y = ppl_unboarded)) +
  geom_bar(stat = "identity", width = 60, color = "black", fill = "orange") +
  geom_smooth(method = "loess", se = FALSE, color = "red") +
  labs(title = "People Unboarded per 1-Minute Interval", x = "Arrival Time (1-Minute Intervals)", y = "People Unboarded") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Scatter Plots###
##kathysterhsh/nrow##
time_diff_df_z_p <- data.frame(Index = 1:length(time_diff_tilematikh_df_zaras$asb_time_diff),
                           Time_Difference_z_p = time_diff_tilematikh_df_zaras$asb_time_diff)
ggplot(time_diff_df_z_p, aes(x = Index, y = Time_Difference_z_p)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "loess", se = TRUE, color = "red") +  
  labs(title = "Scatter Plot of Time Differences",
       x = "Index",
       y = "Time Difference (min)") +
  theme_minimal()
##ppl boarded/nrow##
ppl_boarded_df_z_p <- data.frame(Index = 1:length(metrhsh_zaras$ppl_boarded),
                             People_Boarded_z_p = metrhsh_zaras$ppl_boarded)
ggplot(ppl_boarded_df_z_p, aes(x = Index, y = People_Boarded_z_p)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "loess", se = TRUE, color = "red") +  
  labs(title = "Scatter Plot of People Boarded",
       x = "Index",
       y = "Number of People Boarded") +
  theme_minimal()
ppl_boarded_df_z_p
##ppl unboarded/nrow##
ppl_unboarded_df_z_p <- data.frame(Index = 1:length(metrhsh_zaras$ppl_unboarded),
                                 People_unboarded_z_p = metrhsh_zaras$ppl_unboarded)
ggplot(ppl_unboarded_df_z_p, aes(x = Index, y = People_unboarded_z_p)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "loess", se = TRUE, color = "red") +  
  labs(title = "Scatter Plot of People Unboarded",
       x = "Index",
       y = "Number of People Boarded") +
  theme_minimal()
##tparamonhs/nrow
as.numeric(t_paramonhs_zaras)
t_paramonhs_df_z_p <- data.frame(Index = 1:length(as.numeric(t_paramonhs_zaras)),
                             Value_z_p = as.numeric(t_paramonhs_zaras))
ggplot(t_paramonhs_df_z_p, aes(x = Index, y = Value_z_p)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "loess", se = TRUE, color = "red") +  
  labs(title = "Scatter Plot of Time in Stop Values",
       x = "Index",
       y = "Value") +
  theme_minimal()

####Erwthmatologio sthn stash

###Syxnothtes Apanthsewn###
create_histogram_synart_p <- function(df_p, column_name_p){
  if (!(column_name_p %in% colnames(df_p))) {
    stop("The column does not exist in the data frame.")
  }
  plot_data_p <- data.frame(
    x = 1:length(df_p[[column_name_p]]), 
    y = df_p[[column_name_p]]
  )
  plot_data_p <- plot_data_p[!is.na(plot_data_p$y) & plot_data_p$y != 0, ]
  ggplot(plot_data_p, aes(x = factor(x), y = y)) +
    geom_bar(stat = "identity", fill = "skyblue", color = "black") + 
    labs(
      x = "Values",  
      y = paste(column_name_p, "Percentage"),  
      title = paste(column_name_p, "Answer Frequency")  
    ) + 
    geom_vline(aes(xintercept = mean(x, na.rm = TRUE)), color = "red", linetype = "dashed", size = 1) +
    geom_vline(aes(xintercept = median(x, na.rm = TRUE)), color = "blue", linetype = "dotted", size = 1) +
    theme_minimal() + 
    theme(axis.text.x = element_text(angle = 0))  
}
create_histogram_synart_p(Syxnothtes_df_p, "Move_Reason_p")
create_histogram_synart_p(Syxnothtes_df_p, "Safety_Score_p")
create_histogram_synart_p(Syxnothtes_df_p, "Bus_use_Frequency_p")
create_histogram_synart_p(Syxnothtes_df_p, "Reliability_Score_p")
create_histogram_synart_p(Syxnothtes_df_p, "Cleanliness_Score_p")
create_histogram_synart_p(Syxnothtes_df_p, "Ticket_Price_Score_p")
create_histogram_synart_p(Syxnothtes_df_p, "Time_Waited_Score_p")
create_histogram_synart_p(Syxnothtes_df_p, "Comfort_Score_p")
create_histogram_synart_p(Syxnothtes_df_p, "Distance_to_Stop_Score_p")
create_histogram_synart_p(Syxnothtes_df_p, "Overall_Score_p")
create_histogram_synart_p(Syxnothtes_df_p, "Gender_p")
create_histogram_synart_p(Syxnothtes_df_p, "Age_p")

###Mean vs Overall Score gia kathe eggrafh###
Mean_vs_Overall_Score_p$row_number <- 1:nrow(Mean_vs_Overall_Score_p)
ggplot(Mean_vs_Overall_Score_p, aes(x = row_number, y = Apolyto_Sygkrishs)) +
  geom_point(color = "blue") +
  geom_smooth(method = "loess", color = "red", se = TRUE) + 
  labs(
    x = "Row Number", 
    y = "Absolute Difference",
    title = "Scatter Plot of Absolute Difference of Overall - Mean Score"  
  ) +
  theme_minimal()

###dokimh x^2###
chi_square_matrix_p <- reshape2::acast(x_tetr_results_p, Variable1_p ~ Variable2_p, value.var = "p_value_p")
chi_square_matrix_p[is.na(chi_square_matrix_p)] <- 1 
ggplot(melt(chi_square_matrix_p), aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "blue", high = "red", name = "p-value") +
  labs(title = "Chi-Square Test p-values", x = "Variable 1", y = "Variable 2") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###t test me gender ###
ggplot(t_test_results_p, aes(x = Variable1_t_p, y = p_value_t_p, fill = Variable2_t_p)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "T-Test p-values by Numerical Variables (Gender Comparison)", x = "Numerical Variable", y = "p-value") +
  theme_minimal()

###Anova Test###
anova_matrix_p <- reshape2::acast(anova_results_p, Variable1_a_p ~ Variable2_a_p, value.var = "F_value_a_p")
ggplot(melt(anova_matrix_p), aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "lightblue", high = "darkblue", name = "F-value") +
  labs(title = "ANOVA F-values Heatmap", x = "Numerical Variable", y = "Categorical Variable") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Residuals vs Fitted###
par(mfrow = c(1, 2))  # Side-by-side plots
plot(linear_regrr_p$fitted.values, linear_regrr_p$residuals,
     main = "Residuals vs Fitted",
     xlab = "Fitted Values",
     ylab = "Residuals")
abline(h = 0, col = "red")
qqnorm(linear_regrr_p$residuals, main = "QQ Plot of Residuals")
qqline(linear_regrr_p$residuals, col = "red")

###Linera Regression###
linear_coef_p <- data.frame(Variable = names(coef(linear_regrr_p)), Estimate = coef(linear_regrr_p))
ggplot(linear_coef_p, aes(x = reorder(Variable, Estimate), y = Estimate)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Linear Regression Coefficients", x = "Variable", y = "Coefficient Estimate") +
  theme_minimal()

###Logistic Regression###
logistic_odds_p <- exp(coef(logistic_regrr_p))
logistic_odds_df_p <- data.frame(Variable = names(logistic_odds_p), Odds_Ratio = logistic_odds_p)
ggplot(logistic_odds_df_p, aes(x = reorder(Variable, Odds_Ratio), y = Odds_Ratio)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +
  labs(title = "Logistic Regression Odds Ratios", x = "Predictor Variable", y = "Odds Ratio") +
  theme_minimal()

###Descriptive Statistics###
mean_values_p <- as.numeric(Desc_Stats_Apotelesmata_p[5, -c(1, 2, 4)])  
variables_p <- c("Safety Score", "Reliability Score", "Cleanliness Score", "Ticket Price Score", 
               "Time Waited Score", "Comfort Score", "Distance to Stop Score", "Overall Score")
mean_df <- data.frame(Variable = variables_p, Mean = mean_values_p)
ggplot(mean_df, aes(x = reorder(Variable, -Mean), y = Mean, fill = Variable)) +
  geom_bar(stat = "identity") +
  labs(title = "Mean Scores for Each Variable", 
       x = "Variable", y = "Mean Score") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = "Set3", guide = FALSE)

###Boxplot Desc Stats###
Desc_Stats_Apotelesmata_p_long <- Desc_Stats_Apotelesmata_p %>%
  gather(key = "Statistic", value = "Value", -Statistic_p)
Desc_Stats_Apotelesmata_p_long_filtered <- Desc_Stats_Apotelesmata_p_long %>%
  filter(Statistic_p == "Mean" | Statistic_p == "Variance")
ggplot(Desc_Stats_Apotelesmata_p_long_filtered, aes(x = Statistic, y = Value, fill = Statistic)) +
  geom_boxplot() +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  labs(title = "Boxplot of Variables", x = "Statistic", y = "Value")

###Skewness line plot###
skewness_data_p <- Desc_Stats_Apotelesmata_p_long[Desc_Stats_Apotelesmata_p_long$Statistic_p == "Skewness", ]
ggplot(skewness_data_p, aes(x = Value, fill = Statistic_p)) +
  geom_density(alpha = 0.5) +
  labs(title = "Density of Skewness", x = "Skewness", y = "Density") +
  theme_minimal()

###Histogramm synarthsh gia means kai medians###
plot_histogram_with_mean_median_p <- function(data_p, column_name_p) {
  ggplot(data = data_p, aes_string(x = column_name_p)) +
    geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
    geom_vline(aes_string(xintercept = paste("mean(", column_name_p, ", na.rm = TRUE)", sep = "")), 
               color = "red", linetype = "dashed", size = 1) +
    geom_vline(aes_string(xintercept = paste("median(", column_name_p, ", na.rm = TRUE)", sep = "")), 
               color = "blue", linetype = "dotted", size = 1) +
    labs(title = paste("Histogram of", column_name_p, "with Mean and Median"), 
         x = column_name_p, y = "Frequency")
}
plot_histogram_with_mean_median_p(erwt_pavlos, "safety_score")
plot_histogram_with_mean_median_p(erwt_pavlos, "reliab_score")
plot_histogram_with_mean_median_p(erwt_pavlos, "clean_score")
plot_histogram_with_mean_median_p(erwt_pavlos, "price_score")
plot_histogram_with_mean_median_p(erwt_pavlos, "time_waited_score")
plot_histogram_with_mean_median_p(erwt_pavlos, "comfort_score")
plot_histogram_with_mean_median_p(erwt_pavlos, "distance_to_stop_score")
plot_histogram_with_mean_median_p(erwt_pavlos, "overall_score")

###CV plot###
cv_data_p <- Desc_Stats_Apotelesmata_p[Desc_Stats_Apotelesmata_p$Statistic_p == "Coefficient of Variation",]
cv_data_long_p <- gather(cv_data_p, key = "Score_Type", value = "CV", -Statistic_p)
cv_data_long_p <- cv_data_long_p[!(cv_data_long_p$Score_Type %in% c("Bus Use Frequency", "Move Reason")),]
ggplot(cv_data_long_p, aes(x = Score_Type, y = CV, fill = Score_Type)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  labs(title = "Coefficient of Variation for Each Score Type", x = "Score Type", y = "CV (%)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###kurtosis plot###
kurtosis_data_p <- Desc_Stats_Apotelesmata_p[Desc_Stats_Apotelesmata_p$Statistic_p == "Kurtosis",]
kurtosis_data_long_p <- gather(kurtosis_data_p, key = "Score_Type", value = "Kurtosis", -Statistic_p)
kurtosis_data_long_p$Kurtosis <- as.numeric(kurtosis_data_long_p$Kurtosis)
ggplot(kurtosis_data_long_p, aes(x = Score_Type, y = Kurtosis, fill = Score_Type)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  labs(title = "Kurtosis for Each Score Type", x = "Score Type", y = "Kurtosis") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###range-variance plot###
range_variance_data_p <- Desc_Stats_Apotelesmata_p[Desc_Stats_Apotelesmata_p$Statistic_p %in% c("Range", "Variance"),]
range_variance_data_long_p <- gather(range_variance_data_p, key = "Score_Type", value = "Value", -Statistic_p)
range_variance_data_long_p$Value <- as.numeric(range_variance_data_long_p$Value)
ggplot(range_variance_data_long_p, aes(x = Score_Type, y = Value, fill = Score_Type)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Range and Variance for Each Score Type", x = "Score Type", y = "Value") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###percentiles plot###
percentiles_p <- Desc_Stats_Apotelesmata_p[Desc_Stats_Apotelesmata_p$Statistic_p %in% c("P10", "P25", "P50", "P75", "P90"),]
percentiles_long_p <- gather(percentiles_p, key = "Score_Type", value = "Score", -Statistic_p)
percentiles_long_p$Score <- as.numeric(percentiles_long_p$Score)
ggplot(percentiles_long_p, aes(x = Score_Type, y = Score, group = Statistic_p, color = Statistic_p)) +
  geom_line() +
  geom_point() +
  labs(title = "Percentiles for Each Score Type", x = "Percentile", y = "Score") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Correlation Matrix###
selected_columns_p <- c("move_reas", "bus_use_freq", "min_of_travel", "reliab_score", 
                      "clean_score", "price_score", "time_waited_score", "comfort_score", 
                      "safety_score", "distance_to_stop_score", "overall_score", "gender", "age")
data_subset_p <- erwt_pavlos[, selected_columns_p]
data_subset_p[] <- lapply(data_subset_p, function(x) as.numeric(as.character(x)))
data_subset_p <- data_subset_p[, sapply(data_subset_p, function(x) length(unique(x)) > 1)]
data_subset_p <- na.omit(data_subset_p)
cor_matrix_p <- cor(data_subset_p, use = "complete.obs", method = "pearson")
cor_matrix_melted_p <- melt(cor_matrix_p)
ggplot(data = cor_matrix_melted_p, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, 
                       limit = c(-1, 1), space = "Lab", name="Pearson\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1, size = 10),
        axis.text.y = element_text(size = 10)) +
  labs(title = "Pearson Correlation Matrix Heatmap", x = "", y = "") +
  coord_fixed()


####Erwthmatologio sto leoforeio

###Syxnothtes Apanthsewn###
create_histogram_synart_g <- function(df_g, column_name_g){
  if (!(column_name_g %in% colnames(df_g))) {
    stop("The column does not exist in the data frame.")
  }
  plot_data_g <- data.frame(
    x = 1:length(df_g[[column_name_g]]), 
    y = df_g[[column_name_g]]
  )
  plot_data_g <- plot_data_g[!is.na(plot_data_g$y) & plot_data_g$y != 0, ]
  ggplot(plot_data_g, aes(x = factor(x), y = y)) +
    geom_bar(stat = "identity", fill = "skyblue", color = "black") + 
    labs(
      x = "Values",  
      y = paste(column_name_g, "Percentage"),  
      title = paste(column_name_g, "Answer Frequency")  
    ) + 
    geom_vline(aes(xintercept = mean(x, na.rm = TRUE)), color = "red", linetype = "dashed", size = 1) +
    geom_vline(aes(xintercept = median(x, na.rm = TRUE)), color = "blue", linetype = "dotted", size = 1) +
    theme_minimal() + 
    theme(axis.text.x = element_text(angle = 0))  
}
create_histogram_synart_g(Syxnothtes_df_g, "Move_Reason_g")
create_histogram_synart_g(Syxnothtes_df_g, "Safety_Score_g")
create_histogram_synart_g(Syxnothtes_df_g, "Bus_use_Frequency_g")
create_histogram_synart_g(Syxnothtes_df_g, "Reliability_Score_g")
create_histogram_synart_g(Syxnothtes_df_g, "Cleanliness_Score_g")
create_histogram_synart_g(Syxnothtes_df_g, "Ticket_Price_Score_g")
create_histogram_synart_g(Syxnothtes_df_g, "Time_Waited_Score_g")
create_histogram_synart_g(Syxnothtes_df_g, "Comfort_Score_g")
create_histogram_synart_g(Syxnothtes_df_g, "Distance_to_Stop_Score_g")
create_histogram_synart_g(Syxnothtes_df_g, "Overall_Score_g")
create_histogram_synart_g(Syxnothtes_df_g, "Gender_g")
create_histogram_synart_g(Syxnothtes_df_g, "Age_g")

###Mean vs Overall Score gia kathe eggrafh###
Mean_vs_Overall_Score_g$row_number <- 1:nrow(Mean_vs_Overall_Score_g)
ggplot(Mean_vs_Overall_Score_g, aes(x = row_number, y = Apolyto_Sygkrishs)) +
  geom_point(color = "blue") +
  geom_smooth(method = "loess", color = "red", se = TRUE) + 
  labs(
    x = "Row Number", 
    y = "Absolute Difference",
    title = "Scatter Plot of Absolute Difference of Overall - Mean Score"  
  ) +
  theme_minimal()

###dokimh x^2###
chi_square_matrix_g <- reshape2::acast(x_tetr_results_g, Variable1_g ~ Variable2_g, value.var = "p_value_g")
chi_square_matrix_g[is.na(chi_square_matrix_g)] <- 1 
ggplot(melt(chi_square_matrix_g), aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "blue", high = "red", name = "p-value") +
  labs(title = "Chi-Square Test p-values", x = "Variable 1", y = "Variable 2") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###t test me gender ###
ggplot(t_test_results_g, aes(x = Variable1_t_g, y = p_value_t_g, fill = Variable2_t_g)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "T-Test p-values by Numerical Variables (Gender Comparison)", x = "Numerical Variable", y = "p-value") +
  theme_minimal()

###Anova Test###
anova_matrix_g <- reshape2::acast(anova_results_g, Variable1_a_g ~ Variable2_a_g, value.var = "F_value_a_g")
ggplot(melt(anova_matrix_g), aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "lightblue", high = "darkblue", name = "F-value") +
  labs(title = "ANOVA F-values Heatmap", x = "Numerical Variable", y = "Categorical Variable") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Residuals vs Fitted###
par(mfrow = c(1, 2))  # Side-by-side plots
plot(linear_regrr_g$fitted.values, linear_regrr_g$residuals,
     main = "Residuals vs Fitted",
     xlab = "Fitted Values",
     ylab = "Residuals")
abline(h = 0, col = "red")
qqnorm(linear_regrr_g$residuals, main = "QQ Plot of Residuals")
qqline(linear_regrr_g$residuals, col = "red")

###Linera Regression###
linear_coef_g <- data.frame(Variable = names(coef(linear_regrr_g)), Estimate = coef(linear_regrr_g))
ggplot(linear_coef_g, aes(x = reorder(Variable, Estimate), y = Estimate)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Linear Regression Coefficients", x = "Variable", y = "Coefficient Estimate") +
  theme_minimal()

###Logistic Regression###
logistic_odds_g <- exp(coef(logistic_regrr_g))
logistic_odds_df_g <- data.frame(Variable = names(logistic_odds_g), Odds_Ratio = logistic_odds_g)
ggplot(logistic_odds_df_g, aes(x = reorder(Variable, Odds_Ratio), y = Odds_Ratio)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +
  labs(title = "Logistic Regression Odds Ratios", x = "Predictor Variable", y = "Odds Ratio") +
  theme_minimal()

###Descriptive Statistics###
mean_values_g <- as.numeric(Desc_Stats_Apotelesmata_g[5, -c(1, 2, 4)])  
variables_g <- c("Safety Score", "Reliability Score", "Cleanliness Score", "Ticket Price Score", 
               "Time Waited Score", "Comfort Score", "Distance to Stop Score", "Overall Score")
mean_df_g <- data.frame(Variable = variables_g, Mean = mean_values_g)
ggplot(mean_df_g, aes(x = reorder(Variable, -Mean), y = Mean, fill = Variable)) +
  geom_bar(stat = "identity") +
  labs(title = "Mean Scores for Each Variable", 
       x = "Variable", y = "Mean Score") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = "Set3", guide = FALSE)

###Boxplot Desc Stats###
Desc_Stats_Apotelesmata_g_long <- Desc_Stats_Apotelesmata_g %>%
  gather(key = "Statistic", value = "Value", -Statistic_g)
Desc_Stats_Apotelesmata_g_long_filtered <- Desc_Stats_Apotelesmata_g_long %>%
  filter(Statistic_g == "Mean" | Statistic_g == "Variance")
ggplot(Desc_Stats_Apotelesmata_g_long_filtered, aes(x = Statistic, y = Value, fill = Statistic)) +
  geom_boxplot() +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  labs(title = "Boxplot of Selected Statistics", x = "Statistic", y = "Value")

###Skewness line plot###
skewness_data_g <- Desc_Stats_Apotelesmata_g_long[Desc_Stats_Apotelesmata_g_long$Statistic_g == "Skewness", ]
ggplot(skewness_data_g, aes(x = Value, fill = Statistic_g)) +
  geom_density(alpha = 0.5) +
  labs(title = "Density of Skewness", x = "Skewness", y = "Density") +
  theme_minimal()

###Histogramm synarthsh gia means kai medians###
plot_histogram_with_mean_median_g <- function(data_g, column_name_g) {
  ggplot(data = data_g, aes_string(x = column_name_g)) +
    geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
    geom_vline(aes_string(xintercept = paste("mean(", column_name_g, ", na.rm = TRUE)", sep = "")), 
               color = "red", linetype = "dashed", size = 1) +
    geom_vline(aes_string(xintercept = paste("median(", column_name_g, ", na.rm = TRUE)", sep = "")), 
               color = "blue", linetype = "dotted", size = 1) +
    labs(title = paste("Histogram of", column_name_g, "with Mean and Median"), 
         x = column_name_g, y = "Frequency")
}
plot_histogram_with_mean_median_g(erwt_gialouris, "safety_score")
plot_histogram_with_mean_median_g(erwt_gialouris, "reliab_score")
plot_histogram_with_mean_median_g(erwt_gialouris, "clean_score")
plot_histogram_with_mean_median_g(erwt_gialouris, "price_score")
plot_histogram_with_mean_median_g(erwt_gialouris, "time_waited_score")
plot_histogram_with_mean_median_g(erwt_gialouris, "comfort_score")
plot_histogram_with_mean_median_g(erwt_gialouris, "distance_to_stop_score")
plot_histogram_with_mean_median_g(erwt_gialouris, "overall_score")

###CV plot###
cv_data_g <- Desc_Stats_Apotelesmata_g[Desc_Stats_Apotelesmata_g$Statistic_g == "Coefficient of Variation",]
cv_data_long_g <- gather(cv_data_g, key = "Score_Type", value = "CV", -Statistic_g)
cv_data_long_g <- cv_data_long_g[!(cv_data_long_g$Score_Type %in% c("Bus Use Frequency", "Move Reason")),]
ggplot(cv_data_long_g, aes(x = Score_Type, y = CV, fill = Score_Type)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  labs(title = "Coefficient of Variation for Each Score Type", x = "Score Type", y = "CV (%)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###kurtosis plot###
kurtosis_data_g <- Desc_Stats_Apotelesmata_g[Desc_Stats_Apotelesmata_g$Statistic_g == "Kurtosis",]
kurtosis_data_long_g <- gather(kurtosis_data_g, key = "Score_Type", value = "Kurtosis", -Statistic_g)
kurtosis_data_long_g$Kurtosis <- as.numeric(kurtosis_data_long_g$Kurtosis)
ggplot(kurtosis_data_long_g, aes(x = Score_Type, y = Kurtosis, fill = Score_Type)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  labs(title = "Kurtosis for Each Score Type", x = "Score Type", y = "Kurtosis") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###range-variance plot###
range_variance_data_g <- Desc_Stats_Apotelesmata_g[Desc_Stats_Apotelesmata_g$Statistic_g %in% c("Range", "Variance"),]
range_variance_data_long_g <- gather(range_variance_data_g, key = "Score_Type", value = "Value", -Statistic_g)
range_variance_data_long_g$Value <- as.numeric(range_variance_data_long_g$Value)
ggplot(range_variance_data_long_g, aes(x = Score_Type, y = Value, fill = Score_Type)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Range and Variance for Each Score Type", x = "Score Type", y = "Value") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###percentiles plot###
percentiles_g <- Desc_Stats_Apotelesmata_g[Desc_Stats_Apotelesmata_g$Statistic_g %in% c("P10", "P25", "P50", "P75", "P90"),]
percentiles_long_g <- gather(percentiles_g, key = "Score_Type", value = "Score", -Statistic_g)
percentiles_long_g$Score <- as.numeric(percentiles_long_g$Score)
ggplot(percentiles_long_g, aes(x = Score_Type, y = Score, group = Statistic_g, color = Statistic_g)) +
  geom_line() +
  geom_point() +
  labs(title = "Percentiles for Each Score Type", x = "Percentile", y = "Score") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

###Correlation Matrix###
selected_columns_g <- c("move_reas", "bus_use_freq", "min_of_travel", "reliab_score", 
                      "clean_score", "price_score", "time_waited_score", "comfort_score", 
                      "safety_score", "distance_to_stop_score", "overall_score", "gender", "age")
data_subset_g <- erwt_gialouris[, selected_columns_g]
data_subset_g[] <- lapply(data_subset_g, function(x) as.numeric(as.character(x)))
data_subset_g <- data_subset_g[, sapply(data_subset_g, function(x) length(unique(x)) > 1)]
data_subset_g <- na.omit(data_subset_g)
cor_matrix_g <- cor(data_subset_g, use = "complete.obs", method = "pearson")
cor_matrix_melted_g <- melt(cor_matrix_g)
ggplot(data = cor_matrix_melted_g, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, 
                       limit = c(-1, 1), space = "Lab", name="Pearson\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1, size = 10),
        axis.text.y = element_text(size = 10)) +
  labs(title = "Pearson Correlation Matrix Heatmap", x = "", y = "") +
  coord_fixed()


####Erwthmatologia mazi

###% Erwtithentwn kai % pou symmeteixan###
#Pavlos
nrow(erwt_pavlos)
pos_apant_p <- 100*((nrow(erwt_pavlos))/35)
pos_apant_p
#Gialourhs
nrow(erwt_gialouris)
pos_apant_g <- 100*((nrow(erwt_pavlos))/40)
pos_apant_g
pos_apant_p <- 82.85714
pos_apant_g <- 72.5
data_pg <- data.frame(
  Category = c("Pos_apant_p", "Pos_apant_g"),
  Percentage = c(pos_apant_p, pos_apant_g)
)
ggplot(data_pg, aes(x = Category, y = Percentage, fill = Category)) +
  geom_bar(stat = "identity") +
  ylim(0, 100) +
  labs(title = "Percentage of People Who Answered the Questionnaire",
       x = "Category", 
       y = "Percentage") +
  theme_minimal()

###Pio synithismenos skopos metakinhshs sthn stash###
#Pavlos
skopos_metak_p <- prop.table(table(erwt_pavlos$move_reas))*100
skopos_metak_p
#Gialourhs
skopos_metak_g <- prop.table(table(erwt_gialouris$move_reas))*100
skopos_metak_g
skopos_metak_p2 <- c(27.586207, 6.896552, 6.896552, 51.724138, 3.448276, 3.448276)
skopos_metak_g2 <- c(9.090909, 3.030303, 6.060606, 72.727273, 3.030303, 3.030303, 3.030303)
categories_p2 <- c(1, 2, 4, 5, 7, 9)
categories_g2 <- c(1, 2, 4, 5, 6, 7, 8)
par(mfrow = c(1, 2))
barplot(skopos_metak_p2, 
        main = "Move Reason Pavlos", 
        col = "lightblue", 
        xlab = "Categories", 
        ylab = "Percentage", 
        ylim = c(0, 80),
        names.arg = categories_p2)  
barplot(skopos_metak_g2, 
        main = "Move Reason Gialourhs", 
        col = "lightgreen", 
        xlab = "Categories", 
        ylab = "Percentage", 
        ylim = c(0, 80),
        names.arg = categories_g2) 

par(mfrow = c(1, 1))

###Mesos xronos metakinhshs###
#Pavlos
mesos_xronos_metak_p <- mean((as.numeric(erwt_pavlos$min_of_travel))/60)
mesos_xronos_metak_p
max_xronos_metak_p <- max((as.numeric(erwt_pavlos$min_of_travel))/60)
max_xronos_metak_p
min_xronos_metak_p <- min((as.numeric(erwt_pavlos$min_of_travel))/60)
min_xronos_metak_p
#Gialourhs
mesos_xronos_metak_g <- mean((as.numeric(erwt_gialouris$min_of_travel))/60)
mesos_xronos_metak_g
max_xronos_metak_g <- max((as.numeric(erwt_gialouris$min_of_travel))/60)
max_xronos_metak_g
min_xronos_metak_g <- min((as.numeric(erwt_gialouris$min_of_travel))/60)
min_xronos_metak_g
mesos_xronos_metak_p2 <- mean((as.numeric(erwt_pavlos$min_of_travel))/60)
max_xronos_metak_p2 <- max((as.numeric(erwt_pavlos$min_of_travel))/60)
min_xronos_metak_p2 <- min((as.numeric(erwt_pavlos$min_of_travel))/60)
mesos_xronos_metak_g2 <- mean((as.numeric(erwt_gialouris$min_of_travel))/60)
max_xronos_metak_g2 <- max((as.numeric(erwt_gialouris$min_of_travel))/60)
min_xronos_metak_g2 <- min((as.numeric(erwt_gialouris$min_of_travel))/60)
data_pg2 <- data.frame(
  Group = rep(c("Pavlos", "Gialouris"), each = 3),
  Statistic = rep(c("Mean", "Max", "Min"), 2),
  TravelTime = c(mesos_xronos_metak_p2, max_xronos_metak_p2, min_xronos_metak_p2,
                 mesos_xronos_metak_g2, max_xronos_metak_g2, min_xronos_metak_g2)
)
ggplot(data_pg2, aes(x = Statistic, y = TravelTime, fill = Group)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8)) +
  labs(title = "Travel Time Statistics (in minutes)",
       x = "Statistic",
       y = "Travel Time (hours)") +
  scale_fill_manual(values = c("lightblue", "lightgreen")) + 
  theme_minimal()

###Overall Rating/Scaled Mean###
#Pavlos
Eggrafh_Mean2_p <- rowMeans(erwt_pavlos[, c("reliab_score", "clean_score", "price_score", "time_waited_score", "comfort_score", "safety_score", "distance_to_stop_score","overall_score")], na.rm = TRUE)
Eggrafh_Mean2_p
Overall_Mean_p <- mean(Eggrafh_Mean2_p)
Overall_Mean_p
Scaled_Mean_Percentage_p <- (Overall_Mean_p/5)*100
Scaled_Mean_Percentage_p
#Gialourhs
Eggrafh_Mean2_g <- rowMeans(erwt_gialouris[, c("reliab_score", "clean_score", "price_score", "time_waited_score", "comfort_score", "safety_score", "distance_to_stop_score","overall_score")], na.rm = TRUE)
Eggrafh_Mean2_g
Overall_Mean_g <- mean(Eggrafh_Mean2_g)
Overall_Mean_g
Scaled_Mean_Percentage_g <- (Overall_Mean_g/5)*100
Scaled_Mean_Percentage_g
Scaled_Mean_Percentage_p <- (mean(rowMeans(erwt_pavlos[, c("reliab_score", "clean_score", "price_score", 
                                                           "time_waited_score", "comfort_score", "safety_score", 
                                                           "distance_to_stop_score", "overall_score")], na.rm = TRUE)) / 5) * 100
Scaled_Mean_Percentage_g <- (mean(rowMeans(erwt_gialouris[, c("reliab_score", "clean_score", "price_score", 
                                                              "time_waited_score", "comfort_score", "safety_score", 
                                                              "distance_to_stop_score", "overall_score")], na.rm = TRUE)) / 5) * 100
scaled_data_pg <- data.frame(
  Group = c("Pavlos", "Gialouris"),
  Scaled_Mean_Percentage_pg = c(Scaled_Mean_Percentage_p, Scaled_Mean_Percentage_g)
)
ggplot(scaled_data_pg, aes(x = Group, y = Scaled_Mean_Percentage_pg, fill = Group)) +
  geom_bar(stat = "identity", show.legend = FALSE, color = "black") +
  labs(title = "Scaled Mean Percentage of Scores",
       x = "Group",
       y = "Scaled Mean Percentage (%)") +
  scale_fill_manual(values = c("lightblue", "lightgreen")) +
  theme_minimal()

###Profil Erwtithentwn###
nrow(erwt_pavlos)
pos_apant_p <- 100*((nrow(erwt_pavlos))/35)
pos_apant_p
nrow(erwt_gialouris)
pos_apant_g <- 100*((nrow(erwt_pavlos))/40)
pos_apant_g
data_pa_p <- data.frame(
  category = c("Answered", "Not Answered"),
  value = c(pos_apant_p, 100 - pos_apant_p))
data_pa_g <- data.frame(
  category = c("Answered", "Not Answered"),
  value = c(pos_apant_g, 100 - pos_apant_g))
pa_pie_chart <- function(data, title) {
  ggplot(data, aes(x = "", y = value, fill = category)) +
    geom_col(width = 1) +
    coord_polar(theta = "y") +
    theme_void() +
    labs(title = title, fill = "Category") +
    scale_fill_manual(values = c("blue", "red")) +
    geom_text(aes(label = sprintf("%.1f%%", value)), 
              position = position_stack(vjust = 0.5), color = "black")
}
p1_pa_p <- pa_pie_chart(data_pa_p, "Pavlos Responses")
p2_pa_g <- pa_pie_chart(data_pa_g, "Gialouris Responses")
grid.arrange(p1_pa_p, p2_pa_g, ncol = 2)
count_gender_p <- table(erwt_pavlos$gender)
count_gender_p
count_gender_g <- table(erwt_gialouris$gender)
count_gender_g
count_age_p <- table(erwt_pavlos$age)
count_age_p
count_age_g <- table(erwt_gialouris$age)
count_age_g
count_gender_p <- table(erwt_pavlos$gender)
count_gender_g <- table(erwt_gialouris$gender)
df_pavlos_ag <- data.frame(Gender = names(count_gender_p), Count = as.vector(count_gender_p), Dataset = "Pavlos")
df_gialouris_ag <- data.frame(Gender = names(count_gender_g), Count = as.vector(count_gender_g), Dataset = "Gialouris")
df_combined_ag <- rbind(df_pavlos_ag, df_gialouris_ag)
par(mfrow = c(1, 2))  
pie(df_pavlos_ag$Count, labels = paste(df_pavlos_ag$Gender, "\n", df_pavlos_ag$Count), col = c("lightblue", "lightgreen"), 
    main = "Gender Distribution (Pavlos)", radius = 1)
pie(df_gialouris_ag$Count, labels = paste(df_gialouris_ag$Gender, "\n", df_gialouris_ag$Count), col = c("lightblue", "lightgreen"),
    main = "Gender Distribution (Gialouris)", radius = 1)
count_age_g2 <- table(erwt_gialouris$age)
df_pavlos_ag <- data.frame(Age = names(count_age_p), Count = as.vector(count_age_p), Dataset = "Pavlos")
df_gialouris_ag <- data.frame(Age = names(count_age_g), Count = as.vector(count_age_g), Dataset = "Gialouris")
df_combined_ag <- rbind(df_pavlos_ag, df_gialouris_ag)
par(mfrow = c(1, 2)) 
pie(df_pavlos_ag$Count, labels = paste(df_pavlos_ag$age, "\n", df_pavlos_ag$Count), col = c("lightblue", "lightgreen"), 
    main = "Age Distribution (Pavlos)", radius = 1)
pie(df_gialouris_ag$Count, labels = paste(df_gialouris_ag$age, "\n", df_gialouris_ag$Count), col = c("lightblue", "lightgreen"),
    main = "Age Distribution (Gialouris)", radius = 1)