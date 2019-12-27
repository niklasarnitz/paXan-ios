# paXan-iOS
## Introduction
Welcome to the repository of the paXan app.
In the following readme you will find Instructions on how to build and run the app on your own Mac.

## Installing/Building
1. Download Xcode from the AppStore on your Mac computer
2. Install [homebrew](https://brew.sh) by running the given command in your Terminal.app
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
3.1 Since we use [accio](https://github.com/JamitLabs/Accio) as a dependency manager, install that by running the following commands in your Terminal.app
```bash
brew tap JamitLabs/Accio https://github.com/JamitLabs/Accio.git
brew install accio
```
3.2 Since accio uses carthage to build the dependencies, install that aswell using brew:
```bash
brew install carthage
```
4. Clone the repository into a local directory on your computer
```bash
git clone https://github.com/niklasarnitz/paXan-ios.git
```
5. Now change your working directory to your downloaded repository
```bash
cd paXan-ios
```
6. Download and build the dependencies using accio
```bash
accio update
```
7. As a linter, we use [SwiftLint](https://github.com/realm/SwiftLint). Download and install it using brew
```bash
brew install swiftlint
```
8. Now you are ready to build the app.
```bash
open paXan.xcodeproj/
```
## Installing the app on a iPhone
1. Choose your AppleID as a development team
2. Plugin your iPhone over USB and unlock it
3. Choose your iPhone as your target
4. Click the play button
5. Have fun :)

## Deploying to TestFlight using Fastlane
1. Install fastlane
```bash
# Using RubyGems
sudo gem install fastlane -NV
# Alternatively using Homebrew
brew cask install fastlane
```
2. Run ```bash fastlane beta``` in this repository
3. Enter your credentials for AppStoreConnect

## Create Screenshots using Fastlane
1. Install fastlane
```bash
# Using RubyGems
sudo gem install fastlane -NV
# Alternatively using Homebrew
brew cask install fastlane
```
2. Run ```bash fastlane snapshot```
3. You will now find the screenshots in the ```screenshots``` folder

## 3rd Party Licenses
In the paXan app, we are using a few different libaries/dependencies to make our live a bit easier. You may find them listed below:
- [SnapKit](https://github.com:SnapKit/SnapKit)
- [SwiftyUserDefaults](https://github.com:sunshinejr/SwiftyUserDefaults)
- [IQKeyboardManager](https://github.com:hackiftekhar/IQKeyboardManager)

## Contributors
You can see the contributors in the CONTRIBUTORS.md file.

## License
This repo has a GNU GPLv3 license. See LICENSE.md
