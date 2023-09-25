//
//  CommentsView.swift
//  exercicio5PostComment
//
//  Created by Lillian Souza Peixoto on 14/09/23.
//

import Foundation
import UIKit

class CommentsView: UIView {
    
    var comments: [CommentsModel] = []
    
    lazy var tableView: UITableView = {
        let tbView = UITableView()
        tbView.translatesAutoresizingMaskIntoConstraints = false
        tbView.backgroundColor = .white
        tbView.tableFooterView = UIView()
        tbView.showsVerticalScrollIndicator = false
        tbView.register(CommentsTableViewCell.self, forCellReuseIdentifier: CommentsTableViewCell.identifier)
        return tbView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
extension CommentsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.identifier,
                                                       for: indexPath) as? CommentsTableViewCell
        else { return UITableViewCell() }
        
        cell.titleLabel.text = comments[indexPath.row].name
        cell.bodyLabel.text = comments[indexPath.row].body
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
