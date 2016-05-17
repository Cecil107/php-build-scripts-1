#!/bin/bash
# ImagicalMine Installation Script for Mac OS X and Linux(master)
#  _    _            _    _______ 
# | |  | |    /\    | |  |__   __|
# | |__| |   /  \   | |     | |   
# |  __  |  / /\ \  | |     | |   
# | |  | | / ____ \ | |____ | | _ 
# |_|  |_|/_/    \_\|______||_|(_)
# 
# This file is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
# Before you start doing anything, read the license for more detail into what you are allowed to do and not do.

l="install_log/log"
le="install_log/log_errors"
lp="install_log/log_php"
lpe="install_log/log_php_errors"
w="install_log/log_wget"
wp="install_log/log_wget_php"

function message() {
 # download and include the language file 
 # in language file you can define variables for each string that should translated
 # in this script you can replace the string with the variablename from language file
  if [ ! -d "language" ]; then
    mkdir "language"
  fi
  if [ ! -d "install_log" ]; then
    mkdir "install_log"
  fi
  curl -O language/$o.sh https://raw.githubusercontent.com/ImagicalCorp/php-build-scripts/master/language/$o.sh >>./$l 2>>./$le
  wget https://raw.githubusercontent.com/ImagicalCorp/php-build-scripts/master/language/$o.sh -O language/$o.sh >>./$l 2>>./$le
  . language/$o.sh
}

while :
do
clear
cat << "EOF"

  _                       _           _ __  __ _             
 (_)                     (_)         | |  \/  (_)            
  _ _ __ ___   __ _  __ _ _  ___ __ _| | \  / |_ _ __   ___  
 | | '_ ` _ \ / _` |/ _` | |/ __/ _` | | |\/| | | '_ \ / _ \ 
 | | | | | | | (_| | (_| | | (_| (_| | | |  | | | | | |  __/ 
 |_|_| |_| |_|\__,_|\__, |_|\___\__,_|_|_|  |_|_|_| |_|\___| 
                     __/ |                                   
                    |___/  
   
EOF

echo "system> Welcome to the ImagicalMine installer!"
echo "system> If your language is not listed below, feel free to fork the ImagicalMine/php-build-scripts repository on GitHub and translate it for us, then make a pull request so this installer includes your language."
echo "system> Please choose which language you want to use during the installation:"
echo "system>   1) English"
echo "system>   2) German"
echo "system>   3) Exit ImagicalMine installation"
# read -e -p "system> Number (e.g. 1): " k
read -e -p "system> Number (e.g. 1): " k </dev/tty
 case "$k" in 
	1 ) o="en"; message "en";;
	2 ) o="de"; message "de";;
        3 ) exit 1;;
        * ) echo "error> An unexpected error occurred - you entered an unknown selection. Restart the script, and then choose again."; exit 1;;
 esac

# this is how to call the function message and pass the input(selected langugae) as argument
# message "en"
# echo $message_hello_world
echo
echo $language_selected
echo
echo $php_prompt
echo $linux_32
echo $linux_64
echo $mac_32
echo $mac_64
echo $rpi2
echo $exit1
# read -e -p "$no_selection" a
read -e -p "$no_selection" a </dev/tty
 case "$a" in 
	1 ) z="PHP_7.0.3_x86_Linux.tar.gz";;
	2 ) z="PHP_7.0.3_x86-64_Linux.tar.gz";;
        3 ) z="PHP_7.0.3_x86_MacOS.tar.gz";;
        4 ) z="PHP_7.0.3_x86-64_MacOS.tar.gz";;
        5 ) z="RPI2";;
        6 ) exit 1;;
        * ) echo $error_selection; exit 1;;
 esac

l="install_log/log"
le="install_log/log_errors"
lp="install_log/log_php"
lpe="install_log/log_php_errors"
w="install_log/log_wget"
wp="install_log/log_wget_php"

	echo $im_install_echo
	if [ "$z" == "PHP_7.0.3_x86_Linux.tar.gz" ]; then
	curl -O https://github.com/ImagicalCorp/ImagicalMine/archive/master.zip >>./$w 2>>./$w
	elif [ "$z" == "PHP_7.0.3_x86-64_Linux.tar.gz" ]; then
	wget https://github.com/ImagicalCorp/ImagicalMine/archive/master.zip >>./$w 2>>./$w
	else
	curl -O https://github.com/ImagicalCorp/ImagicalMine/archive/master.zip >>./$w 2>>./$w
	fi
	chmod 777 master.zip >>./$l 2>>./$le
	unzip -o master.zip >>./$l 2>>./$le
	chmod 777 ImagicalMine-master >>./$l 2>>./$le
	cd ImagicalMine-master >>./$l 2>>./$le
	chmod 777 src >>../$l 2>>../$le
	cp -rf src .. >>../$l 2>>../$le
	cd .. >>../$l 2>>../$le
	rm -rf ImagicalMine-master >>./$l 2>>./$le
	rm -rf master.zip >>./$l 2>>./$le
	if [ "$z" == "PHP_7.0.3_x86_Linux.tar.gz" ]; then
	curl -O --insecure https://raw.githubusercontent.com/ImagicalCorp/ImagicalMine/master/start.sh >>./$l 2>>./$le
	curl -O --insecure https://raw.githubusercontent.com/ImagicalCorp/ImagicalMine/master/LICENSE.md >>./$l 2>>./$le
	elif [ "$z" == "PHP_7.0.3_x86-64_Linux.tar.gz" ]; then
	curl -O --insecure https://raw.githubusercontent.com/ImagicalCorp/ImagicalMine/master/start.sh >>./$l 2>>./$le
	curl -O --insecure https://raw.githubusercontent.com/ImagicalCorp/ImagicalMine/master/LICENSE.md >>./$l 2>>./$le
	else
        wget --no-check-certificate https://raw.githubusercontent.com/ImagicalCorp/ImagicalMine/master/start.sh >>./$l 2>>./$le
        wget --no-check-certificate https://raw.githubusercontent.com/ImagicalCorp/ImagicalMine/master/LICENSE.md >>./$l 2>>./$le
        fi
        chmod 777 start.sh >>./$l 2>>./$le
	echo
	echo $php_install_echo
	if [ "$z" == "RPI2" ]; then
        wget --no-check-certificate https://raw.githubusercontent.com/keithkfng/my-files-and-icons/master/raspberry_php.tar.gz >>./$wp 2>>./$wp
        chmod 777 rasp* >>./$lp 2>>./$lpe
	tar zxvf rasp* >>./$lp 2>>./$lpe
	rm -r rasp* >>./$lp 2>>./$lpe
	elif [ "$z" == "PHP_7.0.3_x86_Linux.tar.gz" ]; then
	curl -O --insecure https://dl.bintray.com/pocketmine/PocketMine/$z >>./$wp 2>>./$wp
	elif [ "$z" == "PHP_7.0.3_x86-64_Linux.tar.gz" ]; then
	curl -O --insecure https://dl.bintray.com/pocketmine/PocketMine/$z >>./$wp 2>>./$wp
	else
	wget --no-check-certificate https://dl.bintray.com/pocketmine/PocketMine/$z >>./$wp 2>>./$wp
	fi
	chmod 777 PHP* >>./$lp 2>>./$lpe
	tar zxvf PHP* >>./$lp 2>>./$lpe
	rm -r PHP* >>./$lp 2>>./$lpe
	echo
        echo $loop_prompt
        echo $yes
        echo $no
        # read -e -p "$no_selection" t
        read -e -p "$no_selection" t </dev/tty
        case "$t" in
	1 ) c="y";;
	2 ) c="n";;
        * ) echo $error_selection; exit 1;;
        esac
		if [ "$c" == "y" ]||[ "$c" == "Y" ]; then
                sed -i 's/DO_LOOP="no"/DO_LOOP="yes"/' start.sh
		else
                sed -i 's/DO_LOOP="yes"/DO_LOOP="no"/' start.sh
		fi        
        echo
        echo $installation_complete
exit 0
done
