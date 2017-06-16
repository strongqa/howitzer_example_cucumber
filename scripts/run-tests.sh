#!/bin/bash
set -ev
bundle exec rake rubocop features:smoke
shopt -s nocasematch;
if [[ "$SEXY_SETTINGS" == "" || "$SEXY_SETTINGS" =~ .*phantomjs|poltergeist|headless_chrome|webkit.* ]]
then
    case "$SEXY_SETTINGS" in
        .*webkit.*)
            sudo apt-get install qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
            ;;
        .*headless_chrome.*)
             wget https://chromedriver.storage.googleapis.com/2.29/chromedriver_linux64.zip
             unzip chromedriver_linux64.zip
             sudo cp chromedriver /usr/local/bin/chromedriver
             export DISPLAY=:99.0
             sh -e /etc/init.d/xvfb start &
             sleep 3
             ;;
    esac
	bundle exec rake features:bvt features:p1 features:p2
fi
if [ "$SEXY_SETTINGS" =~ .*webkit.*]
