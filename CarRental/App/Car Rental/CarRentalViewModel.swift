//
//  RentViewModel.swift
//  CarRental
//
//  Created by Yariv Nissim on 12/13/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import UIKit
import CoreLocation

final class CarRentalViewModel: NSObject {
    private let carRentalService: CarRentalServiceProtocol
    private let cellIdentifier: String

    init(carRentalService: CarRentalServiceProtocol, cellIdentifier: String) {
        self.carRentalService = carRentalService
        self.cellIdentifier = cellIdentifier
    }

    // The view controller should subscribe to this.
    // this could be upgraded with Rx in the future.
    var stateChanged: ((State) -> Void)?

    private var state: State = .empty {
        didSet {
            stateChanged?(state)
        }
    }

    // Use State to store relevant data.
    enum State {
        case rentals([CarRentalResultViewModel])
        case loading
        case empty
        case error(Error)

        func getCarRentals() -> [CarRentalResultViewModel]? {
            guard case let .rentals(rentals) = self else {
                return nil
            }
            return rentals
        }
    }

    func loadRentals(for location: CLLocationCoordinate2D, dates: DateInterval) {
        state = .loading

        carRentalService.getRentals(location: location, dates: dates) { result in
            do {
                let response = try result.get()
                let rentals = CarRentalResultViewModel.results(from: response.results, location: location)
                self.state = .rentals(rentals)
            } catch {
                self.state = .error(error)
            }
        }
    }
}

// Sorting
extension CarRentalViewModel {
    enum Sort: String, CaseIterable {
        case company = "Company"
        case distance = "Distance"
        case price = "Price"
    }

    func sort(by sorting: Sort, ascending: Bool) {
        switch sorting {
        case .company:
            sort(keyPath: \.provider.companyName, ascending: ascending)
        case .distance:
            sort(keyPath: \.distance, ascending: ascending)
        case .price:
            sort(keyPath: \.estimatedTotal, ascending: ascending)
        }
    }

    private func sort<C: Comparable>(keyPath: KeyPath<CarRentalResultViewModel, C>, ascending: Bool) {
        guard let rentals = state.getCarRentals() else {
            return
        }
        let results = rentals.lazy.sorted {
            $0[keyPath: keyPath] < $1[keyPath: keyPath]
        }
        if ascending {
            state = .rentals(results)
        } else {
            state = .rentals(results.reversed())
        }
    }
}

// Make the view model responsible for formatting and updating data in the table view.
extension CarRentalViewModel: UITableViewDataSource {
    subscript(_ indexPath: IndexPath) -> CarRentalResultViewModel? {
        guard let rentals = state.getCarRentals() else {
            return nil
        }
        return rentals[indexPath.row]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.getCarRentals()?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        guard let rental = self[indexPath] else {
            return cell
        }
        configureCell(cell, with: rental)
        return cell
    }

    func configureCell(_ cell: UITableViewCell, with rental: CarRentalResultViewModel) {

    }
}
