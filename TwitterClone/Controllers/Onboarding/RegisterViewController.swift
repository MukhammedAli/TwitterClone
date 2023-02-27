//
//  RegisterViewController.swift
//  TwitterClone
//
//  Created by  Mukhammed Ali Khamzayev on 26.02.2023.
//

import UIKit

class RegisterViewController: UIViewController {

    private let registerTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "Create your account"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private let emailTextField: UITextField = {
       let textField = UITextField()
        textField.keyboardType = .emailAddress 
        textField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        return textField
    }()
    
    private let passwordlTextField: UITextField = {
       let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.isSecureTextEntry = true
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(registerTitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordlTextField)
        view.addSubview(registerButton)
        configureConstraints()
    }
    
    private let registerButton: UIButton = {
       let button = UIButton()
        button.setTitle("Create account", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.tintColor = .white
        return button
    }()
    
    private func configureConstraints() {
        registerTitleLabel.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(40)
           
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(registerTitleLabel.snp.bottom).inset(-80)
            $0.centerX.equalTo(registerTitleLabel.snp.centerX)
            $0.height.equalTo(60)
            $0.width.equalTo(view.frame.width - 40)
        }
        
        passwordlTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.top).inset(-60)
            $0.centerX.equalTo(registerTitleLabel.snp.centerX)
            $0.height.equalTo(60)
            $0.width.equalTo(view.frame.width - 40)
            
        }
        
        registerButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(20)
            $0.top.equalTo(passwordlTextField.snp.bottom).inset(-60)
            $0.width.equalTo(180)
            $0.height.equalTo(50)
        }
        
        
    }
    

}
