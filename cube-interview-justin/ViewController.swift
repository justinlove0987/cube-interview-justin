//
//  ViewController.swift
//  cube-interview-justin
//
//  Created by 曾柏楊 on 2024/2/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let apiController = APIController.shared.getUsers { users in
            print(users)
            
        }
        
//        APIController.shared.getFriends()
        
    }


}

