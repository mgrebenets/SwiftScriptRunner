//
// Swift Script Runner
//

import Foundation

/// Helper for running Swift scripts with async callbacks
public class SwiftScriptRunner {
    /// A poor man's mutex
    private var count = 0
    /// Current run loop
    private let runLoop = NSRunLoop.currentRunLoop()

    /// Initializer
    public init() {}

    /// Lock the script
    public func lock() {
        count++
    }

    /// Unlock the script
    public func unlock() {
        count--
    }

    /// Wait for all locks to unlock
    public func wait() {
        while count > 0 &&
            runLoop.runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 0.1)) {
                // Run, run, run
        }
    }
}
