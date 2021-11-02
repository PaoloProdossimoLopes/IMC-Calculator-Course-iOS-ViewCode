//
//  IMCCustomButton.swift
//  IMC-Calculator-Course-iOS-ViewCode
//
//  Created by Paolo Prodossimo Lopes on 01/11/21.
//

import UIKit

protocol IMCCustomButtonDelegate: AnyObject {
    func buttonHandleTapped()
}

final class IMCCustomButton: UIButton {
    
    weak var customDelagate: IMCCustomButtonDelegate?
    
    private let buttonTitle: String
    
    init(title: String) {
        self.buttonTitle = title
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(buttonHandleTapped), for: .touchUpInside)
        configureConstraints()
        configureStyle()
    }
    
    private func configureConstraints() {
        self.configureContstaints(height: 50)
    }
    
    private func configureStyle() {
        setTitle(buttonTitle, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 18)
        backgroundColor = .systemGray4
        layer.cornerRadius = 8
    }
    
    func disableButton() {
        backgroundColor = .systemGray4
        setTitleColor(.gray, for: .normal)
        isEnabled = false
    }
    
    func enableButton() {
        backgroundColor = .white
        setTitleColor(.systemBlue, for: .normal)
        isEnabled = true
    }
    
    @objc private func buttonHandleTapped() {
        customDelagate?.buttonHandleTapped()
    }
    
}
