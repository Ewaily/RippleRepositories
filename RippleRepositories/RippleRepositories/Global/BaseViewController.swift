//
//  BaseViewController.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import UIKit

class BaseViewController: UIViewController, Storyboarded {

    override func viewDidLoad() {
        super.viewDidLoad()
        styleNavigationBar()
        setupKeyboardDismissRecognizer()
    }

    private func styleNavigationBar() {
        let attributes: [NSAttributedString.Key : Any] = [.foregroundColor: Colors.DARK_SHADE ?? .black]
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = Colors.DARK_SHADE
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationController?.navigationBar.setBackgroundImage(UIImage(),
                                                               for: UIBarPosition.any,
                                                               barMetrics: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
