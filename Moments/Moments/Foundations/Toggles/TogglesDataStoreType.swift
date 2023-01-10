//
//  TogglesDataStoreType.swift
//  Moments
//
//  Created by Sam Lau on 2023/1/9.
//

import Foundation

protocol ToggleType {}

protocol TogglesDataStoreType {
    func isToggleOn(_ toggle: ToggleType) -> Bool
    func upate(toggle: ToggleType, value: Bool)
}
