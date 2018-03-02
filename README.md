# SwiftScriptRunner

[![CI Status](http://img.shields.io/travis/mgrebenets/SwiftScriptRunner.svg?style=flat)](https://travis-ci.org/mgrebenets/SwiftScriptRunner)
[![Version](https://img.shields.io/cocoapods/v/SwiftScriptRunner.svg?style=flat)](http://cocoapods.org/pods/SwiftScriptRunner)
[![License](https://img.shields.io/cocoapods/l/SwiftScriptRunner.svg?style=flat)](http://cocoapods.org/pods/SwiftScriptRunner)
[![Platform](https://img.shields.io/cocoapods/p/SwiftScriptRunner.svg?style=flat)](http://cocoapods.org/pods/SwiftScriptRunner)

A simple utility for writing Swift scripts with async callbacks to 3rd party frameworks.

See [this blog post](http://mgrebenets.github.io/swift/2015/10/08/async-swift-scripting/) for more details.

## Requirements

- Xcode 9.2
- cocoapods gem version 1.4.0
- [cocoapods-rome](https://github.com/neonichu/Rome) gem version 0.8.0
- carthage version 0.28.0

## Installation

SwiftScriptRunner is available through [CocoaPods Rome](https://github.com/neonichu/Rome) and [Carthage](https://github.com/Carthage/Carthage).

### CocoaPods Rome

Make sure you have [cocoapods-rome](https://github.com/neonichu/Rome) Ruby gem installed.

Add the following line to your `Podfile`:

```ruby
platform :osx, "10.10"
use_frameworks!
plugin "cocoapods-rome"

pod "SwiftScriptRunner", "~> 1.0.1"
```

And run

```bash
pod install
```

### Carthage

Add the following line to your `Cartfile`:

```ruby
github "mgrebenets/SwiftScriptRunner", ~> 1.0.1
```

And run

```bash
carthage update --platform mac
```

### Swift Package Manager

_TODO:_

## Usage

Example of asynchronous network request using [Alamofire](https://github.com/Alamofire/Alamofire).

```swift
// Shebangs for using with different dependency managers.
//
// - Carthage:
// #!/usr/bin/env xcrun swift -F Carthage/Build/Mac
// - CocoaPods Rome:
// #!/usr/bin/env xcrun swift -F Rome
// - Swift Package Manager:

// Example.swift

import Alamofire
import SwiftScriptRunner

var runner = SwiftScriptRunner()
runner.lock() // Lock

Alamofire.request("http://httpbin.org/get")
    .responseJSON { response in
         print("Successful response:")
         print(response)   // Result of response serialization
         runner.unlock() // Unlock
    }

runner.wait() // Wait
```

Now you can run it.

```bash
# When using CocoaPods
swift -F Rome Example.swift

# When using Carthage
swift -F Carthage/Build/Mac Example.swift

# When -F option is part of shebang and Example.swift is executable
./Example.swift
```

See `Examples` folder for details.

## Author

Maksym Grebenets, mgrebenets@gmail.com, [@mgrebenets](https://twitter.com/mgrebenets)

## License

SwiftScriptRunner is available under the MIT license. See the LICENSE file for more info.
