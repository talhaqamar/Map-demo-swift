//
//  ViewController.swift
//  Maps Demo
//
//  Created by Talha Qamar on 1/9/15.
//  Copyright (c) 2015 Talha Qamar. All rights reserved.
//

import UIKit
import MapKit
import  CoreLocation


class ViewController: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate {
    
    
    
    
    @IBOutlet var mymap: MKMapView!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
       // manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        
        //Empire state building coordinates
        var latitude:CLLocationDegrees = 40.748643
        var longitude:CLLocationDegrees = -73.985637
        var latdelta : CLLocationDegrees = 0.01
        var londelta : CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latdelta,londelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        mymap.setRegion(region, animated: true)
        
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Statue of Liberty"
        annotation.subtitle = "One day i will go here.."
        
        mymap.addAnnotation(annotation)
        
     var uilpgr =  UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 2.0
        mymap.addGestureRecognizer(uilpgr)
        
    }
    func action(gestureRecognizer:UILongPressGestureRecognizer)
    {
         var touchpoint = gestureRecognizer.locationInView(self.mymap)
        var newCoordinate:CLLocationCoordinate2D = mymap.convertPoint(touchpoint, toCoordinateFromView: self.mymap)
        
        var newannotation = MKPointAnnotation()
        newannotation.coordinate = newCoordinate
        newannotation.title = "You touch here"
        newannotation.subtitle = "One day i will go here.."
        mymap.addAnnotation(newannotation)

    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        var userlocation:CLLocation = locations[0] as CLLocation
        var lat:CLLocationDegrees = userlocation.coordinate.latitude
        var lon:CLLocationDegrees = userlocation.coordinate.longitude
        var ladelta : CLLocationDegrees = 0.01
        var lndelta : CLLocationDegrees = 0.01
        
        var s:MKCoordinateSpan = MKCoordinateSpanMake(ladelta,lndelta)
        var l:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lon)
        var reg:MKCoordinateRegion = MKCoordinateRegionMake(l, s)
        mymap.setRegion(reg, animated: true)
        var annotation = MKPointAnnotation()
        annotation.coordinate = l
        annotation.title = "Your location"
        annotation.subtitle = "Its your location dude ..."
        
        mymap.addAnnotation(annotation)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

