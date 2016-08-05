#!/usr/bin/perl
#AMC v0.0.2
#Auto Mapchanger for Killing Floor 2
#Copyright (C) 2016 Maximilian Seidel
#
#http://uwe.hackerknowledge.de
#
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.

use LWP;
use WWW::Mechanize;
use Web::Query qw();
use Data::Dump qw(dump);
use Config::IniFiles;
##########CONFIGURATION PART################################
my $cfg = Config::IniFiles->new( -file => "amc.ini" );
if(!defined $cfg)
{
	print "Failed to open/parse amc.ini";
	<>;
	exit;
}
@servers = split /,/, $cfg->val('Main', 'ServerAlias');
my $interrupt = $cfg->val('Main', 'Interrupt'); #in seconds
############################################################
###########CONST PART############################################
$main_version = 0;
$sp_version = 0;
$patch_version = 3;
			  
$software  = "Auto Mapchanger for Killing Floor 2";
$short = "AMC v" . $main_version . "." . $sp_version . "." . $patch_version;
$copyright = "Copyright (C) 2016 Maximilian Seidel";
$url = "http://uwe.hackerknowledge.de";
############################################################
print "#############################################";
print "\n### " . $short . "                            ###";
print "\n### " . $software . "   ###";
print "\n### " . $copyright . "  ###";
print "\n### Visit : " . $url . " ###";
print "\n#############################################\n";
sleep(5);
###########MAGIC PART############################################
my %h_host;
my $conn;
while (1) {
	print "Initialize new scan!\n";
	sleep(2);
	foreach $server (@servers) {
		
		my $host	    = $cfg->val($server, 'Host');
		my $username    = $cfg->val($server, 'Username');
		my $password    = $cfg->val($server, 'Password');
		my @default_maps = split /,/, $cfg->val($server, 'DefaultMaps');
		my $wait_for_switch = $cfg->val($server, 'WaitForSwitch'); #in seconds
		
		print "\n###############################################";
		print "\nHost        : $host";
		
		my $mech = WWW::Mechanize->new(timeout=>120);
		$mech->cookie_jar(HTTP::Cookies->new());
		eval {
		
			my $resp = $mech->get($host . '/ServerAdmin/');
			$resp->is_success or die $resp->status_line;
			
			$mech->form_name('loginform');
			$mech->field ('username' => $username);
			$mech->field ('password' => $password);
			$mech->click('');

			my $w = Web::Query->new_from_html($mech-> content());
			
			my $rules = $w->find('#currentRules')->text;
			($playercount)= $rules =~ /Players(.*)Minimum/;
			($playercount_cur)= $playercount =~ /(.*)\//;
			
			my $currentGame = $w->find('#currentGame')->as_html;
			($map) = $currentGame =~ /<dt>Map<\/dt><dd title="(.*)">/;
			($servername)= $currentGame =~ /<dt>Server Name<\/dt><dd>(.*)<\/dd><dt>Cheat/;
			$conn = 1;

		};
		
		if ($@) 
		{
			$servername = 'Not available';
			$playercount = '0/0';
			$map = 'Not available';
			$conn = 0;
		}

		
		print "\nServername  : $servername";
		print "\nPlayercount : $playercount";
		print "\nMap         : $map";
		
		
		if($playercount_cur == 0 && $conn)
		{
		
		   if(not defined $h_host{$server})
		   {
				$h_host{$server} = time;
		   }
		   else
		   {
		   	if($h_host{$server} < time-$wait_for_switch)
		   	{
				$default_map = @default_maps[int(rand(@default_maps))];
				eval {
					$resp = $mech->get($host . '/ServerAdmin/console');
					$resp->is_success or die $resp->status_line;
					print "\n!!! Switch Map to " . $default_map . " !!!";
					$mech->form_name('');
					$mech->field ('command' => 'Switch ' . $default_map);
					$mech->click('');
					$h_host{$server} = undef;
				};
				if ($@) 
				{
                   print "Error while Mapchange!\n";
                }

			}
		   }
		}
		else
		{
			$h_host{$server} = undef;
		}
		
		if(defined $h_host{$server})
		{
			print "\nSwitch map at " . localtime($h_host{$server} + $wait_for_switch);
		}
		
		$conn = undef;
	}
	print "\n###############################################";
	print "\n\nWait for " . $interrupt . " seconds\n";
	sleep($interrupt);
}

