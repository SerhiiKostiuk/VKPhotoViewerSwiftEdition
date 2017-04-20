//
//  VKPhotoDetailViewController.swift
//  VKPhotoViewerSwiftEdition
//
//  Created by Serhii Kostiuk on 4/13/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import UIKit

class VKPhotoDetailViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    var photo = PhotoModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageDownload(imageView: photoImageView, imageUrl: photo.fullPhotoUrl, activityIndicatorStyle: .gray)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
