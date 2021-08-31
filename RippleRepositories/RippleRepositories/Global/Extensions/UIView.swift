//
//  UIView.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import UIKit

extension UIView {
    func loadNib(nibName: String) {
        guard let view: UIView = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView else {
            fatalError("Can not Load nib")
        }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
    }
}

// MARK: - Inspectable

extension UIView {

    @IBInspectable
    var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }

    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set { layer.borderColor = newValue?.cgColor }
    }

    @IBInspectable
    var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
            layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        }
    }

    @IBInspectable
    var shadowBlur: CGFloat {
        get { return layer.shadowRadius * 2 }
        set { layer.shadowRadius = newValue / 2}
    }

    @IBInspectable
    var shadowOpacity: Float {
        get { return layer.shadowOpacity }
        set {layer.shadowOpacity = newValue / 100}
    }

    @IBInspectable
    var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
}
