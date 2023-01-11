//
//  DesignKitDemoNavigator.swift
//  Moments
//
//  Created by Sam Lau on 2023/1/11.
//

import UIKit

struct DesignKitDemoNavigator: Navigating {
    func navigate(from viewController: UIViewController, using transitionType: TransitionType, parameters: [String : String]) {
        let togglesDataStore: TogglesDataStoreType = BuildTargetTogglesDataStore.share
        guard togglesDataStore.isToggleOn(BuildTargetToggle.debug) || togglesDataStore.isToggleOn(BuildTargetToggle.internal) else {
            return
        }

        // swiftlint:disable no_hardcoded_strings
        guard let productName = parameters["productName"], let appVersion = parameters["appVersion"] else {
            return
        }
        // swiftlint:enable no_hardcoded_strings

        let destinationViewController = DesignKitDemoViewController(productName: productName, appVersion: appVersion)
        navigate(to: destinationViewController, from: viewController, using: transitionType)
    }
}
