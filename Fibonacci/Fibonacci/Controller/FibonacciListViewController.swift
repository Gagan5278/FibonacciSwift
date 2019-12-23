//
//  FibonacciListViewController.swift
//  Fibonacci
//
//  Created by Gagan Vishal on 2019/12/23.
//  Copyright © 2019 Gagan Vishal. All rights reserved.
//

import UIKit

class FibonacciListViewController: UITableViewController {
    //cell Identifier
    let cellIdentifier = "cellReuseIdentifier"
    //FibonacciViewModel Object
    let fibonacciViewModelObject = FibonacciViewModel()
    //ActivityIndicator object. This will be added as a view on Table footer view. Hardly Visible becuase load operation is very fast
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
        activityIndicator.tintColor = .blue
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    //MARK:- View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //1. Bind PhotoListView Model listner
        bindPhotoListViewModel()
        //2. SetUp footer view of UITableView
        self.tableView.tableFooterView = self.activityIndicator
    }

    //MARK:- Bind Beneficiarie Model
    private func bindPhotoListViewModel()
    {
        fibonacciViewModelObject.showLoadingHud.bind() {  visible in
            DispatchQueue.main.async { [weak self] in
                self?.handleNextPageDownloadUI(isVisible: visible)
            }
        }
    }
    
    fileprivate func handleNextPageDownloadUI(isVisible: Bool) {
        if isVisible == false
        {
            self.tableView.customReloadData { [weak self] in
                self?.tableView.tableFooterView!.isHidden = true
            }
            self.tableView.tableFooterView!.isHidden = true
        }
        else
        {
            self.tableView.tableFooterView!.isHidden = false
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fibonacciViewModelObject.numberOfRowsInTableView
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = self.fibonacciViewModelObject.fetchFibonacci(for: indexPath.row)
        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == fibonacciViewModelObject.numberOfRowsInTableView - 1 {
            //check if next number is available or not
            if fibonacciViewModelObject.isNextFibonacciNumberAvailable {
                fibonacciViewModelObject.loadMoreFibonacciNumbers()
            }
           else {
                CustomAlert.showUserAlert(with: Constants.UserMessages.nextNumberNotAvailableTitle, message: Constants.UserMessages.nextNumberNotAvailableMessage, buttonTitle: "OK", onViewController: self, withCallback: nil)
           }
        }
    }
}
