//
//  RequestModel.swift
//  exercicio5PostComment
//
//  Created by Lillian Souza Peixoto on 13/09/23.
//

import Foundation
import Alamofire

struct RequestModel {
    let url: String
    var method: HTTPMethod = .get
}
