//
//  ProfileDataFormViewController.swift
//  TwitterClone
//
//  Created by  Mukhammed Ali Khamzayev on 07.03.2023.
//

import UIKit
import SnapKit

class ProfileDataFormViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.keyboardDismissMode = .onDrag
        return scrollView
    }()
    
    private let displayNameTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.backgroundColor = .secondarySystemFill
        textField.leftViewMode = .always
       
        return textField
        
    }()
    
    private let hintLabel: UILabel = {
        let label = UILabel()
        label.text = "Fill in your data"
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(hintLabel)
        
        isModalInPresentation = true
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        hintLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(30)
        }
    }
    


}






