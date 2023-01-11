//
//  UniversalLinkTests.swift
//  MomentsTests
//
//  Created by Sam Lau on 2023/1/11.
//

import XCTest
@testable import Moments

class UniversalLinkTests: XCTestCase {
    // MARK: raw value
    func testRawValue() throws {
        // swiftlint:disable no_hardcoded_strings
        XCTAssertEqual(UniversalLink.internalMenu.rawValue, "internalMenu")
        // swiftlint:enable no_hardcoded_strings
    }

    // MARK: url
    func testUrlWithoutParameters() throws {
        // swiftlint:disable no_hardcoded_strings
        XCTAssertEqual(UniversalLink.internalMenu.url(parameters: [:]), "https://momentsapp.com/internalMenu")
        // swiftlint:enable no_hardcoded_strings
    }

    func testUrlWithParameters() throws {
        // swiftlint:disable no_hardcoded_strings
        XCTAssertEqual(UniversalLink.designKit.url(parameters: ["productName": "DesignKit", "version": "1.0.1"]), "https://momentsapp.com/designKit?productName=DesignKit&version=1.0.1")
        // swiftlint:enable no_hardcoded_strings
    }
}
