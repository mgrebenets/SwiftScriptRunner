//
// Swift Script Runner
//

import Foundation

/// Helper for running Swift scripts with async callbacks
open class SwiftScriptRunner {
    /// A poor man's mutex
    fileprivate var count = 0
    /// Current run loop
    fileprivate let runLoop = RunLoop.current

    /// Initializer
    public init() {}

    /// Lock the script
    open func lock() {
        count += 1
    }

    /// Unlock the script
    open func unlock() {
        count -= 1
    }

    /// Wait for all locks to unlock
    open func wait() {
        while count > 0 &&
            runLoop.run(mode: .defaultRunLoopMode, before: Date(timeIntervalSinceNow: 0.1)) {
                // Run, run, run
        }
    }
}
