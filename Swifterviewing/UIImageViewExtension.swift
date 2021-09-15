//
//  UIImageViewExtension.swift
//  Swifterviewing
//
//  Created by Sravan on 15/09/21.
//  Copyright © 2021 World Wide Technology Application Services. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let imageV = UIImage(data: data) {
                    DispatchQueue.main.async { [weak self] in
                        guard let weakSelf = self else {
                            return
                        }
                        weakSelf.image = imageV
                    }
                }
            }
        }
    }
}
