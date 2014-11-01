#!/bin/sh

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
 
###############################################################################
# General UI/UX
###############################################################################
 
echo ""
echo "Would you like to set your computer name (as done via System Preferences >> Sharing)?  (y/n)"
read -r response
case $response in
  [yY])
      echo "What would you like it to be?"
      read COMPUTER_NAME
      sudo scutil --set ComputerName $COMPUTER_NAME
      sudo scutil --set HostName $COMPUTER_NAME
      sudo scutil --set LocalHostName $COMPUTER_NAME
      sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME
#      break;;
#  *) break
     ;;
esac
