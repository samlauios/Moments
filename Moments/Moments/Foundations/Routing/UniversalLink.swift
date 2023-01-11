//
//  UniversalLink.swift
//  Moments
//
//  Created by Sam Lau on 2023/1/10.
//

import Foundation

enum UniversalLink: String {
    case internalMenu
    case designKit

    // swiftlint:disable no_hardcoded_strings
    static let baseURL = "https://momentsapp.com/"
    // swiftlint:enable no_hardcoded_strings

    func url(parameters: [String: String] = [:]) -> URL? {
        var path = "\(Self.baseURL)\(self.rawValue)"
        if !parameters.isEmpty {
            path.append("?")

            for (name, value) in parameters {
                path.append(path.last == "?" ? "" : "&")
                path.append("\(name)=\(value)")
            }
        }

        return URL(string: path)
    }
}
