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

struct CarRentalResponse: Decodable, Hashable {
    let results: [CarRentalResult]
}

struct CarRentalResult: Decodable, Hashable {
    let provider: CarRentalProvider
    let location: CarRentalLocation
    let airport: String?
    let address: CarRentalAddress
    let cars: [CarRentalCar]

    enum CodingKeys: String, CodingKey {
        case provider = "provider"
        case location = "location"
        case airport = "airport"
        case address = "address"
        case cars = "cars"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        provider = try container.decode(CarRentalProvider.self, forKey: .provider)
        location = try container.decode(CarRentalLocation.self, forKey: .location)
        airport = try container.decodeIfPresent(String.self, forKey: .airport)
        address = try container.decode(CarRentalAddress.self, forKey: .address)
        cars = try container.decodeIfPresent([CarRentalCar].self, forKey: .cars) ?? []
    }
}

struct CarRentalAddress: Decodable, Hashable {
    let line1: String
    let city: String
    let region: String?
    let postalCode: String?
    let country: String
}

struct CarRentalCar: Decodable, Hashable {
    let vehicleInfo: CarRentalVehicleInfo
    let estimatedTotal: CarRentalPrice?
    let image: CarRentalImage?
}

struct CarRentalImage: Decodable, Hashable {
    let width: Double
    let height: Double
    let url: URL
}

struct CarRentalPrice: Decodable, Hashable {
    let amount: String
    let currency: String
}

struct CarRentalVehicleInfo: Decodable, Hashable {
    let acrissCode: String
    let category: String
    let type: String?
    let transmission: String?
    let airConditioning: Bool?
    let fuel: String?
}

struct CarRentalLocation: Decodable, Hashable {
    let latitude: Double
    let longitude: Double
}

struct CarRentalProvider: Decodable, Hashable {
    let companyCode: String
    let companyName: String
}

struct CarRentalErrorResponse: Decodable, Hashable {
    let status: Int
    let message: String
}
