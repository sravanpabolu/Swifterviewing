//
//  Loader.swift
//  Swifterviewing
//
//  Created by Sravan on 15/09/21.
//  Copyright © 2021 World Wide Technology Application Services. All rights reserved.
//

import UIKit

class LoadingIndicator: UIView {
    static let shared = LoadingIndicator()
    
    private lazy var loader: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = UIColor.black
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func showLoader(on view: UIView) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            view.addSubview(self)
            self.addSubview(self.loader)
            
            self.loader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            self.loader.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            self.loader.heightAnchor.constraint(equalToConstant: 64).isActive = true
            self.loader.widthAnchor.constraint(equalToConstant: 64).isActive = true
        }
    }
    
    func dismissLoader() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.loader.stopAnimating()
            self.loader.removeFromSuperview()
            self.removeFromSuperview()
        }
    }
}
