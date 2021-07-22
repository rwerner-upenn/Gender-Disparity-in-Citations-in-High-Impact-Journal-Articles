/*
CODE FOR: 
Chatterjee P & Werner RM. "Gender Disparity in Citations in High-Impact Journal Articles"
Published in JAMA Network Open, July 2021. 

VERSION: 7/21/2021

NOTES:
This study examined disparities in the number of citations of high-impact publications by first and last author gender.
See published manuscript for full details.  

This file uses data collected on articles published in 5 high-impact medical journals from 2015-2018, and the number of citations for 
this subset of articles obtained from Web of Science. 

The data file provided is our cleaned data extract. Researchers should be able to use these data and the code below 
to replicate all figures contained in the published manuscript. 

*/

global filepath "[YOUR FILE PATH HERE]"

use "$filepath/articles_2015_2018.dta", clear

*Generate citations per year variable 
gen delta=date_collect-date_pub
gen cites_adj=numberofcitationstodate/delta
gen cites_adj365=cites_adj*365 

*Generate first/last author pairs by gender
gen first_last=.
replace first_last=1 if gender1=="female" & gender2=="female" 
replace first_last=2 if gender1=="female" & gender2=="male" 
replace first_last=3 if gender1=="male" & gender2=="female" 
replace first_last=4 if gender1=="male" & gender2=="male"


*Table 1: Sample Characteristics 
tab gender1 /*Gender of first author*/
tab gender2 /*Gender of last author*/
tab yearofpub 
tab data_op /*Article type: 1==Original research, 2==Commentary*/

*Table 2: Total Citations Overall and By Year, Stratified by First- and Last-Author Gender 
sum numberofcitationstodate if data_op==1 & gender1=="female", detail
sum numberofcitationstodate if data_op==1 & gender1=="male", detail
median numberofcitationstodate if data_op==1, by(gender1)

sum numberofcitationstodate if data_op==1 & gender1=="female" & year==2015, detail
sum numberofcitationstodate if data_op==1 & gender1=="male" & year==2015, detail
median numberofcitationstodate if data_op==1 & year==2015, by(gender1)

sum numberofcitationstodate if data_op==1 & gender1=="female" & year==2016, detail
sum numberofcitationstodate if data_op==1 & gender1=="male" & year==2016, detail
median numberofcitationstodate if data_op==1 & year==2016, by(gender1)

sum numberofcitationstodate if data_op==1 & gender1=="female" & year==2017, detail
sum numberofcitationstodate if data_op==1 & gender1=="male" & year==2017, detail
median numberofcitationstodate if data_op==1 & year==2017, by(gender1)

sum numberofcitationstodate if data_op==1 & gender1=="female" & year==2018, detail
sum numberofcitationstodate if data_op==1 & gender1=="male" & year==2018, detail
median numberofcitationstodate if data_op==1 & year==2018, by(gender1)



sum numberofcitationstodate if data_op==1 & gender2=="female", detail
sum numberofcitationstodate if data_op==1 & gender2=="male", detail
median numberofcitationstodate if data_op==1, by(gender2)

sum numberofcitationstodate if data_op==1 & gender2=="female" & year==2015, detail
sum numberofcitationstodate if data_op==1 & gender2=="male" & year==2015, detail
median numberofcitationstodate if data_op==1 & year==2015, by(gender2)

sum numberofcitationstodate if data_op==1 & gender2=="female" & year==2016, detail
sum numberofcitationstodate if data_op==1 & gender2=="male" & year==2016, detail
median numberofcitationstodate if data_op==1 & year==2016, by(gender2)

sum numberofcitationstodate if data_op==1 & gender2=="female" & year==2017, detail
sum numberofcitationstodate if data_op==1 & gender2=="male" & year==2017, detail
median numberofcitationstodate if data_op==1 & year==2017, by(gender2)

sum numberofcitationstodate if data_op==1 & gender2=="female" & year==2018, detail
sum numberofcitationstodate if data_op==1 & gender2=="male" & year==2018, detail
median numberofcitationstodate if data_op==1 & year==2018, by(gender2)


*Table 2 (continued): Citations Per Year Overall and By Year, Stratified by First- and Last-Author Gender 
sum cites_adj365 if data_op==1 & gender1=="female", detail
sum cites_adj365 if data_op==1 & gender1=="male", detail
median cites_adj365 if data_op==1, by(gender1)

sum cites_adj365 if data_op==1 & gender1=="female" & year==2015, detail
sum cites_adj365 if data_op==1 & gender1=="male" & year==2015, detail
median cites_adj365 if data_op==1 & year==2015, by(gender1)

sum cites_adj365 if data_op==1 & gender1=="female" & year==2016, detail
sum cites_adj365 if data_op==1 & gender1=="male" & year==2016, detail
median cites_adj365 if data_op==1 & year==2016, by(gender1)

sum cites_adj365 if data_op==1 & gender1=="female" & year==2017, detail
sum cites_adj365 if data_op==1 & gender1=="male" & year==2017, detail
median cites_adj365 if data_op==1 & year==2017, by(gender1)

sum cites_adj365 if data_op==1 & gender1=="female" & year==2018, detail
sum cites_adj365 if data_op==1 & gender1=="male" & year==2018, detail
median cites_adj365 if data_op==1 & year==2018, by(gender1)



sum cites_adj365 if data_op==1 & gender2=="female", detail
sum cites_adj365 if data_op==1 & gender2=="male", detail
median cites_adj365 if data_op==1, by(gender2)

sum cites_adj365 if data_op==1 & gender2=="female" & year==2015, detail
sum cites_adj365 if data_op==1 & gender2=="male" & year==2015, detail
median cites_adj365 if data_op==1 & year==2015, by(gender2)

sum cites_adj365 if data_op==1 & gender2=="female" & year==2016, detail
sum cites_adj365 if data_op==1 & gender2=="male" & year==2016, detail
median cites_adj365 if data_op==1 & year==2016, by(gender2)

sum cites_adj365 if data_op==1 & gender2=="female" & year==2017, detail
sum cites_adj365 if data_op==1 & gender2=="male" & year==2017, detail
median cites_adj365 if data_op==1 & year==2017, by(gender2)

sum cites_adj365 if data_op==1 & gender2=="female" & year==2018, detail
sum cites_adj365 if data_op==1 & gender2=="male" & year==2018, detail
median cites_adj365 if data_op==1 & year==2018, by(gender2)


*Table 3: Citations by First/Last Author Gender Pairs 
table gender2 gender1 if data_op==1, c(median numberofcitationstodate iqr numberofcitationstodate) 

sum numberofcitationstodate if data_op==1 & first_last==1, detail 
sum numberofcitationstodate if data_op==1 & first_last==2, detail 
sum numberofcitationstodate if data_op==1 & first_last==3, detail 
sum numberofcitationstodate if data_op==1 & first_last==4, detail 

kwallis numberofcitationstodate if data_op==1, by(first_last)  


*Table 4: Citations for Commentary Articles 
sum numberofcitationstodate if data_op==2 & gender1=="female", detail
sum numberofcitationstodate if data_op==2 & gender1=="male", detail
median numberofcitationstodate if data_op==2, by(gender1) 

sum numberofcitationstodate if data_op==2 & gender1=="female" & year==2015, detail
sum numberofcitationstodate if data_op==2 & gender1=="male" & year==2015, detail
median numberofcitationstodate if data_op==2 & year==2015, by(gender1)

sum numberofcitationstodate if data_op==2 & gender1=="female" & year==2016, detail
sum numberofcitationstodate if data_op==2 & gender1=="male" & year==2016, detail
median numberofcitationstodate if data_op==2 & year==2016, by(gender1)

sum numberofcitationstodate if data_op==2 & gender1=="female" & year==2017, detail
sum numberofcitationstodate if data_op==2 & gender1=="male" & year==2017, detail
median numberofcitationstodate if data_op==2 & year==2017, by(gender1)

sum numberofcitationstodate if data_op==2 & gender1=="female" & year==2018, detail
sum numberofcitationstodate if data_op==2 & gender1=="male" & year==2018, detail
median numberofcitationstodate if data_op==2 & year==2018, by(gender1)



sum numberofcitationstodate if data_op==2 & gender2=="female", detail
sum numberofcitationstodate if data_op==2 & gender2=="male", detail
median numberofcitationstodate if data_op==2, by(gender2) 

sum numberofcitationstodate if data_op==2 & gender2=="female" & year==2015, detail
sum numberofcitationstodate if data_op==2 & gender2=="male" & year==2015, detail
median numberofcitationstodate if data_op==2 & year==2015, by(gender2)

sum numberofcitationstodate if data_op==2 & gender2=="female" & year==2016, detail
sum numberofcitationstodate if data_op==2 & gender2=="male" & year==2016, detail
median numberofcitationstodate if data_op==2 & year==2016, by(gender2)

sum numberofcitationstodate if data_op==2 & gender2=="female" & year==2017, detail
sum numberofcitationstodate if data_op==2 & gender2=="male" & year==2017, detail
median numberofcitationstodate if data_op==2 & year==2017, by(gender2)
 
sum numberofcitationstodate if data_op==2 & gender2=="female" & year==2018, detail
sum numberofcitationstodate if data_op==2 & gender2=="male" & year==2018, detail
median numberofcitationstodate if data_op==2 & year==2018, by(gender2)



sum numberofcitationstodate if data_op==2 & first_last==1, detail 
sum numberofcitationstodate if data_op==2 & first_last==2, detail 
sum numberofcitationstodate if data_op==2 & first_last==3, detail 
sum numberofcitationstodate if data_op==2 & first_last==4, detail 
kwallis numberofcitationstodate if data_op==2, by(first_last)  


*Table 4 (continued): Citations per Year for Commentary Articles 
sum cites_adj365 if data_op==2 & gender1=="female", detail
sum cites_adj365 if data_op==2 & gender1=="male", detail
median cites_adj365 if data_op==2, by(gender1) 

sum cites_adj365 if data_op==2 & gender1=="female" & year==2015, detail
sum cites_adj365 if data_op==2 & gender1=="male" & year==2015, detail
median cites_adj365 if data_op==2 & year==2015, by(gender1)

sum cites_adj365 if data_op==2 & gender1=="female" & year==2016, detail
sum cites_adj365 if data_op==2 & gender1=="male" & year==2016, detail
median cites_adj365 if data_op==2 & year==2016, by(gender1)

sum cites_adj365 if data_op==2 & gender1=="female" & year==2017, detail
sum cites_adj365 if data_op==2 & gender1=="male" & year==2017, detail
median cites_adj365 if data_op==2 & year==2017, by(gender1)

sum cites_adj365 if data_op==2 & gender1=="female" & year==2018, detail
sum cites_adj365 if data_op==2 & gender1=="male" & year==2018, detail
median cites_adj365 if data_op==2 & year==2018, by(gender1)



sum cites_adj365 if data_op==2 & gender2=="female", detail
sum cites_adj365 if data_op==2 & gender2=="male", detail
median cites_adj365 if data_op==2, by(gender2) 

sum cites_adj365 if data_op==2 & gender2=="female" & year==2015, detail
sum cites_adj365 if data_op==2 & gender2=="male" & year==2015, detail
median cites_adj365 if data_op==2 & year==2015, by(gender2)

sum cites_adj365 if data_op==2 & gender2=="female" & year==2016, detail
sum cites_adj365 if data_op==2 & gender2=="male" & year==2016, detail
median cites_adj365 if data_op==2 & year==2016, by(gender2)

sum cites_adj365 if data_op==2 & gender2=="female" & year==2017, detail
sum cites_adj365 if data_op==2 & gender2=="male" & year==2017, detail
median cites_adj365 if data_op==2 & year==2017, by(gender2)

sum cites_adj365 if data_op==2 & gender2=="female" & year==2018, detail
sum cites_adj365 if data_op==2 & gender2=="male" & year==2018, detail
median cites_adj365 if data_op==2 & year==2018, by(gender2)






