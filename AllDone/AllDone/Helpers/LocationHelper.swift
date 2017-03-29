//
//  LocationHelper.swift
//  AllDone
//
//  Created by lieyunye on 3/25/17.
//  Copyright © 2017 lieyunye. All rights reserved.
//

import UIKit
import CoreLocation

class LocationHelper: NSObject {
    var locationManager:CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
    }
}
