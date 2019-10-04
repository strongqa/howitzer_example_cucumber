#!/bin/bash
set -ev
TURNIP_STATE=("started")
RSPEC_STATE=("started")
while [[ " ${TURNIP_STATE[*]} " == *"started"* ]] || [[ " ${RSPEC_STATE[*]} " == *"started"* ]]; do
        sleep 5
        TURNIP_STATE=$(curl -s -X GET \
       -H "Content-Type: application/json" \
       -H "Accept: application/json" \
       -H "Travis-API-Version: 3" \
       -H "Authorization: token ${QA_TOKEN}" \
       https://api.travis-ci.org/repo/${TURNIP_SLUG}/builds | jq -r '[.builds[].state]' )
        RSPEC_STATE=$(curl -s -X GET \
       -H "Content-Type: application/json" \
       -H "Accept: application/json" \
       -H "Travis-API-Version: 3" \
       -H "Authorization: token ${QA_TOKEN}" \
       https://api.travis-ci.org/repo/${RSPEC_SLUG}/builds | jq -r '[.builds[].state]' )
done
if [[ "$SEXY_SETTINGS" =~ .*headless_chrome.* ]]
then
    wget https://chromedriver.storage.googleapis.com/2.38/chromedriver_linux64.zip
    unzip chromedriver_linux64.zip
    sudo cp chromedriver /usr/local/bin/chromedriver
    sleep 3
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
