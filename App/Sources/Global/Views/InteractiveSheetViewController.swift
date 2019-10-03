// swiftlint:disable file_header
// Copyright © 2019 SWDEC. All rights reserved.

import SnapKit
import UIKit

class InteractiveSheetViewController: UIViewController, UIScrollViewDelegate {
    // MARK: - Public Properties
    var isDismissable: Bool = true

    // MARK: - Private Properties
    private var viewCtrl: UIViewController
    private var dragView = UIView()
    private var containerView = UIView()
    private lazy var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
    private var willDismiss: Bool = false

    // MARK: - Constraints
    private var topDragViewConstraint: Constraint?

    // MARK: - Private Constants
    private var handleSize = CGSize(width: 40, height: 4)

    // MARK: - Initialization
    init(containing viewCtrl: UIViewController) {
        self.viewCtrl = viewCtrl
        super.init(nibName: nil, bundle: nil)

        modalPresentationStyle = .overCurrentContext
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not supported!")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dragView.transform = .identity
        setWillDismiss(false, isHaptic: false)
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        configureDragView()
        configureContainer()
        insertViewCtrl()
        configureHandleView()
        configurePanGesture()
    }

    // MARK: - View Layout
    private func configureDragView() {
        view.addSubview(dragView)

        dragView.snp.makeConstraints { [weak self] maker in
            guard let self = self else { return }
            self.topDragViewConstraint = maker.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(16).constraint
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
        }

        dragView.backgroundColor = Colors.background
        dragView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        dragView.layer.cornerRadius = 15
        Style.addShadow(to: dragView)
    }

    private func configureContainer() {
        dragView.addSubview(containerView)
        containerView.backgroundColor = Colors.background
        containerView.bindEdgesToSuperview()
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        containerView.layer.cornerRadius = 15
        containerView.clipsToBounds = true
    }

    private func configureHandleView() {
        let handleView = UIView(frame: .zero)
        handleView.backgroundColor = Colors.secondaryBackground
        handleView.clipsToBounds = true
        handleView.layer.cornerRadius = handleSize.height / 2

        containerView.addSubview(handleView)

        handleView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(8)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(handleSize.width)
            maker.height.equalTo(handleSize.height)
        }
    }

    // MARK: ViewController insertion and removal
    private func insertViewCtrl() {
        viewCtrl.additionalSafeAreaInsets = UIEdgeInsets(top: 34, left: 0, bottom: 0, right: 0)

        addChild(viewCtrl)
        viewCtrl.view.frame = containerView.frame
        containerView.addSubview(viewCtrl.view)
        viewCtrl.view.bindEdgesToSuperview()
        viewCtrl.didMove(toParent: self)
    }

    // MARK: Gesture Handling
    private func configurePanGesture() {
        view.addGestureRecognizer(panGestureRecognizer)
        panGestureRecognizer.maximumNumberOfTouches = 1
        panGestureRecognizer.minimumNumberOfTouches = 1
    }

    @objc
    private func didPan(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: nil)

        switch gestureRecognizer.state {
        case .began, .changed, .possible:
            guard translation.y >= 0 else { return }
            evaluateYTranslation(translation.y)

        case .cancelled, .ended, .failed:
            finishTransition()

        @unknown default:
            return
        }
    }

    private func finishTransition() {
        let halfHeight = view.bounds.height / 2
        let offset = dragView.frame.minY

        if willDismiss {
            animateOut(progress: (offset - halfHeight) / halfHeight)
        } else {
            animateBack(progress: offset / halfHeight)
        }
    }

    private func evaluateYTranslation(_ translation: CGFloat) {
        let halfHeight = view.bounds.height / 2
        let offset = dragView.frame.minY
        let wouldDismiss = offset > halfHeight * 0.8
        setWillDismiss(wouldDismiss && isDismissable, isHaptic: true)

        dragView.transform = CGAffineTransform(translationX: 0, y: translation)
    }

    private func setWillDismiss(_ value: Bool, isHaptic: Bool) {
        guard value != willDismiss else { return }
        willDismiss = value

        if isHaptic {
            HapticFeedbackManager.shared.generateSelection()
        }
    }

    // MARK: ScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.contentOffset.y < 0 else { return }
        evaluateYTranslation(abs(scrollView.contentOffset.y))
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard scrollView.contentOffset.y < 0 else { return }
        finishTransition()
    }

    // MARK: - Animation
    private func animateBack(progress: CGFloat) {
        UIView.animate(
            withDuration: 0.6 * Double(progress),
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            options: .curveEaseOut,
            animations: { [weak self] in
                guard let self = self else { return }
                self.dragView.transform = .identity
                self.view.layoutIfNeeded()
            },
            completion: nil
        )
    }

    private func animateOut(progress: CGFloat) {
        UIView.animate(
            withDuration: 0.6 * (1 - Double(progress)),
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            options: .curveEaseOut,
            animations: { [weak self] in
                guard let self = self else { return }
                self.dragView.transform = CGAffineTransform(translationX: 0, y: self.dragView.bounds.height)
            },
            completion: { [weak self] _ in
                guard let self = self else { return }
                self.dismiss(animated: false, completion: nil)
            }
        )
    }
}
