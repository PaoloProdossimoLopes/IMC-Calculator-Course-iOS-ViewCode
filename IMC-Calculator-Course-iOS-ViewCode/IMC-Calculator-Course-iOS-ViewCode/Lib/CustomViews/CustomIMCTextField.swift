//
//  CustomIMCTextField.swift
//  IMC-Calculator-Course-iOS-ViewCode
//
//  Created by Paolo Prodossimo Lopes on 01/11/21.
//

import UIKit

protocol CustomIMCTextFieldDelegate: AnyObject {
    func changeTextFieldValue(textField: UITextField)
}

final class CustomIMCTextField: CustomView {
    
    weak var delegate: CustomIMCTextFieldDelegate?
    
    private let CustomStackTextField: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let CustomTitleTextField: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let CustomTextField: UITextField = {
        let tf = UITextField()
        tf.textAlignment = .center
        tf.backgroundColor = .white
        tf.keyboardType = .numbersAndPunctuation
        tf.textColor = .black
        tf.layer.cornerRadius = 5
        return tf
    }()
    
    init(title: String, placeHolder: String) {
        self.CustomTitleTextField.text = title
        self.CustomTextField.placeholder = placeHolder
        super.init(frame: .zero)
        
        commonInit()
        CustomTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViewHierachy() {
        [CustomTitleTextField, CustomTextField].forEach { CustomStackTextField.addArrangedSubview($0) }
        addSubview(CustomStackTextField)
    }
    
    func configureConstraints() {
        CustomTextField.configureContstaints(height: 50)
        CustomStackTextField.configureContstaints(top: topAnchor, leading: leadingAnchor,
                                                  trailing: trailingAnchor)
        self.configureContstaints(bottom: CustomStackTextField.bottomAnchor)
    }
    
    func configureStyle() {
        CustomTextField.attributedPlaceholder = NSAttributedString(string: CustomTextField.placeholder ?? "",
                                                      attributes: [.foregroundColor: UIColor.gray])
    }
    
    func getTextFromTextField() -> String { return CustomTextField.text ?? "" }
    
    private func formatTextField(_ textFieldVerify: UITextField) {
        if let text = textFieldVerify.text { textFieldVerify.text = text.replacingOccurrences(of: ".", with: ",") }
    }
    
}

extension CustomIMCTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet(charactersIn: "0123456789,.").isSuperset(of: CharacterSet(charactersIn: string))
        else { return false }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        formatTextField(textField)
        delegate?.changeTextFieldValue(textField: textField)
    }
}
