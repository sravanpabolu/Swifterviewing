//
//  ViewModel.swift
//  Swifterviewing
//
//  Created by Sravan on 14/09/21.
//  Copyright © 2021 World Wide Technology Application Services. All rights reserved.
//

import Foundation

class ViewModel {
    var albums = [Album]()
    
    var rowHeight: Double {
        111.0
    }
    
    var urlString: String {
        Constants.URLs.baseURL + Constants.URLs.photosEndpoint
    }
    
    typealias completionHandler = ([Album]?, String?) -> Void
    
    func getAlbumData(_ urlString: String, completion: @escaping completionHandler) {
        API().getAlbums(for: urlString, callback: { (response) in
            switch response {
            case .success(let data):
                self.albums = data
                completion(data, nil)
                    
            case .failure(let error):
                var errorMessage = ""
                
                switch error {
                case .networkError:
                    errorMessage = Constants.ErrorMessages.networkError
                case .parseError:
                    errorMessage = Constants.ErrorMessages.parseError
                case .urlError:
                    errorMessage = Constants.ErrorMessages.urlError
                case .unknownError(let message):
                    errorMessage = message
                }
                
                completion(nil, errorMessage)
            }
        })
    }
    
    func getURL(for index: Int) -> URL? {
        guard let urlString = albums[index].thumbnailURL,
            let url = URL(string: urlString) else {
            return nil
        }
        return url
    }
    
    func getAlbumTitle(for index: Int) -> String {
        getFormattedString(albums[index].title ?? "")
    }
    
    func getFormattedString(_ string: String) -> String {
        string.replacingOccurrences(of: "e", with: "", options: .caseInsensitive)
    }
}
