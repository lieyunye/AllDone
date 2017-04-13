//
//  ADHomeViewController.swift
//  AllDone
//
//  Created by lieyunye on 3/24/17.
//  Copyright © 2017 lieyunye. All rights reserved.
//

import UIKit
import MapKit

class ADHomeViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        // Do any additional setup after loading the view.
        
        LocationHelper.sharedInstance.startGetLocation()
        addAnnotation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - methods
extension ADHomeViewController
{
    func addAnnotation() {
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(40.0283981096793,116.292457942134)
        let annotation:ADAnnotationView = ADAnnotationView()
        annotation.coordinate = location
        annotation.title = ""
        self.mapView.addAnnotation(annotation)
    }
}

// MARK: - MKMapViewDelegate
extension ADHomeViewController
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "item"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        annotationView?.annotation = annotation// 重要
        annotationView?.image = UIImage(named: "Australia")// 设置打头针的图片
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        mapView.deselectAnnotation(view.annotation, animated: false)
        let controller:ADUserInfoDetailViewController = ADUserInfoDetailViewController(nibName :"ADUserInfoDetailViewController", bundle: nil)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
