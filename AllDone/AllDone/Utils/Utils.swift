//
//  Utils.swift
//  AllDone
//
//  Created by lieyunye on 3/31/17.
//  Copyright © 2017 lieyunye. All rights reserved.
//

import UIKit
import CoreLocation

class Utils: NSObject {

    class func isLocationAccessableWithCompletionHandler(completion: ((_ granted:Bool) -> Swift.Void)? = nil){
        let enabled = CLLocationManager.locationServicesEnabled()
        let status = CLLocationManager.authorizationStatus()
        if enabled && (status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse) {
            if (completion != nil) {
                completion!(true)
            }
        }else {
            if (completion != nil) {
                completion!(false)
            }
        }
    }
}
