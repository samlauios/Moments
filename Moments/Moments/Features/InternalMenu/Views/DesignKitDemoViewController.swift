//
//  DesignKitDemoViewController.swift
//  Moments
//
//  Created by Sam Lau on 2023/1/11.
//

import UIKit

class DesignKitDemoViewController: BaseViewController {
    private let productName: String
    private let appVersion: String

    init(productName: String, appVersion: String) {
        self.productName = productName
        self.appVersion = appVersion
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = L10n.InternalMenu.designKitDemo
    }
}
