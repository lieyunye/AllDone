//
//  LocationHelper.swift
//  AllDone
//
//  Created by lieyunye on 3/25/17.
//  Copyright © 2017 lieyunye. All rights reserved.
//

import UIKit
import CoreLocation

class LocationHelper: NSObject,CLLocationManagerDelegate
{
    static let sharedInstance = LocationHelper()

    var locationManager:CLLocationManager
    var geocoder:CLGeocoder
    var status:CLAuthorizationStatus
    var address:String?
    var latitude:CLLocationDegrees
    var longitude:CLLocationDegrees
    
    private override init() {
        
        locationManager = CLLocationManager()
        geocoder = CLGeocoder()
        status = CLAuthorizationStatus.notDetermined
        address = ""
        latitude = 0.0
        longitude = 0.0
        
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
    }
    
    func startGetLocation(){
        Utils.isLocationAccessableWithCompletionHandler {(granted) in
            if granted {
                self.locationManager.startUpdatingLocation()
            }else {
                self.locationManager.requestWhenInUseAuthorization()
            }
        }
    }
    
    func stopGetLocation(){
        self.locationManager .stopUpdatingLocation()
    }
}

extension LocationHelper {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if self.status != status && status == CLAuthorizationStatus.authorizedWhenInUse {
            self.startGetLocation()
        }
        switch status {
        case .authorizedWhenInUse: break
        default: break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.stopGetLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.stopGetLocation()
        let location:CLLocation = locations.last!
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
        
        print("latitude %f ,longitude %f",latitude, longitude)
        
        weak var weakSelf = self
        self.geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if (error != nil || placemarks?.count == 0) {
                print("reverse geocode fail :\(error?.localizedDescription)")
            }else {
                let placemark = (placemarks?[0])! as CLPlacemark
                weakSelf?.address = placemark.name
                print("address : \(weakSelf?.address)")
            }
            
        }
    }
}









