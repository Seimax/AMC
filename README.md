# AMC
Auto Mapchanger for Killing Floor 2

Windows:

Download the newes Release and unpack it.

Edit the amc.ini for your needs and run the amc.exe

Linux:

Download the amx.pl and amx.ini.



Example amc.ini:

[Main]
Interrupt=60 # Sleep Timer after every Scan
ServerAlias=server1,server2 #Populate alias for your Servers for this Config file

[server1] #Alias from [Main].ServerAlias
Host=http://server1.yourdomain.de:8080 #Webadmin Domain
Username= #Webadmin User
Password= #Webadmin Password
DefaultMap=KF-Biolabs #Map which u want to change if server is empty
WaitForSwitch=300 #in Seconds, after this time the script switch the map if the playercount is still 0

[server2] #Alias from [Main].ServerAlias
Host=http://server2.yourdomain.de:8080 #Webadmin Domain
Username= #Webadmin User
Password= #Webadmin Password
DefaultMap=KF-Outpost #Map which u want to change if server is empty
WaitForSwitch=300 #in Seconds, after this time the script switch the map if the playercount is still 0