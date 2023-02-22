//
//  ProfileViewController.swift
//  TwitterClone
//
//  Created by  Mukhammed Ali Khamzayev on 21.02.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    private let profileTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier )
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Profile"
        profileTableView.delegate = self
        profileTableView.dataSource = self
        view.addSubview(profileTableView)
        let headerView = ProfileTableViewHeader(frame: CGRect(x: 0, y: 0, width: profileTableView.frame.width, height: 380))
        profileTableView.tableHeaderView = headerView
        configureConstraints()
    }
    
    private func configureConstraints() {
        profileTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
   
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {return UITableViewCell() }
        
        return cell
    }
    
    
}



