//
//  AppRouter.swift
//  Moments
//
//  Created by Sam Lau on 2023/1/10.
//

import Foundation
import UIKit

final class AppRouter: AppRouting {
    private var navigators: [String: Navigating] = [:]
    static let shared: AppRouter = .init()

    private init() {}

    func register(path: String, navigator: Navigating) {
        navigators[path.lowercased()] = navigator
    }

    func route(to url: URL?, from routingSource: RoutingSource?, using transitionType: TransitionType) {
        guard let url = url, let sourceViewController = routingSource as? UIViewController ?? UIApplication.shared.rootViewController else { return }

        let path = url.lastPathComponent.lowercased()
        guard let urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
        let parameters: [String: String] = (urlComponent.queryItems ?? []).reduce(into: [:]) { parameters, item in
            parameters[item.name] = item.value
        }

        navigators[path]?.navigate(from: sourceViewController, using: transitionType, parameters: parameters)
    }
}
