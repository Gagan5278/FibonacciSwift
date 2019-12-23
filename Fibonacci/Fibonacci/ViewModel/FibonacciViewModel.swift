//
//  FibonacciViewModel.swift
//  Fibonacci
//
//  Created by Gagan Vishal on 2019/12/23.
//  Copyright © 2019 Gagan Vishal. All rights reserved.
//

import Foundation

class FibonacciViewModel {
    //Number of rows in UITableView. Initially we are loading only 50 rows
    var numberOfRowsInTableView: Int = 50
    //Check whether overflow has been reached or not.
    var isNextFibonacciNumberAvailable: Bool = true
    //array to store store Fibonacci number
    var arrayOfNumber :Array<NSDecimalNumber> = [NSDecimalNumber]()
    // Lazy initialize NumberFormatter formatter
    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    var showLoadingHud: Bindable = Bindable(false)
    //MARK:- Fetch Fibonacci at given Int
    func fetchFibonacci(for input: Int) -> String {
        if input <= 2 && arrayOfNumber.count <= input {
            input > 1 ? arrayOfNumber.append(NSDecimalNumber(value: input - 1)) : arrayOfNumber.append(NSDecimalNumber(value: input))
            return formatter.string(from: arrayOfNumber.last!)! 
        }
        //If Fibonacci number alreay exist then return from here
        if arrayOfNumber.count > input {
            let decimal = arrayOfNumber[input]
            if let numberString = formatter.string(from: decimal) {
               return numberString
           }
           return ""
        }
        //1. Find the last Fibonacci number
        guard let object = arrayOfNumber.last else {
            return ""
        }
        /*
        REF READ:- Golden Ratio  https://www.quickanddirtytips.com/education/math/what-is-the-golden-ratio-and-how-is-it-related-to-the-fibonacci-sequence
         */
        //2. apply Godlen ratio rule
        if ((NSDecimalNumber(decimal: (object.decimalValue) * Constants.GoldenRation.goldenRationConstant)) == NSDecimalNumber.notANumber) {
            self.isNextFibonacciNumberAvailable = false
            return ""
        }
        //4. Find the number and round it 
        let decimal = (NSDecimalNumber(decimal: Constants.GoldenRation.goldenRationConstant).multiplying(by: object)).round(0)
        //5. Since we need only last number so no need to store all objects in array
//        arrayOfNumber.removeLast()
        //6. append latest number in array
        arrayOfNumber.append(decimal)
        //7. return StringObject from here
        if let numberString = formatter.string(from: decimal) {
            return numberString
        }
        return ""
    }
    
    //MARK:- Load more rows if available
    func loadMoreFibonacciNumbers() {
        self.showLoadingHud.value = true
        DispatchQueue.global(qos: .background).sync { [weak self] in
            //load more 50 rows
            numberOfRowsInTableView += 50
            //reload action
            self?.showLoadingHud.value = false
        }
    }
}
