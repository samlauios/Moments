//
//  MomentsTimelineViewController.swift
//  Moments
//
//  Created by Sam Lau on 2021/11/30.
//

import UIKit
import SnapKit

class MomentsTimelineViewController: BaseViewController {
    lazy var boxView: UIView = configure(.init()) {
        $0.backgroundColor = .blue
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "朋友圈"

        view.addSubview(boxView)
        boxView.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.center.equalTo(view)
        }
    }
}
