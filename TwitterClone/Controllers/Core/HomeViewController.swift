//
//  HomeViewController.swift
//  TwitterClone
//
//  Created by  Mukhammed Ali Khamzayev on 18.02.2023.
//

import UIKit

class HomeViewController: UIViewController {

    private let timelineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timelineTableView)
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.bounds
    }
    

    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {return UITableViewCell()}
        
        cell.backgroundColor = .systemBackground
        cell.delegate = self
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100    }
//    
    
}


extension HomeViewController: TweetTableViewCellDelegate {
    func tweetTableViewCellDidReply() {
        print("reply")
    }
    
    func tweetTableViewCellDidRetweet() {
        print("retweet")
    }
    
    func tweetTableViewCellDidLike() {
        print("like")
    }
    
    func tweetTableViewCellDidShare() {
        print("share")
    }
    
    
}
