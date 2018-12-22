//
//  CarRentalResultViewModel.swift
//  CarRental
//
//  Created by Yariv Nissim on 12/17/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import Foundation
import CoreLocation

protocol CarRentalResultViewModelContainer {
    var carRentalResult: CarRentalResultViewModel! { get set }
}

struct CarRentalResultViewModel {
    let company: String
    let location: CLLocationCoordinate2D
    let address: String
    let airport: String?
    let price: Double
    let car: String
    let distance: Measurement<UnitLength>
    let imageURL: URL?
    let vehicle: CarRentalVehicleInfo

    private let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()

    private let distanceFormatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .long
        return formatter
    }()
}

extension CarRentalResultViewModel {
    var formattedPrice: String {
        return priceFormatter.string(from: NSNumber(value: price)) ?? ""
    }

    var formattedDistance: String {
        return distanceFormatter.string(from: distance)
    }

    var rentalSummary: String {
        return "\(car) for \(formattedPrice)"
    }

    var companySummary: String {
        return "\(company). \(formattedDistance) - \(airport ?? address)"
    }
}

extension CarRentalResultViewModel {
    /// Use CoreLocation to calculate the distance between a coordinate to the rental location
    private static func distance(from coordinate: CLLocationCoordinate2D, to: CarRentalLocation) -> Measurement<UnitLength> {
        let fromLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let toLocation = CLLocation(latitude: to.latitude, longitude: to.longitude)
        let distanceInMeters = toLocation.distance(from: fromLocation)
        return Measurement(value: distanceInMeters, unit: UnitLength.meters)
    }

    /// Convert the results into a formatted struct
    static func results(from results: [CarRentalResult], location: CLLocationCoordinate2D) -> [CarRentalResultViewModel] {
        // Helper method
        func formatAddress(_ address: CarRentalAddress) -> String {
            let region = address.region.map { ", \($0)" } ?? ""
            let postalCode = address.postalCode.map { " \($0)" } ?? ""
            return "\(address.line1), \(address.city)" + region + postalCode
        }

        // Flatten results
        return results.flatMap { result in
            return result.cars.map { car in
                let type = car.vehicleInfo.type.map { " \($0)" } ?? ""
                let vehicle = "\(car.vehicleInfo.category)" + type

                return CarRentalResultViewModel(
                    company: result.provider.companyName,
                    location: CLLocationCoordinate2D(latitude: result.location.latitude, longitude: result.location.longitude),
                    address: formatAddress(result.address),
                    airport: result.airport.map { "Airport: \($0)" },
                    price: car.estimatedTotal.flatMap { Double($0.amount) } ?? 0,
                    car: vehicle,
                    distance: distance(from: location, to: result.location),
                    imageURL: car.image?.url,
                    vehicle: car.vehicleInfo
                )
            }
        }
    }
}

