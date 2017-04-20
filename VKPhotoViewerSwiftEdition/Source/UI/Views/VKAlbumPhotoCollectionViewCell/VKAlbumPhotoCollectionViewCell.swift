//
//  VKAlbumPhotoCollectionViewCell.swift
//  VKPhotoViewerSwiftEdition
//
//  Created by Serhii Kostiuk on 4/19/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import UIKit

class VKAlbumPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    func fillCellWith(thumbUrl: String) {
        imageDownload(imageView: self.photoImageView, imageUrl: thumbUrl, activityIndicatorStyle: .gray)
    }
}
