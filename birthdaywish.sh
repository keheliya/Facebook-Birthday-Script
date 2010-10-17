#!/bin/bash

NOW=$(date +"%m/%d")

#Enter your access token below within quotations
ACCESS_TOKEN="blah-blah-blah-your-precious-access-token"

#Get the names and UIDs of your unfortunate friends born on a day like today
curl "https://api.facebook.com/method/fql.query?access_token=$ACCESS_TOKEN&query=SELECT%20first_name,uid%20from%20user%20where%20uid%20in%20(SELECT%20uid2%20from%20friend%20where%20uid1=564121985)AND%20substr(birthday_date,0,5)%20==%20'$NOW'" > birthdaywishtemp.xml

names=`sed -n -e 's/.*<first_name>\(.*\)<\/first_name>.*/\1/p' birthdaywishtemp.xml`
ids=`sed -n -e 's/.*<uid>\(.*\)<\/uid>.*/\1/p' birthdaywishtemp.xml`

F_ARRAY=( `echo ${names}` )
U_ARRAY=( `echo ${ids}` )

#Wish each of them with the same old boring message
for (( i = 0 ; i < ${#U_ARRAY[@]} ; i++ ))
do
curl 'https://graph.facebook.com/${U_ARRAY[$i]}'
curl -F 'access_token='$ACCESS_TOKEN'' \
    -F 'message=Hey, Happy Birthday...'${F_ARRAY[$i]} \
    https://graph.facebook.com/${U_ARRAY[$i]}/feed >> birthdaywishbackup.log

#Let you know the progress
echo "Wished ${F_ARRAY[$i]}" >> birthdaywishbackup.log
done

echo "Completed on $(date)" >> birthdaywishbackup.log

