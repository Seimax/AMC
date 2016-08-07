#AMC v1.0.0
Auto Mapchanger for Killing Floor 2
Copyright (C) 2016 Maximilian Seidel

http://uwe.hackerknowledge.de


This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.


# Changelog:

v1.0.0:

Advertising Support

Fixed Bug in Binary which prevent start on some machines


v0.0.3:

Bugfixes

v0.0.2:

Add support for Map List

# Installation

### Windows:

Download the newest Release and unpack it.

Edit the `amc.ini` for your needs and run the `amc.exe`

### Linux:

Download the `amx.pl` and `amx.ini`.

Edit the `amc.ini` for your needs and run `perl amc.pl`

__Warning: It could be that u need to download some prerequisites!__



Your Adminuser needs Permissions on:
```
/ServerAdmin/current/info
/ServerAdmin/console
/ServerAdmin/current/chat
```

# Example amc.ini:
```
[Main]
Interrupt=60 # Sleep Timer after every Scan
ServerAlias=server1,server2 #Populate alias for your Servers for this Config file

[adv01] 
Message=Thanks for playing on %Servername%!  # Availible Variables: %Map% %Servername% %Playercount%
Interval=300
FirstStartDelay=0


[adv02]
Message=Checkout also our other server! Visit http://uwe.hackerknowledge.de
Interval=300
FirstStartDelay=30 # To avoid doubleposting

[server1] #Alias from [Main].ServerAlias
Host=http://server1.yourdomain.de:8080 #Webadmin Domain
Username= #Webadmin User
Password= #Webadmin Password
DefaultMaps=KF-Biolabs,KF-Prison #Map which u want to change if server is empty
WaitForSwitch=300 #in Seconds, after this time the script switch the map if the playercount is still 0
ActiveAds=adv01,adv02 #activate the Ads

[server2] #Alias from [Main].ServerAlias
Host=http://server2.yourdomain.de:8080 #Webadmin Domain
Username= #Webadmin User
Password= #Webadmin Password
DefaultMaps=KF-Outpost,KF-Farmhouse #Map which u want to change if server is empty
WaitForSwitch=300 #in Seconds, after this time the script switch the map if the playercount is still 0
ActiveAds=adv01,adv02 #activate the Ads
```