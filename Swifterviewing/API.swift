//
//  API.swift
//  Swifterviewing
//
//  Created by Tyler Thompson on 7/9/20.
//  Copyright © 2020 World Wide Technology Application Services. All rights reserved.
//

import Foundation

enum AlbumError: Error {
    case networkError, parseError, urlError
    case unknownError(errorMessage: String)
}

struct API {
    //TODO: Add documentation
    func getAlbums(for url: String, callback: @escaping (Result<[Album], AlbumError>) -> Void) {
        
        guard let url = URL(string: url) else {
            callback(.failure(.urlError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                callback(.failure(.unknownError(errorMessage: error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                callback(.failure(.networkError))
                return
            }
            
            do {
                let response = try JSONDecoder().decode([Album].self, from: data)
                callback(.success(response))
            } catch {
                callback(.failure(.parseError))
            }
        }
        task.resume()
    }
}

