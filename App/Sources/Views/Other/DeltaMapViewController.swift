// Copyright © 2019 SWDEC. All rights reserved.

import ImageScrollView
import UIKit

class DeltaMapViewController: UIViewController {
    private lazy var imageScrollView: ImageScrollView = {
        let view = ImageScrollView()

        return view
    }()

    private lazy var doneButton = ThemedButton(text: "Fertig")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(imageScrollView)
        imageScrollView.bindEdgesToSuperview()

        imageScrollView.setup()

        imageScrollView.display(image: Images.deltaMap)

        layoutDoneButton()
    }

    private func layoutDoneButton() {
        view.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        doneButton.addTarget(self, action: #selector(didPressDone), for: .touchUpInside)
    }

    @objc private func didPressDone() {
        dismiss(animated: true)
    }
}
