//
//  LocationManager.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 17.02.23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {

    lazy var locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()

    var location: CLLocation?
    var placemark: CLPlacemark?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func geoCode(with location: CLLocation) {
        geoCoder.reverseGeocodeLocation(location) { (placemark, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                self.placemark = placemark?.first
            }
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        DispatchQueue.main.async {
            self.location = location
            self.geoCode(with: location)
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // TODO
    }
}
