rvm install ruby-2.4.0
rvm use 2.4.0
brew install node # get node.js
brew install carthage
brew install libimobiledevice --HEAD  # install from HEAD to get important updates
brew install ideviceinstaller         # only works for ios 9. for ios 10, see below
sudo npm install -g appium  # get appium
sudo npm install -g ios-deploy --allow-root --unsafe-perm=true #ideviceinstaller doesn't work with iOS 10 yet. So we need to install ios-deploy
npm install # get appium client
bundle install
mkdir hms