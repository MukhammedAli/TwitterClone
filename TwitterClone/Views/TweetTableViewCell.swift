//
//  TweetTableViewCell.swift
//  TwitterClone
//
//  Created by  Mukhammed Ali Khamzayev on 18.02.2023.
//

import UIKit
import SnapKit

protocol TweetTableViewCellDelegate: AnyObject {
    func tweetTableViewCellDidReply()
    func tweetTableViewCellDidRetweet()
    func tweetTableViewCellDidLike()
    func tweetTableViewCellDidShare()
}

class TweetTableViewCell: UITableViewCell {

    weak var delegate: TweetTableViewCellDelegate?
    
    private let actionSpacing: CGFloat = 60
    
    static let identifier = "TweetTableViewCell"
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .white
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1.0
        return imageView
    }()
    
    private let displayNameLabel: UILabel = {
        
       let label = UILabel()
        label.text = "Khamzayev Mukhammed Ali"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
        
    }()
    
    private let userNameLabel: UILabel = {
       let label = UILabel()
        label.text = "@khamzayev"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize:  16, weight: .regular )
        return label
    }()
    
    private let tweetTextContentLabel: UILabel = {
       let label = UILabel()
        label.text = "Hello everyone, this is first mockup tweet. Hope you will enjoy! Scanner in = new Scanner(System.in); int a = in.nextInt(); int b = in.nextInt();sdfasdfasdfasdfasdfasdfasdf"
        label.numberOfLines = 0
        return label
    }()
    
    private let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(tweetTextContentLabel)
        contentView.addSubview(replyButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        configureConstraints()
        configureButtons()
    }
    
    @objc private func didTapReply() {
        delegate?.tweetTableViewCellDidReply()
    }
    
    @objc private func didTapRetweet() {
        delegate?.tweetTableViewCellDidRetweet()
    }
    
    @objc private func didTapLike() {
        delegate?.tweetTableViewCellDidLike()
    }
    
    @objc private func didTapShare() {
        delegate?.tweetTableViewCellDidShare()
    }
    
    private func configureButtons() {
        replyButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
    }
    
    private func configureConstraints() {
        avatarImageView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(14)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        displayNameLabel.snp.makeConstraints {
            $0.left.equalTo(avatarImageView.snp.right).inset(-20)
            $0.top.equalToSuperview().inset(20)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.left.equalTo(displayNameLabel.snp.right).inset(-20)
            $0.top.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(10)
        }
        
        tweetTextContentLabel.snp.makeConstraints {
            $0.left.equalTo(displayNameLabel.snp.left)
            $0.top.equalTo(displayNameLabel.snp.bottom).inset(-10)
            $0.right.equalToSuperview().inset(15)
        }
        
        replyButton.snp.makeConstraints {
            $0.left.equalTo(tweetTextContentLabel.snp.left)
            $0.top.equalTo(tweetTextContentLabel.snp.bottom).inset(-10)
            $0.bottom.equalToSuperview().inset(15)      }
        
        retweetButton.snp.makeConstraints {
            $0.left.equalTo(replyButton.snp.right).inset(-40)
            $0.top.equalTo(tweetTextContentLabel.snp.bottom).inset(-10)
            $0.bottom.equalToSuperview().inset(15)
        }
        
        likeButton.snp.makeConstraints {
            $0.left.equalTo(retweetButton.snp.right).inset(-40)
            $0.top.equalTo(tweetTextContentLabel.snp.bottom).inset(-10)
            $0.bottom.equalToSuperview().inset(15)
        }
        
        shareButton.snp.makeConstraints {
            $0.left.equalTo(likeButton.snp.right).inset(-40)
            $0.top.equalTo(tweetTextContentLabel.snp.bottom).inset(-10)
            $0.bottom.equalToSuperview().inset(15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    

}
