//
//  CarDetailsViewController.swift
//  CarRental
//
//  Created by Yariv Nissim on 12/21/18.
//  Copyright © 2018 Yariv. All rights reserved.
//

import UIKit
import MapKit

class CarDetailsViewController: UIViewController, CarRentalResultViewModelContainer {
    var carRentalResult: CarRentalResultViewModel!

    @IBOutlet var navigateButton: UIButton!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet private var companyLabel: UILabel!
    @IBOutlet private var distanceLabel: UILabel!
    @IBOutlet private var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(carRentalResult != nil, "carRentalResult must be injected before viewDidLoad.")
        updateUI()
    }

    private func updateUI() {
        title = carRentalResult.car
        priceLabel.text = carRentalResult.formattedPrice
        companyLabel.text = carRentalResult.company
        distanceLabel.text = carRentalResult.formattedDistance

        mapView.addAnnotation(carRentalResult.annotation)
        mapView.showAnnotations(mapView.annotations, animated: false)

        loadImage()
    }

    private func loadImage() {
        imageView.isHidden = true
        guard let url = carRentalResult.imageURL else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                let image = UIImage(data: data) else {
                    return
            }
            DispatchQueue.main.async {
                self.imageView.image = image
                self.imageView.isHidden = false
            }
        }
    }
}

// MARK:- MapKit
extension CarDetailsViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = mapView.dequeueReusableAnnotationView(withIdentifier: "pin") ?? MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.annotation = annotation
        pin.rightCalloutAccessoryView = navigateButton
        pin.canShowCallout = true
        return pin
    }

    @IBAction func navigate() {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: carRentalResult.location))
        mapItem.openInMaps()
    }

}

extension CarRentalResultViewModel {
    var annotation: MKAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = airport ?? address
        return annotation
    }
}
