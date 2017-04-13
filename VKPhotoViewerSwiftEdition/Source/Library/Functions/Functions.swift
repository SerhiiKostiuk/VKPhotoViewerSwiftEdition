//
//  Functions.swift
//  VKPhotoViewerSwiftEdition
//
//  Created by Serhii Kostiuk on 4/13/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import Foundation

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

//func displayAlert() {
//    
//}
