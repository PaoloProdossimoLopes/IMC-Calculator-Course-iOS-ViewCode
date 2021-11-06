//
//  IMCCustomHeader.swift
//  IMC-Calculator-Course-iOS-ViewCode
//
//  Created by Paolo Prodossimo Lopes on 01/11/21.
//

import UIKit

final class IMCCustomHeader: CustomView {
    
    //MARK: - Properties
    
    private let IMCHEaderStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let IMCTitle: UILabel = {
        let label = UILabel()
        label.text = "IMC"
        label.font = .boldSystemFont(ofSize: 36)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let IMCSubtitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = "CALCULADORA"
        return label
    }()
    
    //MARK: - Constructors
    
    init(title: String, subtitle: String) {
        self.IMCTitle.text = title
        self.IMCSubtitle.text = subtitle
        super.init(frame: .zero)
        
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureViewHierachy() {
        [IMCTitle, IMCSubtitle].forEach { IMCHEaderStackView.addArrangedSubview($0) }
        addSubview(IMCHEaderStackView)
    }
    
    func configureConstraints() {
        IMCHEaderStackView.configureContstaints(top: safeAreaLayoutGuide.topAnchor,
                                                leading: leadingAnchor,
                                                trailing: trailingAnchor)
        self.configureContstaints(bottom: IMCHEaderStackView.bottomAnchor)
    }
}

#if DEBUG
import SwiftUI

struct IMCCustomHeader_Previews: PreviewProvider {
    static var previews: some View {
        IMCCustomHeader(title: "IMC", subtitle: "CALCULADORA")
            .asSwiftUIView
            .previewLayout(.fixed(width: 150, height: 100))
            .padding()
    }
}

#endif
