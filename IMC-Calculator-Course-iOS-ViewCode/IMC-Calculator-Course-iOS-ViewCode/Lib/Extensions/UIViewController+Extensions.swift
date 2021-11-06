//
//  UIViewController+Extensions.swift
//  IMC-Calculator-Course-iOS-ViewCode
//
//  Created by Paolo Prodossimo Lopes on 04/11/21.
//

import UIKit
import SwiftUI

extension UIViewController {
    private struct SwiftUIViewControllerWrapper: UIViewControllerRepresentable {
        
        let viewController: UIViewController
        
        func makeUIViewController(context: Self.Context) -> UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
        
    }
    
    var asSwiftUIView: some View {
        SwiftUIViewControllerWrapper(viewController: self)
    }
}

