//
//  InternalTogglesDataStore.swift
//  Moments
//
//  Created by Sam Lau on 2023/1/9.
//

import Foundation

enum InternalToggle: String, ToggleType {
    case isLikeButtonForMomentEnable
}

struct InternalTogglesDataStore: TogglesDataStoreType {
    private let userDefaults: UserDefaults
    static let share: InternalTogglesDataStore = .init(userDefaults: UserDefaults.standard)

    private init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults

        self.userDefaults.set(false, forKey: InternalToggle.isLikeButtonForMomentEnable.rawValue)
    }

    func isToggleOn(_ toggle: ToggleType) -> Bool {
        guard let toggle = toggle as? InternalToggle else {
            return false
        }

        return userDefaults.bool(forKey: toggle.rawValue)
    }

    func upate(toggle: ToggleType, value: Bool) {
        guard let toggle = toggle as? InternalToggle else { return }

        userDefaults.set(value, forKey: toggle.rawValue)
    }
}
