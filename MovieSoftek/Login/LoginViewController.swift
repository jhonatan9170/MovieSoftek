//
//  ViewController.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 11/11/23.
//

import UIKit
import MaterialComponents
import SimpleCheckbox

class LoginViewController: UIViewController {
    
    private let presenter: LoginPresenterProtocol
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.isEnabled = presenter.isTextFieldValid
        }
    }
    
    @IBOutlet weak var emailTextField: MDCOutlinedTextField! {
        didSet {
            emailTextField.label.font = UIFont(name: "helvetica neue", size: 16.0)
            emailTextField.label.text = "User"
            emailTextField.setOutlineColor(UIColor(white: 0.1, alpha: 0.5), for: .editing)
            emailTextField.setOutlineColor(UIColor(white: 0.1, alpha: 0.5), for: .normal)
            emailTextField.addTarget(self, action: #selector(fieldsDidChange), for: .editingChanged)
        }
    }
    @IBOutlet weak var passWordTextField: MDCOutlinedTextField! {
        didSet {
            passWordTextField.label.font = UIFont(name: "helvetica neue", size: 16.0)
            passWordTextField.label.text = "Contraseña"
            passWordTextField.setOutlineColor(UIColor(white: 0.1, alpha: 0.5), for: .editing)
            passWordTextField.setOutlineColor(UIColor(white: 0.1, alpha: 0.5), for: .normal)
            passWordTextField.addTarget(self, action: #selector(fieldsDidChange), for: .editingChanged)

        }
    }
    @IBOutlet weak var rememberCheckBox: Checkbox! {
        didSet {
            rememberCheckBox.checkedBorderColor = .purple
            rememberCheckBox.uncheckedBorderColor = .purple
            rememberCheckBox.checkmarkColor = .purple
            rememberCheckBox.addTarget(self, action: #selector(fieldsDidChange), for: .valueChanged)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: "LoginViewController", bundle: Bundle.main)
        presenter.setViewProtocol(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func fieldsDidChange() {
        let username = emailTextField.text ?? ""
        let password = passWordTextField.text ?? ""
        let keepLogin = rememberCheckBox.isChecked
        
        presenter.setData(username: username, password: password, keepLogin: keepLogin)
        
        loginButton.isEnabled = presenter.isTextFieldValid
    }
    
    @IBAction func showHidePasswordBtnTapped(_ sender: UIButton) {
        passWordTextField.isSecureTextEntry.toggle()
        sender.setImage(UIImage(systemName: passWordTextField.isSecureTextEntry ? "eye.fill" : "eye.slash.fill"), for: .normal)
    }
    
    @IBAction func ingresarBtnTapped(_ sender: UIButton) {
        presenter.login()
    }
}

extension LoginViewController: LoginViewProtocol {
    
    func updateLoading(isLoading: Bool) {
        isLoading ? view.addSpinner() : view.removeSpinner()
    }
}
