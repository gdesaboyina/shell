IPFDIR=$CEDL_HOME/informatica/infa_shared/SrcFiles/$app
FTPDIR=/home/$CEDL_FTP_USR/ftp/incoming/uas_fe


cd $FTPDIR

eXitMe $? "Could not change to '$FTPDIR'"

x=`ls -t assessment_*.csv`

echo $x

y=`ls -t programplan_*.csv`

echo $y


#z=`echo $x:$y:$u`

z=UAS_FE_Assessment_Programplan_Indirect

cd $IPFDIR

cp $FTPDIR/*.csv $IPFDIR

for i in $x ; do 

#############  Check for footers like below  #########################

  egrep -i 'This report contains|Classified by the' $i

  if [ $? = 0 ] ;then

     # If footer has text. exclude that text and copy the contents to $IPFDIR

     egrep -iv 'This report contains|Classified by the' $i > ${i}.temp
     mv ${i}.temp $i
  fi

done


for j in $y ; do   

 #############  Check for footers like below  #########################

 egrep -i 'This report contains|Classified by the' $j

   if [ $? = 0 ] ;then

     # If footer has text. exclude that text and copy the contents to $IPFDIR

     egrep -iv 'This report contains|Classified by the' $j > ${j}.temp
     mv ${j}.temp $j

   fi  

done

# Record count

a=$(wc -l < assessment_*.csv )

echo $a

b=$(wc -l < programplan_pre.csv)

echo $b

recordcount=`expr $a + $b`



