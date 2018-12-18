//
//  RentViewModel.swift
//  CarRental
//
//  Created by Yariv Nissim on 12/13/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import UIKit

final class CarRentalViewModel: NSObject {
    private let carRentalService: CarRentalService
    private let cellIdentifier: String

    init(carRentalService: CarRentalService, cellIdentifier: String) {
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

struct CarRentalResultViewModel {
    let provider: CarRentalProvider
    let location: CarRentalLocation
    let address: CarRentalAddress
    let car: CarRentalCar
}

// Flatten results
extension CarRentalResultViewModel {
    static func results(from results: [CarRentalResult]) -> [CarRentalResultViewModel] {
        return results.flatMap { result in
            return result.cars.map { car in
                return CarRentalResultViewModel(provider: result.provider,
                                                location: result.location,
                                                address: result.address,
                                                car: car)
            }
        }
    }
}
