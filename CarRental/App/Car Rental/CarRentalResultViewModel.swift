//
//  CarRentalResultViewModel.swift
//  CarRental
//
//  Created by Yariv Nissim on 12/17/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import Foundation
import CoreLocation

struct CarRentalResultViewModel {
    let provider: CarRentalProvider
    let location: CarRentalLocation
    let address: CarRentalAddress
    let car: CarRentalCar
    let distance: CLLocationDistance

    var estimatedTotal: Double {
        return Double(car.estimatedTotal?.amount ?? "0") ?? 0
    }

}

// Flatten results
extension CarRentalResultViewModel {
    static func distance(from coordinate: CLLocationCoordinate2D, to: CarRentalLocation) -> CLLocationDistance {
        let fromLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let toLocation = CLLocation(latitude: to.latitude, longitude: to.longitude)
        return toLocation.distance(from: fromLocation)
    }

    static func results(from results: [CarRentalResult], location: CLLocationCoordinate2D) -> [CarRentalResultViewModel] {
        return results.flatMap { result in
            return result.cars.map { car in
                let distance = self.distance(from: location, to: result.location)
                return CarRentalResultViewModel(provider: result.provider,
                                                location: result.location,
                                                address: result.address,
                                                car: car,
                                                distance: distance)
            }
        }
    }
}

