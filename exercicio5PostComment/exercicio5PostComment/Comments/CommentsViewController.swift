//
//  CommentsViewController.swift
//  exercicio5PostComment
//
//  Created by Lillian Souza Peixoto on 14/09/23.
//

import UIKit

class CommentsViewController: UIViewController {

    let viewModel = CommentsViewModel()
    var id: Int?
    
    lazy var commentView: CommentsView = {
        let view = CommentsView()
        view.backgroundColor = .gray
        return view
    }()
    
    override func loadView() {
        self.view = commentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getComments(id: id ?? 0) {[weak self] comments in
            guard let self = self else { return }
            
            self.commentView.comments = comments
            self.commentView.tableView.reloadData()
        }
    }
    
    
}
