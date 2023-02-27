//
//  ProfileHeader.swift
//  TwitterClone
//
//  Created by  Mukhammed Ali Khamzayev on 21.02.2023.
//

import UIKit

class ProfileTableViewHeader: UIView {
    
    private enum SectionTabs: String {
        case tweets = "Tweets"
        case tweetsAndReplies = "Tweets & Replies"
        case media = "Media"
        case likes = "Likes"
        
        var index: Int {
            switch self {
            case .tweets: return 0
            case .tweetsAndReplies: return 1
            case .media: return 2
            case .likes: return 3
            }
        }
        
    }
    
    private let indicator: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        return view
    }()
    
    private var selectedTab: Int = 0 {
        didSet {
            print(selectedTab)
            for i in 0..<tabs.count {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) { [weak self] in
                    self?.stackView.arrangedSubviews[i].tintColor = i == self?.selectedTab ? .label : .secondaryLabel
                } completion: { _ in
                    
                }

                
            }
        }
    }
    
    
    private var tabs: [UIButton] = ["Tweets", "Tweets & Replies", "Media", "Likes"].map { buttonTitle in
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitle(buttonTitle, for: .normal)
        return button
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    private var followersTextLabel: UILabel = {
        let label = UILabel()
         label.text = "Followers"
         label.textColor = .secondaryLabel
         label.font = .systemFont(ofSize: 14, weight: .regular)
         return label
    }()
    
    private let followersCountLabel: UILabel = {
        let label = UILabel()
         label.text = "1M"
         label.textColor = .label
         label.font = .systemFont(ofSize: 14, weight: .bold)
         
         return label
    }()
    
    private let followingTextLabel: UILabel = {
       let label = UILabel()
        label.text = "Following"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let followingCountLabel: UILabel = {
       let label = UILabel()
        label.text = "314"
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .bold)
        
        return label
    }()
    
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
        backgroundColor = .systemBackground
        addSubview(profileHeaderImageView)
        addSubview(profileAvatarImageView)
        addSubview(displayNameLabel)
        addSubview(userNameLabel)
        addSubview(userBioLabel)
        addSubview(joinDateImageView)
        addSubview(joinedDateLabel)
        addSubview(followingCountLabel)
        addSubview(followingTextLabel)
        addSubview(followersCountLabel)
        addSubview(followersTextLabel)
        addSubview(stackView)
        addSubview(indicator)
        configureConstraints()
        configureStackButton()
    }
    
    private func configureStackButton() {
        for (i, button) in stackView.arrangedSubviews.enumerated()  {
            guard let button = button as? UIButton else {return}
            
            if i == selectedTab {
                button.tintColor = .label
            } else {
                button.tintColor = .secondaryLabel
            }
            button.addTarget(self, action: #selector(didTapTab(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func didTapTab(_ sender: UIButton) {
        guard let label = sender.titleLabel?.text else {return}
        switch label {
        case SectionTabs.tweets.rawValue:
            selectedTab = 0
        case SectionTabs.tweetsAndReplies.rawValue:
            selectedTab = 1
        case SectionTabs.media.rawValue:
            selectedTab = 2
        case SectionTabs.likes.rawValue:
            selectedTab = 3
        default:
            selectedTab = 0
        }
    }
    
    private func configureConstraints() {
        profileHeaderImageView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
            $0.height.equalTo(150)
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
        
        followingCountLabel.snp.makeConstraints {
            $0.left.equalTo(displayNameLabel.snp.left)
            $0.top.equalTo(joinedDateLabel.snp.bottom).inset(-10)
        }
        
        followingTextLabel.snp.makeConstraints {
            $0.left.equalTo(followingCountLabel.snp.right).inset(-4)
            $0.bottom.equalTo(followingCountLabel.snp.bottom)
        }
        
        followersCountLabel.snp.makeConstraints {
            $0.left.equalTo(followingTextLabel.snp.right).inset(-8)
            $0.bottom.equalTo(followingCountLabel.snp.bottom)
        }
        
        followersTextLabel.snp.makeConstraints {
            $0.left.equalTo(followersCountLabel.snp.right).inset(-4)
            $0.bottom.equalTo(followingCountLabel.snp.bottom)
        }
        
        stackView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(25)
            $0.right.equalToSuperview().inset(25)
            $0.top.equalTo(followingCountLabel.snp.bottom).inset(-5)
            $0.height.equalTo(35)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}














