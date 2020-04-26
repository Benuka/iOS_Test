//
//  ViewController.swift
//  Assignment
//
//  Created by Benuka Withanage on 4/24/20.
//  Copyright © 2020 Benuka Withanage. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @available(iOS 13.0, *)
    @IBAction func loginFBTapped(_ sender: Any) {
        //fbLogin()
        let mp = self.storyboard?.instantiateViewController(identifier: "ListViewController") as? ListViewController
        self.navigationController?.pushViewController(mp!, animated: true)
    }
    
    @available(iOS 13.0, *)
    func fbLogin() {
        
        let loginManager = LoginManager()
        loginManager.logOut()
        loginManager.logIn(permissions:[ .publicProfile, .email, .userFriends], viewController: self){ loginResult in
        
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User Cancelled Login")
            case .success(_, _, _):
                print("Logged In !")
                let mp = self.storyboard?.instantiateViewController(identifier: "ListViewController") as? ListViewController
                self.navigationController?.pushViewController(mp!, animated: true)
               // let mpvc =
                  //  self.storyboard?.instantiateViewController(withIdentifier: "ListView") as! ListView
               // self.present(mpvc, animated:true)
            }
        }
    }
    
}

