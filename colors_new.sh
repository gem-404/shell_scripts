#!/usr/bin/env bash

# Define color and style variables
CRE=$(tput setaf 1)  # Red # echo -e "\e[00;32m Text here \e[00m"
CYE=$(tput setaf 3)  # Yellow # echo -e "\e[00;33m Text here \e[00m"
CGR=$(tput setaf 2)  # Green # echo -e "\e[00;32m Text here \e[00m"
CBL=$(tput setaf 4)  # Blue
BLD=$(tput bold)     # Bold
CNC=$(tput sgr0)     # Reset

# Example usage
echo "${BLD}${CRE}This text is bold and red${CNC}"
echo "${CYE}This text is yellow${CNC}"
echo "${CGR}This text is green${CNC}"
echo "${CBL}This text is blue${CNC}"
echo "${CNC}This text is normal and default color"
