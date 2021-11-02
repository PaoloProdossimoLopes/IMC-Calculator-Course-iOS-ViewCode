//
//  IMCHeader.swift
//  IMC-Calculator-Course-iOS-ViewCode
//
//  Created by Paolo Prodossimo Lopes on 01/11/21.
//

import UIKit

final class IMCHeader: UIView {
    
    private let customHeaderStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let customTitle: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 36)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let customSubtitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    init(title: String, subtitle: String) {
        self.customTitle.text = title
        self.customSubtitle.text = subtitle
        
        super.init(frame: .zero)
        
        configureHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHeader() {
        translatesAutoresizingMaskIntoConstraints = false
        
        [customTitle, customSubtitle].forEach { customHeaderStackView.addArrangedSubview($0) }
        
        addSubview(customHeaderStackView)
        
        NSLayoutConstraint.activate([
            customHeaderStackView.topAnchor.constraint(equalTo: topAnchor),
            customHeaderStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customHeaderStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomAnchor.constraint(equalTo: customHeaderStackView.bottomAnchor)
        ])
    }
}
