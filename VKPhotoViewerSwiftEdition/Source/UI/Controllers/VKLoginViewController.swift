//
//  VKLoginViewController.swift
//  VKPhotoViewerSwiftEdition
//
//  Created by Serhii Kostiuk on 4/13/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import UIKit

class VKLoginViewController: UIViewController, VKSdkUIDelegate, VKSdkDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        VKSdk.instance().uiDelegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        self.present(controller, animated: true, completion: nil)
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
