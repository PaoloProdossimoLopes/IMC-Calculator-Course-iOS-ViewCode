//
//  IMCView.swift
//  IMC-Calculator-Course-iOS-ViewCode
//
//  Created by Paolo Prodossimo Lopes on 01/11/21.
//

import Foundation
import UIKit

protocol IMCViewDelegate: AnyObject {
    func calculateButtonTapped(weight: String, height: String)
    func notifyError(message: String)
}

final class IMCView: CustomView {
    
    //MARK: - Properties:
    
    weak var delegate: IMCViewDelegate?
    var viewModel: IMCVViewModelProtocol?
    
    private let IMCHEaderStackView = IMCHeader(title: "IMC", subtitle: "CALCULADORA")
    
    private let weightTextFieldCustom = CustomIMCTextField(title: "Peso(m):", placeHolder: "EX: 76 kg")
    private let heightTextFieldCustom = CustomIMCTextField(title: "Altura(m):", placeHolder: "EX: 1,68 m")
    
    private let calculateButton = IMCCustomButton(title: "Calcular IMC")
    
    private let resultMainStack = IMCResultCustomView()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mainTFStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 30
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        commonInit()
        configureDelagtes()
        calculateButton.disableButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureViewHierachy() {
        [weightTextFieldCustom, heightTextFieldCustom].forEach { mainTFStackView.addArrangedSubview($0) }
        
        [containerView, IMCHEaderStackView, mainTFStackView, calculateButton, resultMainStack].forEach { addSubview($0)
        }
    }
    
    func configureConstraints() {
        containerView.configureContstaints(top: topAnchor, leading: leadingAnchor,
                                           trailing: trailingAnchor)

        IMCHEaderStackView.configureContstaints(top: containerView.safeAreaLayoutGuide.topAnchor,
                                                leading: containerView.leadingAnchor,
                                                trailing: containerView.trailingAnchor,
                                                paddingTop: 30, paddingLeading: 20, paddingTrailing: 20)

        mainTFStackView.configureContstaints(top: IMCHEaderStackView.bottomAnchor,
                                             leading: IMCHEaderStackView.leadingAnchor,
                                             trailing: IMCHEaderStackView.trailingAnchor, paddingTop: 20)

        calculateButton.configureContstaints(top: mainTFStackView.bottomAnchor,
                                             leading: mainTFStackView.leadingAnchor,
                                             trailing: mainTFStackView.trailingAnchor,
                                             bottom: containerView.bottomAnchor,
                                             paddingTop: 20)
        calculateButton.bottomAnchor.constraint(greaterThanOrEqualTo: containerView.bottomAnchor,
                                                constant: -20).isActive = true

        resultMainStack.configureContstaints(top: containerView.bottomAnchor,
                                             leading: calculateButton.leadingAnchor,
                                             trailing: calculateButton.trailingAnchor,
                                             bottom: self.safeAreaLayoutGuide.bottomAnchor,
                                             paddingTop: 30, paddingBottom: 70)
        
    }
    
    private func configureDelagtes() {
        heightTextFieldCustom.delegate = self
        weightTextFieldCustom.delegate = self
        calculateButton.customDelagate = self
    }
    
    func updateViewInformation(result: IMCResultInfo) {
        resultMainStack.inputData(result)
        resultMainStack.showFieldsAfterDataInputed()
    }
    
    //MARK: - Selectors
    
    private func calculateIMC() {
        let weight = weightTextFieldCustom.getTextFromTextField().replacingOccurrences(of: ",", with: ".")
        let heigh = heightTextFieldCustom.getTextFromTextField().replacingOccurrences(of: ",", with: ".")
        
        viewModel?.calculateIMC(height: heigh, weight: weight) {
            resultMainStack.hideForChangeData(true)
            delegate?.calculateButtonTapped(weight: weight, height: heigh)
        }
    }
}

//MARK: - TextField delegate

extension IMCView: CustomIMCTextFieldDelegate {
    func changeTextFieldValue(textField: UITextField) {
        
        let height = heightTextFieldCustom.getTextFromTextField()
        let weight = weightTextFieldCustom.getTextFromTextField()
        
        viewModel?.buttonStateCondition(height: height, weight: weight, success: {
            calculateButton.enableButton()
        }, failure: {
            calculateButton.disableButton()
            resultMainStack.hideForChangeData()
        })
    }
}

extension IMCView: IMCCustomButtonDelegate {
    func buttonHandleTapped() {
        calculateIMC()
        endEditing(true)
    }
}
