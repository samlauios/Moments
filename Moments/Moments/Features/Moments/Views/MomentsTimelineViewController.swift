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
