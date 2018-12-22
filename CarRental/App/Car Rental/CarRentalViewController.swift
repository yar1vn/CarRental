//
//  CarRentalViewController.swift
//  CarRental
//
//  Created by Yariv Nissim on 12/13/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import UIKit

final class CarRentalViewController: UITableViewController {
    @IBOutlet private var loadingIndicator: UIActivityIndicatorView!

    private let viewModel = CarRentalViewModel(
        carRentalService: CarRentalService(apiKey: "ClckdS45oGCo1izQRM7vGR2U2AC3vdhm"),
        cellIdentifier: "RentalCell"
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.stateChanged = self.handleState
        tableView.dataSource = viewModel
    }

    func handleState(state: CarRentalViewModel.State) {
        DispatchQueue.main.async {
            self.navigationItem.titleView = nil

            switch state {
            case .loading:
                self.navigationItem.titleView = self.loadingIndicator
            case .rentals, .empty:
                self.tableView.reloadData()
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }
}

