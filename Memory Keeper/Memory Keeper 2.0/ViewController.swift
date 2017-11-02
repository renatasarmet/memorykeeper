//
//  ViewController.swift
//  Memory Keeper 2.0
//
//  Created by Student on 8/12/16.
//  Copyright © 2016 Grupo1. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate{

    // array de "Memorias" que utilizaremos nas operações
    var listaMemoria: [Memoria] = []
    var locationManager = CLLocationManager()
    var latitude: Double?
    var longitude: Double?
    

    @IBAction func LimparMemoria(sender: AnyObject) {
        
        self.descricaoTextField.text = ""
        self.imageView.image = nil
    }
    @IBOutlet var descricaoTextField: UITextField!
    @IBOutlet var imageView: UIImageView!
    @IBAction func loadPhoto(sender: AnyObject) {
        let pickerC = UIImagePickerController()
        pickerC.delegate = self
        self.presentViewController(pickerC, animated: true, completion: nil)
        
    }
    
    @IBAction func openCameraButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func showAlert(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "De um titulo a sua memoria!", message: "", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Titulo"
            textField.secureTextEntry = false
            
        }
        
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // criação e inicialização do objeto, para que ele possa receber valores
            let memoria: Memoria = Memoria()
            memoria.descricao = self.descricaoTextField.text
            
            if let alertTextField = alertController.textFields?.first where alertTextField.text != nil{
                memoria.titulo = alertTextField.text
            }
            
            let currentTime = self.getTime()
            var horaCompleta = ""
            if currentTime.min < 10{
                horaCompleta = "\(currentTime.hour):0\(currentTime.min)"
            }
            else{
                horaCompleta = "\(currentTime.hour):\(currentTime.min)"
            }
            print("Hora completa: \(horaCompleta)")
            
            memoria.hora = horaCompleta
            
            
            memoria.latitude = self.latitude!
            memoria.longitude = self.longitude!
            
            print("LOCALIZACAO DA MEMORIA: long: \(memoria.longitude) e lat: \(memoria.latitude)")
            
            let dataCompleta = "\(currentTime.day)/\(currentTime.month)/\(currentTime.year)"
            print("Data completa: \(dataCompleta)")
            memoria.data = dataCompleta

            // chamada do método de inserir, que está no "M" (model) do MVC
            MemoriaDAO.inserir(memoria)
            
            self.descricaoTextField.text = ""
            self.imageView.image = nil

        }
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true) {
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFit
            imageView.image = pickedImage
            
            
            UIImageWriteToSavedPhotosAlbum(pickedImage, nil, nil, nil)
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    func getTime() -> (hour : Int, min : Int, day : Int, month : Int, year : Int) {
        let currentDateTime = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute, .Day , .Month , .Year], fromDate: currentDateTime)
        let hour = components.hour
        let min = components.minute
        let day = components.day
        let month = components.month
        let year = components.year
        
        return (hour, min, day, month, year)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        self.latitude = locValue.latitude
        self.longitude = locValue.longitude
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}