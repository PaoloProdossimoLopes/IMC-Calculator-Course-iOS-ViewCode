//
//  IMCResultCustomView.swift
//  IMC-Calculator-Course-iOS-ViewCode
//
//  Created by Paolo Prodossimo Lopes on 01/11/21.
//

import UIKit

final class IMCResultCustomView: CustomView {
    
    //MARK: - Properties
    
    private let resultMainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let resultStatusLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let resultValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let resultImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "obesidade")
        iv.isHidden = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.stopAnimating()
        loading.hidesWhenStopped = true
        loading.color = .systemBlue
        loading.translatesAutoresizingMaskIntoConstraints = false
        return loading
    }()
    
    //MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureViewHierachy() {
        
        [resultStatusLabel, resultValueLabel, resultImage, UIView()].forEach { resultMainStack.addArrangedSubview($0) }
        
        [resultMainStack, loadingIndicator].forEach { addSubview($0) }
    }
    
    func configureConstraints() {
        resultMainStack.configureContstaints(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        loadingIndicator.configureContstaints(top: topAnchor, centerX: centerXAnchor, height: 50, width: 50)
        self.configureContstaints(bottom: resultMainStack.bottomAnchor)
    }
    
    //MARK: - Mothods
    
    func hideForChangeData(_ startAnimatind: Bool = false) {
        if startAnimatind { loadingIndicator.startAnimating() }
        changeState(true)
    }
    
    func showFieldsAfterDataInputed() {
        changeState(false)
        loadingIndicator.stopAnimating()
    }
    
    func inputData(_ result: IMCResultInfo) {
        resultStatusLabel.text = "Status: \(result.IMCResult)"
        resultValueLabel.text = "Seu IMC é: \(Int(result.IMCValue))"
        resultImage.image = result.IMCImage
    }
    
    private func changeState(_ isHidden: Bool) {
        resultStatusLabel.isHidden = isHidden
        resultValueLabel.isHidden = isHidden
        resultImage.isHidden = isHidden
    }
    
}
