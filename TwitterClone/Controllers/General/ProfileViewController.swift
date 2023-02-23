//
//  ProfileViewController.swift
//  TwitterClone
//
//  Created by  Mukhammed Ali Khamzayev on 21.02.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    private var isStatusBarHidden: Bool = true
    
    private let statusBar: UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.opacity = 0
        return view
    }()
    
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
        view.addSubview(statusBar)
        let headerView = ProfileTableViewHeader(frame: CGRect(x: 0, y: 0, width: profileTableView.frame.width, height: 380))
        profileTableView.tableHeaderView = headerView
        configureConstraints()
        navigationController?.navigationBar.isHidden = true
        profileTableView.contentInsetAdjustmentBehavior = .never
    }
    
    private func configureConstraints() {
        profileTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        statusBar.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(view.bounds.height > 400 ? 40 : 20)
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = scrollView.contentOffset.y
        if yPosition > 140 && isStatusBarHidden {
            isStatusBarHidden = false
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) { [weak self] in
                self?.statusBar.layer.opacity = 1
            } completion: { _ in}

        } else if yPosition < 0 && !isStatusBarHidden {
             isStatusBarHidden = true
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) { [weak self] in
                self?.statusBar.layer.opacity = 0
            } completion: { _ in}
        }
    }
}



