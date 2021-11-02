//
//  ViewController.swift
//  IMC-Calculator-Course-iOS-ViewCode
//
//  Created by Paolo Prodossimo Lopes on 01/11/21.
//

import UIKit

final class IMCViewController: UIViewController {
    
    //MARK: - Properties:
    
    var viewModel: ViewControllerViewModelProtocol?
    
    private lazy var IMCcustomView: IMCView = {
        let view = IMCView()
        view.delegate = self
        view.viewModel = IMCVViewModel()
        return view
    }()
    
    //MARK: - LifeCycle
    
    override func loadView() {
        super.loadView()
        view = IMCcustomView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate() // call override: preferredStatusBarStyle
        configureBindings()
    }
    
    //MARK: - Override
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    //MARK: - Helpers
    
    private func showError(title: String = "Error", message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func configureBindings() {
        viewModel?.updateView = { [weak self] in
            guard let self = self else { return }
            self.updateCustomView()
        }
        
        viewModel?.showError = { [weak self] error in
            guard let self = self else { return }
            self.showError(message: error)
        }
    }
    
    private func updateCustomView() {
        guard let info = self.viewModel?.getResultInt() else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // para dar tempo do loading animar
            self.IMCcustomView.updateViewInformation(result: info)
        }
    }
}

//MARK: - IMCView Delegate

extension IMCViewController: IMCViewDelegate {
    func notifyError(message: String) { self.showError(message: message) }
    func calculateButtonTapped(weight: String, height: String) {
        viewModel?.calculateIMC(height: height, weight: weight) }
}
