#!/bin/bash

# This can be used for debugging
message_hello_world="Hello world"

# Global messages(displayed multiple times throughout)
exit="system>   4) Exit PocketMine installation"
exit1="system>   6) Exit PocketMine installation"
no_selection="system> Number (e.g. 1):"
error_selection="error> An unexpected error occurred - you entered an unknown selection. Restart the script, and then choose again."

# Individual messages(only displayed once)
welcome_to_imagicalmine="system> Welcome to PocketMine!"
welcome_install_server="system> This installer will guide you through installing PocketMine for your server!"

language_translation="system> If your language is not listed below, feel free to fork the ImagicalCorp/php-build-scripts repository on GitHub and translate it for us, then make a pull request so this installer includes your language."
language_selection="system> Please choose which language you want to use during the installation:"
en="system>   1) English"
ch="system>   2) Chinese"
de="system>   3) German"

language_selected="system> You've selected English for the language to be used throughout installing PocketMine."
php_prompt="system> Select which PHP binary you want to install:"
linux_32="system>   1) Linux x86(32-bit)"
linux_64="system>   2) Linux x64(64-bit)"
mac_32="system>   3) Mac x86(32-bit)"
mac_64="system>   4) Mac x64(64-bit)"
rpi2="system>   5) Raspberry Pi 2"

im_install_echo="system> Installing PocketMine..."
php_install_echo="system> Installing PHP binary..."
loop_prompt="system> Do you want PocketMine to automatically restart your server if it stops or crashes?"
yes="system>   1) Yes"
no="system>   2) No"
installation_complete="system> PocketMine installation completed! Run ./start.sh (or ./st*) to start PocketMine."
