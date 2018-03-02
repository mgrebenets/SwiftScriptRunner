#!/usr/bin/env xcrun swift -F Carthage/Build/Mac

// Shebangs for using with different dependency managers.
//
// - Carthage:
// #!/usr/bin/env xcrun swift -F Carthage/Build/Mac
// - CocoaPods Rome:
// #!/usr/bin/env xcrun swift -F Rome

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