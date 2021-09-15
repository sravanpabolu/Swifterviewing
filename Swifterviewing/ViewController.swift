//
//  ViewController.swift
//  Swifterviewing
//
//  Created by Tyler Thompson on 7/9/20.
//  Copyright © 2020 World Wide Technology Application Services. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        self.showActivityIndicator(on: self.view)
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            self.getAlbums()
        }
    }
    
    func getAlbums() {
        viewModel.getAlbumData(viewModel.urlString, completion: { (albumData, error) in
            if let error = error {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                    self.dismissActivityIndicator()
                    self.showAlert(message: error)
                })
            } else {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.dismissActivityIndicator()
                    self.tableView.reloadData()
                }
            }
        })
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: AlbumCell = tableView.dequeueReusableCell(withIdentifier: Constants.albumCellIdentifier, for: indexPath) as? AlbumCell else { return UITableViewCell() }
        cell.lblTitle.text = viewModel.getAlbumTitle(for: indexPath.row)
        if let url = viewModel.getURL(for: indexPath.row) {
            cell.imgView.loadImage(url:url)
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.rowHeight)
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
