//
//  Constants.swift
//  Fibonacci
//
//  Created by Gagan Vishal on 2019/12/23.
//  Copyright © 2019 Gagan Vishal. All rights reserved.
//

import Foundation

enum Constants {
    enum GoldenRation {
        static let goldenRationConstant: Decimal = 1.618034
    }
    
    //2. Constant message string in app
    enum UserMessages {
        public static let nextNumberNotAvailableTitle =  "Decimal number max limit reached"
        public static let nextNumberNotAvailableMessage = "Page limit reached for Decimal numbers.\n\nUnable to fetch next Fibonacci number in the series."
    }
}
