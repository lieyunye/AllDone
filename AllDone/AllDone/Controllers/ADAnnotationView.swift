//
//  ADAnnotationView.swift
//  AllDone
//
//  Created by lieyunye on 4/5/17.
//  Copyright © 2017 lieyunye. All rights reserved.
//

import UIKit
import MapKit

class ADAnnotationView: NSObject,MKAnnotation {
    var coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    var title:String?
    var subtitle: String?
    
}
