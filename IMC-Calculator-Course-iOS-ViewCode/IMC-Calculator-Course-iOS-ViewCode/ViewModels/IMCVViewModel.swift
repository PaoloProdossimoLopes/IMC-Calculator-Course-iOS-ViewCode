//
//  IMCVViewModel.swift
//  IMC-Calculator-Course-iOS-ViewCode
//
//  Created by Paolo Prodossimo Lopes on 02/11/21.
//

import Foundation

protocol IMCVViewModelProtocol {
    func calculateIMC(height: String, weight: String, success: ()->())
    func buttonStateCondition(height: String, weight: String, success: ()->(), failure: ()->())
}

final class IMCVViewModel: IMCVViewModelProtocol {
    
    func calculateIMC(height: String, weight: String, success: ()->()) {
        if (height != "" && weight != "") { success() }
    }
    
    func buttonStateCondition(height: String, weight: String, success: ()->(), failure: ()->()) {
        if (height != "" && weight != "") { success() }
        else { failure() }
    }
    
}
