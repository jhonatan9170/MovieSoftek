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
    
    var presenter: LoginPresenterProtocol?
    
    @IBOutlet weak var emailTextField: MDCOutlinedTextField!
    @IBOutlet weak var passWordTextField: MDCOutlinedTextField!
    @IBOutlet weak var rememberCheckBox: Checkbox!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFields()
        setCheckBox()
    }
    
    func setTextFields() {
        emailTextField.label.font = UIFont(name: "helvetica neue", size: 16.0)
        emailTextField.label.text = "User"
        emailTextField.setOutlineColor(UIColor(white: 0.1, alpha: 0.5), for: .editing)
        emailTextField.setOutlineColor(UIColor(white: 0.1, alpha: 0.5), for: .normal)
        
        passWordTextField.label.font = UIFont(name: "helvetica neue", size: 16.0)
        passWordTextField.label.text = "Contraseña"
        passWordTextField.setOutlineColor(UIColor(white: 0.1, alpha: 0.5), for: .editing)
        passWordTextField.setOutlineColor(UIColor(white: 0.1, alpha: 0.5), for: .normal)
    }
    
    func setCheckBox(){
        rememberCheckBox.checkedBorderColor = .purple
        rememberCheckBox.uncheckedBorderColor = .purple
        rememberCheckBox.checkmarkColor = .purple
        rememberCheckBox.valueChanged = {[weak self] (isChecked) in
        }
    }
    
    @IBAction func showHidePasswordBtnTapped(_ sender: UIButton) {
        if passWordTextField.isSecureTextEntry {
            passWordTextField.isSecureTextEntry = false
            sender.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            passWordTextField.isSecureTextEntry = true
            sender.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }
    
    @IBAction func ingresarBtnTapped(_ sender: UIButton) {
        guard let username = emailTextField.text, let password = passWordTextField.text else { return }
        presenter?.login(username: username, password: password,keepLogin: rememberCheckBox.isChecked)
    }
}

extension LoginViewController:LoginViewProtocol {

    func updateLoading(isLoading: Bool) {
        DispatchQueue.main.async { [weak self] in
            isLoading ? self?.view.addSpinner() : self?.view.removeSpinner()
        }
    }
}
