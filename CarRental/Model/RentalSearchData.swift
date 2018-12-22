//
//  RentalSearchData.swift
//  CarRental
//
//  Created by Yariv Nissim on 12/21/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import Foundation
import CoreLocation

protocol RentalSearchDataContainer {
    var rentalSearchData: RentalSearchData { get }
}

struct RentalSearchData {
    let dates: DateInterval
    let location: CLLocationCoordinate2D
}
