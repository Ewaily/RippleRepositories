//
//  SearchTextField.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import UIKit

class SearchTextField: UIView {
    
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var textField: UITextField!
    
    var delegate: UITextFieldDelegate? {
        didSet {
            textField.delegate = delegate
        }
    }
    
    var reference: UITextField {
        return textField
    }

    var placeholder: String? {
        didSet {
            setPlaceholder(placeholder: placeholder ?? "")
        }
    }
    
    var text: String? {
        return textField.text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commenInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commenInit()
    }
    
    private func commenInit() {
        loadNib(nibName: String(describing: SearchTextField.self))
        setupUI()
    }
    
    private func setupUI() {
        setupContainerView()
        setupTextField()
    }

    private func setupContainerView() {
        containerView.cornerRadius = 20
        containerView.borderWidth = 0.3
        containerView.borderColor = Colors.GRAY
    }

    private func setupTextField() {
        textField.font = .systemFont(ofSize: 14)
        textField.textColor = Colors.DARK_SHADE
        textField.clearButtonMode = .whileEditing
        #if MOCK
        textField.text = "ripple"
        #endif
    }

    private func setPlaceholder(placeholder: String) {
        let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
                                                        .foregroundColor : Colors.GRAY ?? .gray,
                                                        ])
        textField.attributedPlaceholder = attributedPlaceholder
    }
}
