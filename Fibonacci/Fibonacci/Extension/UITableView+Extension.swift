//
//  UITableView+Extension.swift
//  Fibonacci
//
//  Created by Gagan Vishal on 2019/12/23.
//  Copyright © 2019 Gagan Vishal. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func customReloadData(completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData()})
        {_ in completion() }
    }
}
