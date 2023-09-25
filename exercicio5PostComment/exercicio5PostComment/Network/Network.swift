//
//  Network.swift
//  exercicio5PostComment
//
//  Created by Lillian Souza Peixoto on 13/09/23.
//

import Foundation
import Alamofire

class Network {
    static let shared = Network()
    
    func request<T: Codable>(config: RequestModel,
                             type: T.Type,
                             completion: @escaping(T) -> Void) {
        AF.request(config.url, method: config.method).responseDecodable(of: type.self) { response in
            switch response.result {
            case .success(let data):
                completion(data)
            case .failure(_):
                print("erro")
            }
        }
        
    }
}
