//
//  ViewControllerViewModel.swift
//  IMC-Calculator-Course-iOS-ViewCode
//
//  Created by Paolo Prodossimo Lopes on 01/11/21.
//

import Foundation
import UIKit

typealias IMCResultInfo = (IMCValue: Double, IMCResult: String, IMCImage: UIImage?)

protocol ViewControllerViewModelProtocol {
    //methods:
    func calculateIMC(height: String, weight: String)
    func getResultInt() -> IMCResultInfo?
    //properties:
    var updateView: (()->Void)? { get set }
    var showError: ((_ error: String)->Void)? { get set }
}

final class IMCVCViewModel: ViewControllerViewModelProtocol {
    
    private var IMCResult: IMCResultInfo?
    
    var updateView: (()->Void)?
    var showError: ((_ error: String)->Void)?
    
    func getResultInt() -> IMCResultInfo? {
        return IMCResult
    }
    
    func calculateIMC(height: String, weight: String) {
        
        let IMC = IMCModel(height: height, weight: weight)
        IMCResult = getIMCTextResult(imc: IMC.IMCResult)
        
        if (IMCResult?.IMCResult != "Error") { self.updateView?() }
    }
    
    private func getIMCTextResult(imc: Double) -> IMCResultInfo {
        switch imc {
            case ..<18.5: return IMCResultInfo(imc, "Underweight", UIImage(named: "abaixo"))
            case 18.5...24.9: return IMCResultInfo(imc,"Normal", UIImage(named: "ideal"))
            case 25...29.9: return IMCResultInfo(imc,"Overweight", UIImage(named: "sobre"))
            case 35...: return IMCResultInfo(imc,"Obese", UIImage(named: "obesidade"))
            default:
                self.showError?("Valor nao encontrado")
                return IMCResultInfo(imc, "Error", UIImage(named: "abaixo"))
        }
    }
    
}
