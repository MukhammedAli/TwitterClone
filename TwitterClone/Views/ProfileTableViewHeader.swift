//
//  ProfileHeader.swift
//  TwitterClone
//
//  Created by  Mukhammed Ali Khamzayev on 21.02.2023.
//

import UIKit

class ProfileTableViewHeader: UIView {
    
    private let joinedDateLabel: UILabel = {
       let label = UILabel()
        label.text = "Joined May 2021"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular )
        
        return label
    }()
    
    private let joinDateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "calendar", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        imageView.tintColor = .secondaryLabel
        return imageView
    }()
    
    private let userBioLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textColor = .label
        label.text = "iOS developer"
        return label
    }()
    
    private let userNameLabel: UILabel = {
       let label = UILabel()
        label.text = "@khamzayev"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let displayNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Mukhammed Ali"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let profileAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private let profileHeaderImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "headerImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemRed
        addSubview(profileHeaderImageView)
        addSubview(profileAvatarImageView)
        addSubview(displayNameLabel)
        addSubview(userNameLabel)
        addSubview(userBioLabel)
        addSubview(joinDateImageView)
        addSubview(joinedDateLabel)
        configureConstraints()
    }
    
    private func configureConstraints() {
        profileHeaderImageView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
            $0.height.equalTo(180)
        }
        
        profileAvatarImageView.snp.makeConstraints {
            $0.left.equalToSuperview().inset( 20)
            $0.top.equalTo(profileHeaderImageView.snp.bottom).inset(30)
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        
        displayNameLabel.snp.makeConstraints {
            $0.left.equalTo(profileAvatarImageView.snp.left)
            $0.top.equalTo(profileAvatarImageView.snp.bottom).inset(-20)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.left.equalTo(displayNameLabel.snp.left)
            $0.top.equalTo(displayNameLabel.snp.bottom).inset(-5)
        }
        
        userBioLabel.snp.makeConstraints {
            $0.left.equalTo(displayNameLabel.snp.left)
            $0.right.equalToSuperview().inset(5)
            $0.top.equalTo(userNameLabel.snp.bottom).inset(-5)
        }
        
        joinDateImageView.snp.makeConstraints {
            $0.left.equalTo(displayNameLabel.snp.left)
            $0.top.equalTo(userBioLabel.snp.bottom).inset(-5)
        }
        
        joinedDateLabel.snp.makeConstraints {
            $0.left.equalTo(joinDateImageView.snp.right).inset(-2)
            $0.bottom.equalTo(joinDateImageView.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}














