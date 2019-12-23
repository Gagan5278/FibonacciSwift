//
//  FibonacciViewModelTest.swift
//  FibonacciTests
//
//  Created by Gagan Vishal on 2019/12/23.
//  Copyright © 2019 Gagan Vishal. All rights reserved.
//

import XCTest
@testable import Fibonacci

class FibonacciViewModelTest: XCTestCase {
    var fibonacciViewModelObject: FibonacciViewModel!
    override func setUp() {
        self.fibonacciViewModelObject = FibonacciViewModel()
    }

    override func tearDown() {
        self.fibonacciViewModelObject = nil
    }

    func testLoadMoreFibonacciNumbers() {
        let totalRows = self.fibonacciViewModelObject.numberOfRowsInTableView
        self.fibonacciViewModelObject.loadMoreFibonacciNumbers()
        XCTAssertTrue(totalRows != self.fibonacciViewModelObject.numberOfRowsInTableView)
    }
    
    func testDecimalValueOverflow() {
        self.fibonacciViewModelObject.arrayOfNumber.append(NSDecimalNumber.maximum)
        _ = self.fibonacciViewModelObject.fetchFibonacci(for: 123456789)
        XCTAssertFalse(self.fibonacciViewModelObject.isNextFibonacciNumberAvailable)
    }
}
