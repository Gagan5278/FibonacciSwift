//
//  Bindable.swift
//  Fibonacci
//
//  Created by Gagan Vishal on 2019/12/23.
//  Copyright © 2019 Gagan Vishal. All rights reserved.
//

import Foundation
class Bindable<T>{
    typealias Listener = ((T) -> Void)
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        self.value = v
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
}
