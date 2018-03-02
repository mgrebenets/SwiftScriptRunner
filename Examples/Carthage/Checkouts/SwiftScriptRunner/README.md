# SwiftScriptRunner

[![CI Status](http://img.shields.io/travis/mgrebenets/SwiftScriptRunner.svg?style=flat)](https://travis-ci.org/mgrebenets/SwiftScriptRunner)
[![Version](https://img.shields.io/cocoapods/v/SwiftScriptRunner.svg?style=flat)](http://cocoapods.org/pods/SwiftScriptRunner)
[![License](https://img.shields.io/cocoapods/l/SwiftScriptRunner.svg?style=flat)](http://cocoapods.org/pods/SwiftScriptRunner)
[![Platform](https://img.shields.io/cocoapods/p/SwiftScriptRunner.svg?style=flat)](http://cocoapods.org/pods/SwiftScriptRunner)

A simple utility for writing Swift scripts with async callbacks to 3rd party frameworks.

See [this blog post](http://mgrebenets.github.io/swift/2015/10/08/async-swift-scripting/) for more details.

## Requirements

- Xcode 7.0.1
- cocoapods gem version 0.38.2
- [cocoapods-rome](https://github.com/neonichu/Rome) gem version 0.2.0
- carthage version 0.8.0

## Installation

SwiftScriptRunner is available through [CocoaPods Rome](https://github.com/neonichu/Rome) and [Carthage](https://github.com/Carthage/Carthage).

### CocoaPods Rome

Make sure you have [cocoapods-rome](https://github.com/neonichu/Rome) Ruby gem installed.

Add the following line to your Podfile:

```ruby
platform :osx, "10.10"
use_frameworks!
plugin "cocoapods-rome"

pod "SwiftScriptRunner"
```

And run

```bash
pod install --no-integrate
```

### Carthage

Add the following line to your Cartfile:

```ruby
github "mgrebenets/SwiftScriptRunner"
```

And run

```bash
carthage update --platform mac
```

## Usage

Example with [Alamofire](https://github.com/Alamofire/Alamofire).

```swift
// alamofire.swift

import Alamofire
import SwiftScriptRunner

var runner = SwiftScriptRunner()
runner.lock() // Lock

Alamofire.request(.GET, "http://httpbin.org/get", parameters: ["foo": "bar"])
         .responseJSON { response in
             print(response.result)   // Result of response serialization
             runner.unlock() // Unlock
         }

runner.wait() // Wait
```

Now you can run it.

```bash
# When using CocoaPods
swift -F Rome alamofire.swift

# When using Carthage
swift -F Carthage/Build/Mac alamofire.swift
```

## Author

Maksym Grebenets, mgrebenets@gmail.com, [@mgrebenets](https://twitter.com/mgrebenets)

## License

SwiftScriptRunner is available under the MIT license. See the LICENSE file for more info.
