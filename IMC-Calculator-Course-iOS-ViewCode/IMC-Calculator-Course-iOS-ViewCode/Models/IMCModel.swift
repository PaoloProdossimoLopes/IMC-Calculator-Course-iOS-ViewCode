//
//  IMCModel.swift
//  IMC-Calculator-Course-iOS-ViewCode
//
//  Created by Paolo Prodossimo Lopes on 01/11/21.
//

import Foundation

protocol IMCModelProtocol {
    var IMCResult: Double { get }
}

struct IMCModel: IMCModelProtocol {
    
    private let height: Double
    private let weight: Double
    
    init(height: String, weight: String) {
        self.height = Double(height) ?? -1
        self.weight = Double(weight) ?? -1
    }
    
    var IMCResult: Double {
        return (weight/(height*height))
    }
    
}
