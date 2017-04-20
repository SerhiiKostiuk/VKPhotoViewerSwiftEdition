//
//  VKAlbumPhotosViewController.swift
//  VKPhotoViewerSwiftEdition
//
//  Created by Serhii Kostiuk on 4/13/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import UIKit

class VKAlbumPhotosViewController: UICollectionViewController {

    @IBOutlet var photosCollectionView: UICollectionView!
    
    var album = AlbumModel()
    var photos = [PhotoModel]()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        getPhotos(album: album) { (photos) in
            print("")
            self.photos = photos as! [PhotoModel]
            self.photosCollectionView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    // MARK: - UICollectionViewDataSource

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VKAlbumPhotoCollectionViewCell", for: indexPath) as! VKAlbumPhotoCollectionViewCell
        
        cell.fillCellWith(thumbUrl: photos[indexPath.item].fullPhotoUrl)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let identifier = "VKPhotoDetailViewController"
        
        let photoDetailVC = storyboard.instantiateViewController(withIdentifier: identifier) as! VKPhotoDetailViewController
        
        photoDetailVC.photo = self.photos[indexPath.item]
        
        self.navigationController?.pushViewController(photoDetailVC, animated: true)
    }

    

}
