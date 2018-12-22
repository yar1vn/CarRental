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

    // MARK:- View Model
    private let viewModel = CarRentalViewModel(
        carRentalService: CarRentalService(apiKey: "ClckdS45oGCo1izQRM7vGR2U2AC3vdhm"),
        cellIdentifier: "RentalCell"
    )

    func handleState(state: CarRentalViewModel.State) {
        DispatchQueue.main.async {
            self.navigationItem.titleView = nil

            switch state {
            case .loading:
                self.navigationItem.titleView = self.loadingIndicator
            case .rentals(let rentals):
                self.title = "\(rentals.count) Rentals Found"
            fallthrough // reload the table after setting a title
            case .empty:
                self.tableView.reloadData()
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }

    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.stateChanged = self.handleState
        tableView.dataSource = viewModel
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Show search screen if no search was performed
        if case .empty = viewModel.state {
            performSegue(withIdentifier: "Search", sender: self)
        }
    }

    // MARK:- Unwind segues
    @IBAction func performSearch(_ segue: UIStoryboardSegue) {
        if let searchDataContainer = segue.source as? RentalSearchDataContainer & UIViewController {
            viewModel.loadRentals(for: searchDataContainer.rentalSearchData)
        }
    }

    @IBAction func cancel(_ segue: UIStoryboardSegue) {}

    // MARK:- Sorting
    @IBAction func sortByCompany() { sort(by: .company) }
    @IBAction func sortByDistance() { sort(by: .distance) }
    @IBAction func sortByPrice() { sort(by: .price) }

    private func sort(by sort: CarRentalViewModel.Sort) {
        let alert = UIAlertController(title: "Sort by \(sort.rawValue)", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ascending", style: .default, handler: { _ in
            self.viewModel.sort(by: sort, ascending: true)
        }))
        alert.addAction(UIAlertAction(title: "Decending", style: .default, handler: { _ in
            self.viewModel.sort(by: sort, ascending: false)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

