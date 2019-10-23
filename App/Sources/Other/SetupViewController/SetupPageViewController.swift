//swiftlint:disable line_length dynamic_storyboard_reference
// Copyright © 2019 SWDEC. All rights reserved.

import SwiftyUserDefaults
import UIKit

class SetupPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    let pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        let initialPage = 0

        setViewControllers([setupAssistantPages[initialPage]], direction: .forward, animated: true, completion: nil)

        // pageControl
        pageControl.frame = CGRect()
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = Colors.ecRed
        pageControl.numberOfPages = setupAssistantPages.count
        pageControl.currentPage = initialPage
        view.addSubview(pageControl)

        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        pageControl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = setupAssistantPages.firstIndex(of: viewController) {
            if viewControllerIndex == 0 {
                // wrap to last page in array
                return setupAssistantPages.last
            } else {
                // go to previous page in array
                return setupAssistantPages[viewControllerIndex - 1]
            }
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = setupAssistantPages.firstIndex(of: viewController) {
            if viewControllerIndex < setupAssistantPages.count - 1 {
                // go to next page in array
                return setupAssistantPages[viewControllerIndex + 1]
            } else {
                // wrap to first page in array
                let storyboard = UIStoryboard(name: "Main", bundle: nil)

                let viewController = storyboard.instantiateInitialViewController()

                viewController?.modalPresentationStyle = .currentContext

                present(viewController!, animated: true)
            }
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        // set the pageControl.currentPage to the index of the current viewController in pages
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = setupAssistantPages.firstIndex(of: viewControllers[0]) {
                self.pageControl.currentPage = viewControllerIndex
            }
        }
    }
}
