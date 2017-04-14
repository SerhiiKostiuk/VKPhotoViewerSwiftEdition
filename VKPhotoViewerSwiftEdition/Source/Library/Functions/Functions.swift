//
//  Functions.swift
//  VKPhotoViewerSwiftEdition
//
//  Created by Serhii Kostiuk on 4/13/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import Foundation

//MARK: - display Alert VC
func presentAlertController(delegate: UIViewController, message: String) {
    let alert = UIAlertController (title: nil, message: message, preferredStyle: .alert)
    
    let okAction = UIAlertAction (title: "Ok", style: .default, handler: nil)
    
    alert.addAction(okAction)
    
    var displayAlert:() {
        delegate.present(alert, animated: true, completion: nil)
    }
    
    if !Thread.isMainThread {
        let mainQueue = DispatchQueue.main
        mainQueue.async {
            displayAlert
        }
    } else {
        displayAlert
    }
}

//MARK: - loadImages

func imageDownload(imageView: UIImageView, imageUrl: String, activityIndicatorStyle: UIActivityIndicatorViewStyle) {
    imageView.sd_setShowActivityIndicatorView(true)
    imageView.sd_setIndicatorStyle(activityIndicatorStyle)
    imageView.sd_setImage(with: URL(string: imageUrl))
}


func getAlbums(comletionHandler:@escaping (Array<AlbumModel>) ->Void) {
    let request = VKRequest(method: "photos.getAlbums", parameters: [VK_API_OWNER_ID:VKSdk.accessToken().userId, "need_covers": 1], modelClass: VKPhoto.self)
    request?.execute(resultBlock: { (response) in
        let jsonResult = response?.json as! NSDictionary
        let results = jsonResult["items"] as! NSArray
        var albums = Array<AlbumModel>()
        for result in results {
            let page = result as! NSDictionary

            let album = AlbumModel()
            album.thumbUrl = page.value(forKey:"thumb_src") as! String
            album.title = page.value(forKey:"title") as! String
            album.albumId = page.value(forKey:"id") as! Int

            albums.append(album)
        }
        comletionHandler(albums as Array<AlbumModel>)
    }, errorBlock: {(error) in
        print("Error: \(String(describing: error))")
    })
}
