//
//  InternalMenuNavigator.swift
//  Moments
//
//  Created by Sam Lau on 2023/1/11.
//

import UIKit

struct InternalMenuNavigator: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        let destinationViewController = InternalMenuViewController()
        navigate(to: destinationViewController, from: viewController, using: transitionType)
    }
}
