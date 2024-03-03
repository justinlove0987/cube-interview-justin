//
//  APIController.swift
//  cube-interview-justin
//
//  Created by 曾柏楊 on 2024/2/24.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case requestFailed(Error)
    case invalidData
    case invalidResponse
}

class APIController {
    
    static let shared = APIController()
    
    private init() {}
    
    let baseURL = "https://dimanyen.github.io"
    
    func getUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        guard let url = URL(string: "https://dimanyen.github.io/man.json") else {
                completion(.failure(.invalidUrl))
                return
            }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(.requestFailed(error)))
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(UserModel.self, from: data!)
                let users = response.users
                completion(.success(users))
                
            } catch {
                completion(.failure(.invalidData))
            }
            
        }.resume()
    }
    
    func getFriends(completion: @escaping (Result<[Friend], NetworkError>) -> Void) {
        guard let url = URL(string: "https://dimanyen.github.io/friend1.json") else {
                completion(.failure(.invalidUrl))
                return
            }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(.requestFailed(error)))
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(FriendModel.self, from: data!)
                let friends = response.friends
                completion(.success(friends))
            } catch {
                completion(.failure(.invalidData))
            }
            
        }.resume()
    }
}


