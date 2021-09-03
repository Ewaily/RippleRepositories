# RippleRepositories


## RippleRepositories is an iOS application built as an assessment task at Ripple Egypt. Built Using RxSwift & MVVM (Model-View-ViewModel) and Clean Architecture concepts


[![Build Status](https://github.com/KarimEbrahemAbdelaziz/SwiftyMenu/workflows/Build/badge.svg)]() [![Build Status](https://img.shields.io/badge/Swift-5.2-orange.svg)]() [![Build Status](http://img.shields.io/badge/Cocoapods-available-green.svg?style=flat)]()

RippleRepositories is an iOS mobile app that display list of Github repositories queried from a public API and much more..


# Features

- Lists Github repositories queried from a public API
- Detailed cell for each retrieved repository displays the owner avatar image, the repository name and the repository description.
- Two app targets, one for remote data and another for the mock data
- Support both orientations portrait and landscape
- Cache the last query response, so the app could work in offline mode
- Unit tests for both mock and remote
- RxSwift
- Supports iOS 11.0 and later

# Demo
![RippleRepositories Online Mode](README_Resources/remote.gif) ![RippleRepositories Offline Mode](README_Resources/cache.gif) 

# Run Requirements

- Xcode 12.5.1 (12E507)
- Swift 5


# Installation
Check out to develop branch
#### CocoaPods
[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. 
or simply do this 👇
```sh
$ sudo gem install cocoapods
```

Install the dependencies and devDependencies and run via **`RippleRepositories.xcworkspace`** 

```sh
cd RippleRepositories/RippleRepositories 
$ pod install
```

