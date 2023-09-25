//
//  PostViewModel.swift
//  exercicio5PostComment
//
//  Created by Lillian Souza Peixoto on 13/09/23.
//

import Foundation

class PostViewModel {
    
    let network = Network.shared
    let urlStr = "https://jsonplaceholder.typicode.com/posts"
    
    
    func getPost(completion: @escaping([PostModel]) -> Void) {
        let requestConfig = RequestModel(url: urlStr, method: .get)
        network.request(config: requestConfig, type: [PostModel].self) { post in
            print(post)
            completion(post)
        }
    }
}
