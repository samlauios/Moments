//
//  BuildTargetTogglesDataStore.swift
//  Moments
//
//  Created by Sam Lau on 2023/1/9.
//

import Foundation

enum BuildTargetToggle: ToggleType {
    case debug, `internal`, production
}

struct BuildTargetTogglesDataStore: TogglesDataStoreType {
    private let buildTargetToggle: BuildTargetToggle
    static let share: BuildTargetTogglesDataStore = .init()

    private init() {
        #if DEBUG
        buildTargetToggle = .debug
        #endif

        #if INTERNAL
        buildTargetToggle = .internal
        #endif

        #if PRODUCTION
        buildTargetToggle = .production
        #endif
    }

    func isToggleOn(_ toggle: ToggleType) -> Bool {
        guard let toggle = toggle as? BuildTargetToggle else {
            return false
        }

        return buildTargetToggle == toggle
    }

    func upate(toggle: ToggleType, value: Bool) {}
}
