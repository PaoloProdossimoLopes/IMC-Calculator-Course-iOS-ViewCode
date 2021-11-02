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
        configureButton() 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        setTitle(buttonTitle, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 18)
        backgroundColor = .systemGray4
        layer.cornerRadius = 8
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addTarget(self, action: #selector(buttonHandleTapped), for: .touchUpInside)
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
