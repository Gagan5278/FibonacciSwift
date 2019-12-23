//
//  FibonacciTests.swift
//  FibonacciTests
//
//  Created by Gagan Vishal on 2019/12/23.
//  Copyright © 2019 Gagan Vishal. All rights reserved.
//

import XCTest
@testable import Fibonacci

class FibonacciListViewControllerTest: XCTestCase {
    var fibonacciListViewControllerObject: FibonacciListViewController!
    
    override func setUp() {
        controllerSetup()
        self.fibonacciListViewControllerObject.viewDidLoad()
    }

    override func tearDown() {
        self.fibonacciListViewControllerObject = nil
    }

    fileprivate func controllerSetup() {
        if let viewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "FibonacciListView") as? FibonacciListViewController {
            self.fibonacciListViewControllerObject = viewController
        }
    }
    
    //MARK:- Test view available or not
    func testMainView() {
        XCTAssertNotNil(self.fibonacciListViewControllerObject.view, "Could not load view from storyboard")
    }

    //MARK:- Test TableView
    func testTableView() {
        XCTAssertNotNil(self.fibonacciListViewControllerObject.tableView, "Could not load TableView")
    }

    
    //MARK:- Test TableView Delegate
    func testTableViewDelegate() {
        XCTAssertNotNil(self.fibonacciListViewControllerObject.tableView.delegate, "TableView Delegate is nil")
    }

    //MARK:- Test View Confirm TableView Delegate
    func testViewConfirmTableViewDelegate()
    {
        XCTAssertTrue(self.fibonacciListViewControllerObject.conforms(to: UITableViewDelegate.self), "View does not confirm tableView Delegate")
    }
    
    //MARK:- Test TableView DataSource
    func testViewHasTableViewDataSource()
    {
        XCTAssertNotNil(self.fibonacciListViewControllerObject.tableView.dataSource, "Table view data source is nil")
    }
    
    //MARK:- Test View Confrim DataSource Protocol
    func testViewConfirmTableViewDataSource() {
        
        XCTAssertTrue(self.fibonacciListViewControllerObject.conforms(to: UITableViewDataSource.self), "View does not confirm tableView DataSource")
    }
    
    //MARK:- Test Number of rows in UITableView
    func testNumberOfRowsInTableView()
    {
      fakeDataSetup()
       XCTAssertTrue(self.fibonacciListViewControllerObject.tableView.numberOfRows(inSection: 0) != 0, "Number of rows can't be zero in tableview")
    }
    
    //MARK:- test Table Footer view
    func testTableFooterView()
    {
        XCTAssertTrue(self.fibonacciListViewControllerObject.tableView.tableFooterView  is UIActivityIndicatorView)
    }
    
    //MARK:- Test cellForRowAtIndexPath
    func testForCellInUITableVieew()
    {
        fakeDataSetup()
         let cellItem = self.fibonacciListViewControllerObject.tableView.dequeueReusableCell(withIdentifier: self.fibonacciListViewControllerObject.cellIdentifier)
        XCTAssertNotNil(cellItem, "Cell not found in UITableView")
    }

    fileprivate func fakeDataSetup() {
        self.fibonacciListViewControllerObject.fibonacciViewModelObject.arrayOfNumber = [NSDecimalNumber(integerLiteral: 123)]
        self.fibonacciListViewControllerObject.fibonacciViewModelObject.numberOfRowsInTableView = self.fibonacciListViewControllerObject.fibonacciViewModelObject.arrayOfNumber.count
    }
}
