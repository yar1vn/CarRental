//
//  CarRentalService.swift
//  CarRental
//
//  Created by Yariv Nissim on 12/10/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import Foundation
import CoreLocation

enum CarRentalError: Error, CustomStringConvertible {
    case invalidURL
    case badResponse(Error)
    case unknown(Error)

    var description: String {
        switch self {
        case .invalidURL: return "Could not parse CarRental URL."
        case .badResponse: return "Could not decode data from CarRental service."
        case .unknown: return "Unknown error occurred with CarRental service."
        }
    }
}

final class CarRentalService {
    private let apiKey: String
    private let baseURL = "api.sandbox.amadeus.com"

    typealias CompletionType = (Result<CarRentalResponse, CarRentalError>) -> Void

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    func generateURL(location: CLLocationCoordinate2D, dates: DateInterval) -> URL? {
        var components = URLComponents()
        components.host = baseURL
        components.scheme = "https"
        components.path += "/v1.2/cars/search-circle"
        components.queryItems = [
            URLQueryItem(name: "apikey", value: apiKey),
            URLQueryItem(name: "latitude", value: "\(location.latitude)"),
            URLQueryItem(name: "longitude", value: "\(location.longitude)"),
            URLQueryItem(name: "radius", value: "42"),
            URLQueryItem(name: "pick_up", value: dateFormatter.string(from: dates.start)),
            URLQueryItem(name: "drop_off", value: dateFormatter.string(from: dates.end))
        ]

        return components.url
    }

    func getRentals(location: CLLocationCoordinate2D, dates: DateInterval, completion: @escaping CompletionType) {
        guard let url = generateURL(location: location, dates: dates) else {
            completion(.failure(.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                // error is guaranteed in documentation to be non-nil when data is empty
                completion(.failure(.unknown(error!)))
                return
            }

            do {
                let rentals = try CarRentalResponse(data: data)
                completion(.success(rentals))
            } catch {
                completion(.failure(.badResponse(error)))
            }
        }.resume()
    }
}

extension CarRentalResponse {
    /// Decode from data using JSONDecoder
    init(data: Data) throws {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let rentals = try decoder.decode(CarRentalResponse.self, from: data)
        self = rentals
    }
}
