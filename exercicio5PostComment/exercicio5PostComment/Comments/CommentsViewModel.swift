//
//  CommentsViewModel.swift
//  exercicio5PostComment
//
//  Created by Lillian Souza Peixoto on 14/09/23.
//

import Foundation

class CommentsViewModel {
    
    let network = Network.shared
    let urlString = "https://jsonplaceholder.typicode.com/comments?postId="
    
    func getComments(id: Int, completion: @escaping([CommentsModel]) -> Void) {
        let requestConfig = RequestModel(url: urlString + String(id), method: .get)
        network.request(config: requestConfig, type: [CommentsModel].self) { data in
            completion(data)
        }
    }
}
