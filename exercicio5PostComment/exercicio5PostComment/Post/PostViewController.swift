//
//  PostViewController.swift
//  exercicio5PostComment
//
//  Created by Lillian Souza Peixoto on 14/09/23.
//

import UIKit

class PostViewController: UIViewController {

    let viewModel = PostViewModel()
    let viewModelComments = CommentsViewModel()
    
    var id: Int?
    
    lazy var postView: PostView = {
        let view = PostView()
        view.delegate = self
        view.backgroundColor = .gray
        return view
    }()
    
    override func loadView() {
        self.view = postView
    
        viewModel.getPost {[weak self] posts in
            guard let self = self else { return }
        
            self.postView.posts = posts
            self.postView.tableView.reloadData()
            
        }
//        viewModelComments.getComments(id: id ?? 0) { [weak self] comments in
//            self.postView.comments = comments
//            self.postView.tableView.reloadData()
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension PostViewController: PostViewProtocol {
    
    func didTapPost(id: Int) {
        let vc = CommentsViewController()
        vc.id = id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

