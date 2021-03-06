//
//  TaskPromise.swift
//  Deferred
//
//  Created by Zachary Waldowski on 10/27/15.
//  Copyright © 2015-2019 Big Nerd Ranch. Licensed under MIT.
//

#if SWIFT_PACKAGE
import Deferred
#endif

extension Deferred: TaskProtocol where Value: Either {
    /// Completes the task with a successful `value`, or a thrown error.
    ///
    /// If `value` represents an expression that may fail by throwing, the
    /// task will implicitly catch the failure as the result.
    ///
    /// Fulfilling this deferred value should usually be attempted only once.
    ///
    /// - seealso: `Deferred.fill(with:)`
    @discardableResult
    public func succeed(with value: Success) -> Bool {
        return fill(with: Value(right: value))
    }

    /// Completes the task with a failed `error`.
    ///
    /// - see: fill(with:)
    @discardableResult
    public func fail(with error: Failure) -> Bool {
        return fill(with: Value(left: error))
    }
}

extension Deferred where Value: Either, Value.Right == Void {
    /// Completes the task with a success.
    ///
    /// Fulfilling this deferred value should usually be attempted only once.
    ///
    /// - seealso: `Deferred.succeed(with:)`
    @discardableResult
    public func succeed() -> Bool {
        return fill(with: Value(right: ()))
    }
}
