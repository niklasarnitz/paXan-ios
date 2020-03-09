// Copyright © 2019 SWDEC. All rights reserved.

import ImageScrollView
import UIKit

class MapViewController: UIViewController {
    private lazy var imageScrollView: ImageScrollView = {
        let view = ImageScrollView()

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()

        title = "Karte"

        view.backgroundColor = .white

        view.addSubview(imageScrollView)
        imageScrollView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.bottomMargin)
        }

        imageScrollView.setup()

        imageScrollView.display(image: Images.map)
        imageScrollView.adjustFrameToCenter()
    }
}
