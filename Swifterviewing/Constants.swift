//
//  Constants.swift
//  Swifterviewing
//
//  Created by Sravan on 14/09/21.
//  Copyright © 2021 World Wide Technology Application Services. All rights reserved.
//

import Foundation

struct Constants {
    struct ErrorMessages {
        static let networkError = "Oops. Please check the network connection."
        static let parseError = "Oops. Invalid response from the server"
        static let urlError = "Invalid URL"
    }
    
    struct URLs {
        static let baseURL = "https://jsonplaceholder.typicode.com/"
        static let photosEndpoint = "photos" //returns photos and their album ID
        static let albumsEndpoint = "albums" //returns an album, but without photos
    }
    
    static let titleAlert = "Alert"
    static let albumCellIdentifier = "AlbumCell"
}
