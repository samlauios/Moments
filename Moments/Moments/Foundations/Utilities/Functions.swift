//
//  Functions.swift
//  Moments
//
//  Created by Sam Lau on 2023/1/6.
//

import Foundation

func configure<T:AnyObject>(_ object:T, closure:(T) -> Void) -> T {
    closure(object)
    return object
}
