#! /bin/bash


CURRENT_TIME=`date +%d%H%M | awk "{print$1}" | sed 's/\///g'`
echo $CURRENT_TIME

#Search Package
function SearchApp()
{
	dpkg -l | grep xxx | awk NR==1 | awk '{print$5}'
	sleep 2
}

#Uinstall
function ScriptUninstall()
{
	echo 'aabbcc' | sudo -S dpkg --purge xxx
	if [ $? -eq 0 ];then
		sleep 10
		echo "Uninstall Success!"		

	else
		break
		exit 0
	fi
}

for i in {1..200}
do
	if [ $CURRENT_TIME -ge 030155 ];then
		
		#Block
		sleep 700
	
	else
		#Restart App Store
		xdotool mousemove 53 419
		sleep 1
		xdotool click --repeat 2 1
		sleep 12
		
		#double click windows Maxsize
		xdotool mousemove 789 207
		sleep 3

		xdotool click --repeat 2 1

		sleep 6

		#click mainWindow
		xdotool mousemove 78 74 click 1
		sleep 7

		#all categories
		xdotool mousemove 54 113 click 1
		sleep 6

		# Pics categories
		xdotool mousemove 800 65 click 1
		sleep 10

		#down swipe current window
		for j in {1..10}
		do
    		xdotool mousemove 690 342 click 5
		done

		sleep 3

		#click other
		xdotool mousemove 1586 529 click 1
		sleep 10

		#Return 
		xdotool mousemove 215 19 click 1
		sleep 7

		#click app
		xdotool mousemove 1574 836 click 1
		sleep 8

		#install app
		xdotool mousemove 1826 99 click 1
		sleep 400

		# open & wait
		xdotool mousemove 1826 99 click 1
		sleep 70

		#close app
		xdotool mousemove 329 1060 click 3
		sleep 2

		xdotool mousemove 362 1006 click 1
		sleep 6
		
		#close app store
		xdotool mousemove 1901 19 click 1
		sleep 6
		
		recv=$(SearchApp)
		echo $recv

		if [ "$recv" == "xxx" ];then
			echo "xxx is installled"
			sleep 3
			echo "Beging to Uninistall xxx..."

			ScriptUninstall

			echo "Success $i,times"

		else
			echo "uninstall fail,The$i,fail"
			break
		fi
		
	fi
	
done
