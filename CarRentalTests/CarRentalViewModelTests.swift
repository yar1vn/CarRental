//
//  CarRentalViewModelTests.swift
//  CarRentalTests
//
//  Created by Yariv Nissim on 12/18/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import XCTest
import CoreLocation
@testable import CarRental

class CarRentalViewModelTests: XCTestCase {
    func testLoadRentals() {
        let expectation = XCTestExpectation(description: "Load Rentals")

        let viewModel = CarRentalViewModel(carRentalService: MockCarRentalService(), cellIdentifier: "")
        viewModel.stateChanged = { state in
            if case .rentals(let rentals) = state {
                expectation.fulfill()
            }
        }
        viewModel.loadRentals(for: CLLocationCoordinate2D(latitude: 100, longitude: 200),
                              dates: DateInterval(start: Date(), duration: 1))
        wait(for: [expectation], timeout: 5)
    }
}
