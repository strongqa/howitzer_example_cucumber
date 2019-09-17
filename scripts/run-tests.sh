#!/bin/bash
set -ev
if [[ "$SEXY_SETTINGS" =~ .*headless_chrome.* ]]
then
    wget https://chromedriver.storage.googleapis.com/2.38/chromedriver_linux64.zip
    unzip chromedriver_linux64.zip
    sudo cp chromedriver /usr/local/bin/chromedriver
    sleep 3
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub 9 | sudo apt-key add -
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ 6 stable main" >> /etc/apt/sources.list.d/google-chrome.list'
    sudo apt-get update
    sudo apt-get install google-chrome-stable
fi
if [[ "$SEXY_SETTINGS" =~ .*headless_firefox.* ]]
then
    wget https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-linux64.tar.gz
    mkdir geckodriver
    tar -xzf geckodriver-v0.25.0-linux64.tar.gz -C geckodriver
    export PATH=$PATH:$PWD/geckodriver
    sleep 3
fi
if [[ "$SEXY_SETTINGS" =~ .*webkit.* ]]
then
    export DISPLAY=:99.0
    sh -e /etc/init.d/xvfb start &
    sleep 3
fi
if [[ "$SEXY_SETTINGS" =~ .*appium.* ]]
then
    bundle exec cucumber features/functionality/about_blank.feature
else
    bundle exec rake rubocop features:smoke
fi
shopt -s nocasematch;
if [[ "$SEXY_SETTINGS" == "" || "$SEXY_SETTINGS" =~ .*poltergeist|headless_chrome|headless_firefox|webkit.* ]]
then
	bundle exec rake features:bvt features:p1 features:p2
fi
