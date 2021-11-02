//
//  CustomViews.swift
//  IMC-Calculator-Course-iOS-ViewCode
//
//  Created by Paolo Prodossimo Lopes on 02/11/21.
//

import UIKit

typealias CustomView = (UIView & CViews)

protocol CViews {
    func commonInit()
    func configureViewHierachy()
    func configureConstraints()
    func configureStyle()
}

extension CViews {
    func commonInit() {
        configureViewHierachy()
        configureConstraints()
        configureStyle()
    }
    
    func configureStyle() {}
}
