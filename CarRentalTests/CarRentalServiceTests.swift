//
//  CarRentalTests.swift
//  CarRentalTests
//
//  Created by Yariv Nissim on 12/13/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import XCTest
import CoreLocation
@testable import CarRental

class CarRentalServiceTests: XCTestCase {
    func testGenerateURL() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        guard let start = formatter.date(from: "2018-12-15"),
            let end = formatter.date(from: "2018-12-20") else {
                XCTFail()
                return
        }

        let carRental = CarRentalService(apiKey: "12345")
        let url = carRental.generateURL(location: CLLocationCoordinate2D(latitude: 100, longitude: 200),
                                        dates: DateInterval(start: start, end: end))

        XCTAssertNotNil(url)
        XCTAssertEqual(url?.absoluteString.removingPercentEncoding, "https://api.sandbox.amadeus.com/v1.2/cars/search-circle?apikey=12345&latitude=100.0&longitude=200.0&radius=42&pick_up=2018-12-15&drop_off=2018-12-20")
    }
}
