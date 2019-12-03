# paXan-iOS
## Introduction
Welcome to the repository of the paXan app.
In the following readme you will find Instructions on how to build and run the app on your own Mac.

## Installing/Building
1. Download Xcode from the AppStore on your Mac computer
2. Install [homebrew](https://brew.sh) by running the given command in your Terminal.app
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
3.1 Since we use [accio](https://github.com/JamitLabs/Accio) as a dependency manager, install that by running the following commands in your Terminal.app
```
brew tap JamitLabs/Accio https://github.com/JamitLabs/Accio.git
brew install accio
```
3.2 Since accio uses carthage to build the dependencies, install that aswell using brew:
```
brew install carthage
```
4. Clone the repository into a local directory on your computer
```
git clone https://github.com/niklasarnitz/paXan-ios.git
```
5. Now change your working directory to your downloaded repository
```
cd paXan-ios
```
6. Download and build the dependencies using accio
```
accio update
```
7. As a linter, we use [SwiftLint](https://github.com/realm/SwiftLint). Download and install it using brew
```
brew install swiftlint
```
8. Now you are ready to build the app.
```
open paXan.xcodeproj/
```
## Installing the app on a iPhone
1. Choose your AppleID as a development team
2. Plugin your iPhone over USB and unlock it
3. Choose your iPhone as your target
4. Click the play button
5. Have fun :)

## Contributors
You can see the contributors in the CONTRIBUTORS.md file.

## License
This repo has a GNU GPLv3 license. See LICENSE.md
