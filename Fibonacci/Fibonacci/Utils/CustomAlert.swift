//
//  CustomAlert.swift
//  Fibonacci
//
//  Created by Gagan Vishal on 2019/12/23.
//  Copyright © 2019 Gagan Vishal. All rights reserved.
//

import Foundation
import UIKit

class CustomAlert {
    //MARK:- Show an alert to user from a view controller
    class func showUserAlert(with title : String, message : String, buttonTitle : String, onViewController : UIViewController, withCallback callBack :((UIAlertAction) -> Void)?)
     {
        //1. Create alert controller
         let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //add action to alert controller
         alertController.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: callBack))
        //present on viewController
         onViewController.present(alertController, animated: true, completion: nil)
     }
}
