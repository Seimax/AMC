#AMC v0.0.1
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



Windows:

Download the newes Release and unpack it.

Edit the amc.ini for your needs and run the amc.exe

Linux:

Download the amx.pl and amx.ini.


Your Adminuser needs Permissions on:
/ServerAdmin/current/info
/ServerAdmin/console


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