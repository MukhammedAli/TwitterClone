//
//  OnboardingViewController.swift
//  TwitterClone
//
//  Created by  Mukhammed Ali Khamzayev on 26.02.2023.
//

import UIKit
import SnapKit
class OnboardingViewController: UIViewController {

    private let welcomeLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.text = "See what is happening in the world right now"
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    private let promptLabel: UILabel = {
       let label = UILabel()
        label.tintColor = .gray
        label.text = "Have an account already?"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 30
        button.setTitle("Create account", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.layer.masksToBounds = true
        button.tintColor = .white
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.tintColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(welcomeLabel)
        view.addSubview(createAccountButton)
        view.addSubview(promptLabel)
        view.addSubview(loginButton)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        configureConstraints()
    }
    
    @objc private func didTapCreateAccount
    () {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func configureConstraints() {
        welcomeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(20)
            $0.right.equalTo(-20)
        }
        
        createAccountButton.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).inset(-20)
            $0.right.equalTo(-20)
            $0.left.equalTo(20)
            $0.width.equalTo(welcomeLabel.snp.width)
            $0.height.equalTo(60)
        }
        
        promptLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.left.equalTo(promptLabel.snp.right).inset(-20)
            $0.centerY.equalTo(promptLabel.snp.centerY)
        }
    }
    



}









 

