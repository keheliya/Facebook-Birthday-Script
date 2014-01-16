Why I wrote this script
-------------------------------------------
To find out the motive behind this,
read [this](http://galpotha.wordpress.com/2010/07/04/the-loser%e2%80%99s-script-how-to-wish-facebook-friends-on-their-birthdays-automatically-in-linux/) blog post.
How to use this script
-------------------------------------------

**Step 1:** Install cURL and Gnome-schedule

cURL is a command line tool for transferring data using various protocols. Gnome-schedule is a GUI for managing cron-jobs. Install them by running the famous command

	sudo apt-get install curl gnome-schedule

**Step 2:** Setup a new application

Goto [Facebook Developers Page](http://www.facebook.com/developers/) and setup a new application. Fill in all the required fields. Don’t forget to set ‘Application Type’ to ‘Desktop’. Remember the ‘Application ID’ and ‘Application secret’ given in the end of the process.

**Step 3:** Request an OAuth access token with the proper permissions
Facebook Graph API authorization documentation Has a detailed explanation about this. But if you are in a hurry,

Enter the following URL in your browser, replacing YOUR_APPLICATION_ID with the application ID you got in the earlier step.

	https://graph.facebook.com/oauth/authorize?client_id=YOUR_APLICATION_ID&amp;redirect_uri=http://www.facebook.com/connect/login_success.html&amp;type=user_agent&amp;display=popup&amp;scope=offline_access,publish_stream,friends_birthday

After a successful login and granting necessary permissions,  you will be given a verification code. Save it for later use.
Enter the following URL in your browser, replacing YOUR_APPLICATION_ID with ‘Application ID’ and YOUR_API_SECRET with ‘Application secret’ you got earlier, and VERIFICATION_CODE with the code you got in the previous step.

	https://graph.facebook.com/oauth/access_token?client_id=YOUR_APLICATION_ID&amp;redirect_uri=http://www.facebook.com/connect/login_success.html&amp;client_secret=YOUR_API_SECRET&amp;code=VERIFICATION_CODE
Now you will be given the precious ‘Access Token’. Save it somewhere
**WARNING:** Facebook does not recommend following this procedure and storing Access Tokens or Application secrets in desktop applications, because if somebody gets hold of that code, you are dead. I mean your facebook profile security is severely compromised and can be used in any malicious way they desire.

**Step 4:** Writing the script

Just copy the script and save it in a file like ‘/home/yourName/birthdayscript.sh’ after  entering THE precious access token of yours in the proper place.

Now you can browse to the location where you saved the script via terminal and execute the script with the command

	./birthdayscript.sh
And you can see the progress in the file birthdaywishbackup.log

**Step 5:** Automating the script

Yes, it is of no use if you have to run this manually each and everyday to wish somebody. So you can schedule it to run and write automagically on walls of birthday boys/gals everyday. If you are the geekiest type you can do it using a cron-job and you won’t need this tutorial anyway. But if you are interested, you can find how to do that here.
For the ordinary geek, there’s this dumb-simple GUI based tool called gnome-schedule. Run the command

	gnome-schedule
in a terminal and you will be able to come up with a scheduled cron-job like the following in few easy steps.

**IMPORTANT: **Make sure you set a time of the day that you will keep your computer switched on, because a cron-job is not god, and doesn’t know how turn on the computer it is running, by itself 

It’s done!!! Enjoy being a lazy, cold-hearted nerd, who has no sense of finer things in life.
