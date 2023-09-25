//
//  CommentsModel.swift
//  exercicio5PostComment
//
//  Created by Lillian Souza Peixoto on 14/09/23.
//

import Foundation

struct CommentsModel: Codable {
    
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
    
}
