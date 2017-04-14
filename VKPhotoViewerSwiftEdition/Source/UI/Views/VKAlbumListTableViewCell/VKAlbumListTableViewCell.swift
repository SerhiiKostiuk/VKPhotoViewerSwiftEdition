//
//  VKAlbumListTableViewCell.swift
//  VKPhotoViewerSwiftEdition
//
//  Created by Serhii Kostiuk on 4/14/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import UIKit

class VKAlbumListTableViewCell: UITableViewCell {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func fillCellWith(thumbUrl: String, title:String) {
        albumTitleLabel.text = title
        imageDownload(imageView: self.albumImageView, imageUrl: thumbUrl, activityIndicatorStyle: .gray)
    }
}
