//
//  PostView.swift
//  exercicio5PostComment
//
//  Created by Lillian Souza Peixoto on 14/09/23.
//

import Foundation
import UIKit
protocol PostViewProtocol: AnyObject {
    func didTapPost(id: Int)
}

class PostView: UIView {
    
    var posts: [PostModel] = []
    var comments: [CommentsModel] = []
    
    weak var delegate: PostViewProtocol?
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .cyan
        table.tableFooterView = UIView()
        table.showsVerticalScrollIndicator = false
        table.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
        self.setupTable()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTable() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
extension PostView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier,
                                                       for: indexPath) as? PostTableViewCell
        else { return UITableViewCell() }
        
        cell.titleLabel.text = posts[indexPath.row].title
        cell.bodyLabel.text = posts[indexPath.row].body

        //não é assim
        cell.nameLabel.text = comments[indexPath.row].name
        cell.bodyCommnetLabel.text = comments[indexPath.row].body
    
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didTapPost(id: posts[indexPath.row].id ?? 0)
    }
    
    
}
