//
//  UIViewController.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import UIKit

extension UIViewController {
    func setupKeyboardDismissRecognizer(_ cancelsTouchesInView: Bool = false) {
        var tapRecognizer = UITapGestureRecognizer()
        tapRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(self.dismissKeyboard))
        tapRecognizer.cancelsTouchesInView = cancelsTouchesInView
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
