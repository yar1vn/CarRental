//
//  CarRental.swift
//  CarRental
//
//  Created by Yariv Nissim on 12/13/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import Foundation

// Used quicktype app to generate this JSON with some modifications.
// https://itunes.apple.com/us/app/paste-json-as-code-quicktype/id1330801220?mt=12

struct CarRentalResponse: Codable, Hashable {
    let results: [CarRentalResult]
}

struct CarRentalResult: Codable, Hashable {
    let provider: CarRentalProvider
    let branchID: String
    let location: CarRentalLocation
    let airport: String
    let address: CarRentalAddress
    let cars: [CarRentalCar]
}

struct CarRentalAddress: Codable, Hashable {
    let line1: String
    let city: String
    let region: String
    let country: String
}

struct CarRentalCar: Codable, Hashable {
    let vehicleInfo: CarRentalVehicleInfo
    let rates: [CarRentalRate]
    let estimatedTotal: CarRentalEstimatedTotal
}

struct CarRentalEstimatedTotal: Codable, Hashable {
    let amount: String
    let currency: String
}

struct CarRentalRate: Codable, Hashable {
    let type: String
    let price: CarRentalEstimatedTotal
}

struct CarRentalVehicleInfo: Codable, Hashable {
    let acrissCode: String
    let transmission: String
    let fuel: String
    let airConditioning: Bool
    let category: String
    let type: String
}

struct CarRentalLocation: Codable, Hashable {
    let latitude: Double
    let longitude: Double
}

struct CarRentalProvider: Codable, Hashable {
    let companyCode: String
    let companyName: String
}
