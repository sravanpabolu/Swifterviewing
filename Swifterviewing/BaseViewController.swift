//
//  BaseViewController.swift
//  Swifterviewing
//
//  Created by Sravan on 14/09/21.
//  Copyright © 2021 World Wide Technology Application Services. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    func showActivityIndicator(on view: UIView) {
        LoadingIndicator.shared.showLoader(on: view)
    }
    
    func dismissActivityIndicator() {
        LoadingIndicator.shared.dismissLoader()
    }
    
    func showAlert(title: String = "Alert", message: String) {
        DispatchQueue.main.async(execute: {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true)
        })
    }
}
