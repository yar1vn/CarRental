//
//  RentViewModel.swift
//  CarRental
//
//  Created by Yariv Nissim on 12/13/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import UIKit

final class CarRentalViewModel: NSObject {
    private let cellIdentifier: String

    init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
    }
}

// Make the view model responsible for formatting and updating data in the table view.
extension CarRentalViewModel: UITableViewDataSource {
    subscript(_ indexPath: IndexPath) -> String? {
        return nil
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        guard let rental = self[indexPath] else {
            return cell
        }
        configureCell(cell, with: rental)
        return cell
    }

    func configureCell(_ cell: UITableViewCell, with rental: String) {

    }
}
