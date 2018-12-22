//
//  RentalSearchViewController.swift
//  CarRental
//
//  Created by Yariv Nissim on 12/20/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import UIKit
import MapKit

final class RentalSearchViewController: UIViewController, RentalSearchDataContainer {
    @IBOutlet private var startDatePicker: UIDatePicker!
    @IBOutlet private var endDatePicker: UIDatePicker!
    @IBOutlet private var mapView: MKMapView!
    @IBOutlet private var pickupLocationView: UIView!
    @IBOutlet private var pickupLocationLabel: UILabel!

    private let geocoder = CLGeocoder()

    var rentalSearchData: RentalSearchData {
        return RentalSearchData(dates: DateInterval(start: startDatePicker.date, end: endDatePicker.date),
                                location: pickupLocation.coordinate)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        startDatePicker.minimumDate = Date()
        endDatePicker.minimumDate = Date().nextDay
        updateCurrentLocation()
    }

    @IBAction func startDateChanged(_ sender: UIDatePicker) {
        // The dropoff date has to be after the pickup date
        endDatePicker.minimumDate = sender.date.nextDay
    }
}

extension RentalSearchViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        updateCurrentLocation()
    }

    /// Use reverse geocoding to get the selected location on the map
    private func updateCurrentLocation() {
        geocoder.cancelGeocode()
        geocoder.reverseGeocodeLocation(pickupLocation) { placemarks, _ in
            let placemark = placemarks?.first
            self.pickupLocationLabel.text = placemark?.name
        }
    }

    // Convert the point on the view to a coordinate on the map
    private var pickupLocation: CLLocation {
        let point = CGPoint(x: pickupLocationView.frame.midX,
                            y: pickupLocationView.frame.maxY)
        let coordinate = mapView.convert(point, toCoordinateFrom: view)
        return CLLocation(latitude: coordinate.latitude,
                          longitude: coordinate.longitude)
    }
}

private extension Date {
    var nextDay: Date? {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)
    }
}
