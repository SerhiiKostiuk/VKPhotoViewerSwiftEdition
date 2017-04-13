//
//  VKLoginViewController.swift
//  VKPhotoViewerSwiftEdition
//
//  Created by Serhii Kostiuk on 4/13/17.
//  Copyright © 2017 Serhii Kostiuk. All rights reserved.
//

import UIKit

class VKLoginViewController: UIViewController, VKSdkUIDelegate,VKSdkDelegate {
    
    //# MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        VKSdk.initialize(withAppId: "5980007").register(self)

        VKSdk.instance().uiDelegate = self

    }
 
    //# MARK: - Actions

    @IBAction func onSignIn(_ sender: Any) {
        VKSdk.authorize([VK_PER_PHOTOS])
    }
    
    
    //# MARK: - VKSdkUIDelegate

    func vkSdkShouldPresent(_ controller: UIViewController!) {
        self.present(controller, animated: true, completion: nil)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        let vc = VKCaptchaViewController.captchaControllerWithError(captchaError)
        vc?.present(in: self)
    }
    
    //# MARK: - VKSdkDelegate

    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if (result.error != nil) {
            presentAlertController(delegate:self, message: result.error.localizedDescription)
            return
        }
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let identifier = "VKAlbumsListViewController"
        
        let albumsVC = storyboard.instantiateViewController(withIdentifier: identifier)
        
        self.navigationController?.pushViewController(albumsVC, animated: true)
    }
    
    func vkSdkUserAuthorizationFailed() {
        presentAlertController(delegate:self, message: "Authorization failed")
    }
    
}
