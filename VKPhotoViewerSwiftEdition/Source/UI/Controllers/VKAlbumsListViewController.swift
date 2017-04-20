//
//  VKAlbumsListViewController.swift
//  VKPhotoViewerSwiftEdition
//
//  Created by Serhii Kostiuk on 4/13/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import UIKit

class VKAlbumsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var userAlbums = [AlbumModel]()
    
    @IBOutlet weak var albumsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(self.logout))
        // Do any additional setup after loading the view.
        
        getAlbums { (albums) in
        self.userAlbums = albums
        self.albumsTableView.reloadData()
        }
        
    }
    
    func logout() {
        VKSdk.forceLogout()
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.userAlbums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VKAlbumListTableViewCell", for: indexPath) as! VKAlbumListTableViewCell

        cell.fillCellWith(thumbUrl: userAlbums[indexPath.item].thumbUrl, title: userAlbums[indexPath.item].title)
        return cell
    }
   
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let identifier = "VKAlbumPhotosViewController"
        
        let photosVC = storyboard.instantiateViewController(withIdentifier: identifier) as! VKAlbumPhotosViewController
        
        photosVC.album = self.userAlbums[indexPath.item]
        
        self.navigationController?.pushViewController(photosVC, animated: true)
    }

}
