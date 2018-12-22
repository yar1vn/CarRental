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
}

// MARK:- View Model Callbacks
extension CarRentalViewController {
    func handleState(state: CarRentalViewModel.State) {
        DispatchQueue.main.async {
            self.navigationItem.titleView = nil
            self.tableView.reloadData()

            switch state {
            case .loading:
                self.navigationItem.titleView = self.loadingIndicator
            case .rentals(let rentals):
                self.title = "\(rentals.count) Rentals Found"
            case .empty: break
            case .error(let error):
                let alert = UIAlertController(title: "Error Occurred", message: "Could not load rental cars. Please try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)

                print(error) // log the error to console
            }
        }
    }
}

// MARK:- Segues
extension CarRentalViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPath(for: sender),
            let rentalCar = viewModel[indexPath],
            var container = segue.destination as? CarRentalResultViewModelContainer else {
                return
        }
        container.carRentalResult = rentalCar
    }

    // Unwind segue
    @IBAction func performSearch(_ segue: UIStoryboardSegue) {
        guard let searchDataContainer = segue.source as? RentalSearchDataContainer else {
            return
        }
        viewModel.loadRentals(for: searchDataContainer.rentalSearchData)
    }

    // Unwind segue
    @IBAction func cancel(_ segue: UIStoryboardSegue) {}
}

// MARK:- Sorting
extension CarRentalViewController {
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

