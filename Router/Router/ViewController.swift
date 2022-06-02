//
//  ViewController.swift
//  Router
//
//  Created by SERGEI on 26.05.2022.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    @objc let addAddressButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Address", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    let routeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Route", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true 
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    var annotationsArray =  [MKPointAnnotation]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        setConstrains()
        
        addAddressButton.addTarget(self, action: #selector(addAddressButtonTapped), for: .touchUpInside)
        routeButton.addTarget(self, action: #selector(routeButtonTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
    }
    //MARK: Кнопка для добавления адресса
    @objc func addAddressButtonTapped(){
        alertController(title: "Add", placeHolde: "Enter ur address") { [self] (text) in
            print(text)
            setupPlacemark(addressPlace: text)
        }
    }
    //MARK: Кнопка для построения маршрута
    @objc func routeButtonTapped(){
        for index in 0...annotationsArray.count - 2{
            createDirectionRequest(startCoordinate: annotationsArray[index].coordinate, destinationCoordinate: annotationsArray[index + 1].coordinate)
        }
        
        mapView.showAnnotations(annotationsArray, animated: true)
    }
    //MARK: Кнопка для стирания
    @objc func resetButtonTapped(){
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)
        annotationsArray = [MKPointAnnotation]()
        routeButton.isHidden = true
        resetButton.isHidden = true
    }
    //MARK: Создание аннотаций 
    private func setupPlacemark(addressPlace: String){
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressPlace) { [self] placemarks, error in
            if let error = error {
                print(error)
                alertError(title: "Error", message: "Server not found")
                return
            }
            guard let placemarks = placemarks else {return}
            let placemark = placemarks.first
            
            let annotation = MKPointAnnotation()
            annotation.title = "\(addressPlace)"
            
            guard let placeMarkLocation = placemark?.location else {return}
            annotation.coordinate = placeMarkLocation.coordinate
            
            annotationsArray.append(annotation)
            
            if annotationsArray.count > 2{
                routeButton.isHidden = false
                resetButton.isHidden = false
            }
            
            mapView.showAnnotations(annotationsArray, animated: true)
        }
    }
    
    private func createDirectionRequest(startCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D){
        
        let startLocation = MKPlacemark(coordinate: startCoordinate)
        let destinationLocation = MKPlacemark(coordinate: destinationCoordinate)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startLocation)
        request.destination = MKMapItem(placemark: destinationLocation)
        request.transportType = .walking
        request.requestsAlternateRoutes = true
        
        let direction = MKDirections(request: request)
        direction.calculate { (response, error) in
            if let error = error{
                print(error)
                return
            }
            
            guard let response = response else{
                self.alertError(title: "Error", message: "Cant create route")
                return
            }
            
            var minRoute = response.routes[0]
            for route in response.routes{
                minRoute = (route.distance < minRoute.distance) ? route : minRoute
            }
            self.mapView.addOverlay(minRoute.polyline)
        }
    }
}
//MARK: Отрисовка карты
extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = .red
        return render
    }
}
//MARK: Расширение для расположения кнопок
extension ViewController{
    func setConstrains(){
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant:0),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:0)
        ])
        
        view.addSubview(addAddressButton)
        NSLayoutConstraint.activate([
            addAddressButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            addAddressButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addAddressButton.heightAnchor.constraint(equalToConstant: 70),
            addAddressButton.widthAnchor.constraint(equalToConstant: 120)
            ])
        
        view.addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resetButton.heightAnchor.constraint(equalToConstant: 70),
            resetButton.widthAnchor.constraint(equalToConstant: 120)
            ])
        
        view.addSubview(routeButton)
        NSLayoutConstraint.activate([
            routeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            routeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            routeButton.heightAnchor.constraint(equalToConstant: 70),
            routeButton.widthAnchor.constraint(equalToConstant: 120)
            ])
    }
}
