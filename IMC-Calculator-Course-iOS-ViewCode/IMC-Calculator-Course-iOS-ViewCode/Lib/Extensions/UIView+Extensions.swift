//
//  UIView+Extensions.swift
//  IMC-Calculator-Course-iOS-ViewCode
//
//  Created by Paolo Prodossimo Lopes on 01/11/21.
//

import UIKit
import SwiftUI

extension UIView {
    
    func configureContstaints(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil,
                              trailing: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil,
                              centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil,
                              paddingTop: CGFloat? = nil, paddingLeading: CGFloat? = nil,
                              paddingTrailing: CGFloat? = nil, paddingBottom: CGFloat? = nil,
                              height: CGFloat? = nil, width: CGFloat? = nil) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            if let padding = paddingTop {
                self.topAnchor.constraint(equalTo: top, constant: padding).isActive = true
            } else {
                self.topAnchor.constraint(equalTo: top).isActive = true
            }
            
        }; if let leading = leading {
            if let padding = paddingTop {
                self.leadingAnchor.constraint(equalTo: leading, constant: padding).isActive = true
            } else {
                self.leadingAnchor.constraint(equalTo: leading).isActive = true
            }
            
        }; if let trailing = trailing {
            if let padding = paddingTop {
                self.trailingAnchor.constraint(equalTo: trailing, constant: -padding).isActive = true
            } else {
                self.trailingAnchor.constraint(equalTo: trailing).isActive = true
            }
            
        }; if let bottom = bottom {
            if let padding = paddingTop {
                self.bottomAnchor.constraint(equalTo: bottom, constant: -padding).isActive = true
            } else {
                self.bottomAnchor.constraint(equalTo: bottom).isActive = true
            }
        }; if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
            
        }; if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        self.configureSize(height: height, width: width)
    }
    
    func configureSize(height: CGFloat? = nil, width: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }; if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}

extension UIView {
    private struct CreateUIViewPreview: UIViewRepresentable {
        let uiView: UIView

        func makeUIView(context: Self.Context) -> some UIView {
            uiView
        }

        func updateUIView(_ uiView: UIViewType, context: Self.Context) { }
    }
    
    var asSwiftUIView: some View {
        CreateUIViewPreview(uiView: self)
    }
}
