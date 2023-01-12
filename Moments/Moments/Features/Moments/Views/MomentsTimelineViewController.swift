//
//  MomentsTimelineViewController.swift
//  Moments
//
//  Created by Sam Lau on 2021/11/30.
//

import UIKit
import SnapKit
import DesignKit

class MomentsTimelineViewController: BaseViewController {
    lazy var favoriteButton: UIButton = configure(.init()) {
        $0.asStarFavoriteButton(pointSize:30)
        $0.addTarget(self, action: #selector(favoriteButtonDidPress(sender:)), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "朋友圈"

        view.addSubview(favoriteButton)
        favoriteButton.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }
}

extension MomentsTimelineViewController {
    @objc
    func favoriteButtonDidPress(sender: UIButton) {
        AppRouter.shared.route(to: UniversalLink.designKit.url(parameters: ["productName": "Moments", "appVersion": "1.0.0"]), from: self, using: .show)
    }
}
