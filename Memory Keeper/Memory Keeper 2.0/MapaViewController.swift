//
//  MapaViewController.swift
//  Memory Keeper 2.0
//
//  Created by Student on 8/16/16.
//  Copyright © 2016 Grupo1. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapaViewController: UIViewController, CLLocationManagerDelegate {
        
               
    @IBOutlet weak var mapView: MKMapView!
        var locationManager:CLLocationManager!
        var first:Bool  = true
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            
            //Anotacao no mapa
            
            //Começar no ponto em questao
        
            
            _ = MKCoordinateSpanMake(0.2, 0.2)
            
            
            //Termina começar no ponto em questão
            
            //Pontos pré-estabelecidos
            
            let location = CLLocationCoordinate2DMake(-21.979991, -47.879061) // UFSCAR
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "Meu melhor projeto"
            annotation.subtitle = "03/08/2016"
            
            
            let location2 = CLLocationCoordinate2DMake(36.4809948, -95.0153292)// Disney
            let annotation2 = MKPointAnnotation()
            annotation2.coordinate = location2
            annotation2.title = "Viagem dos meus sonhos"
            annotation2.subtitle = "04/06/2016"
            
            let location3 = CLLocationCoordinate2DMake(-23.5848, -46.6559)//Ibirapuera
            let annotation3 = MKPointAnnotation()
            annotation3.coordinate = location3
            annotation3.title = "Tarde relaxante"
            annotation3.subtitle = "02/04/2015"
            
            let location4 = CLLocationCoordinate2DMake(-22.9519,-43.2105)//Cristo Redentor
            let annotation4 = MKPointAnnotation()
            annotation4.coordinate = location4
            annotation4.title = "Memorável"
            annotation4.subtitle = "05/02/2014"
            
            let location5 = CLLocationCoordinate2DMake(-23.5483405943, -46.6428655568)//Edificio Italia
            let annotation5 = MKPointAnnotation()
            annotation5.coordinate = location5
            annotation5.title = "Visão Maravilhosa"
            annotation5.subtitle = "07/01/2016"
            
            
            mapView.addAnnotation(annotation)
            mapView.addAnnotation(annotation2)
            mapView.addAnnotation(annotation3)
            mapView.addAnnotation(annotation4)
            mapView.addAnnotation(annotation5)
            
            
            
            //Fim anotação

            
            
            let viewRegion = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(), 1500, 1500)
            self.mapView.setRegion(viewRegion, animated: false)
            
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
            print(error)
        }
        
        func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let locationArray = locations as NSArray
            let locationObj = locationArray.lastObject as! CLLocation
            let coord = locationObj.coordinate
            

            print(coord.latitude)
            print(coord.longitude)
            
            if (first) {
                mapView.setCenterCoordinate(coord, animated: false)
                first = false
            } else {
                mapView.setCenterCoordinate(coord, animated: true)
            }
        }
    
    
    
    }
    


