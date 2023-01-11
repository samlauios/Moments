//
//  AppRouting.swift
//  Moments
//
//  Created by Sam Lau on 2023/1/10.
//

import Foundation

protocol AppRouting {
    func register(path: String, navigator: Navigating)
    func route(to url: URL?, from routingSource: RoutingSource?, using transitionType: TransitionType)
}
