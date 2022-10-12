

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    let locManager = CLLocationManager()
    var didUpdateLocations: (([CLLocation]) -> Void)!
    var failed: (() -> Void)!
    
    override init() {
        super.init()
        locManager.delegate = self
        requestPermission()
    }
    
    func listenForLocations(didUpdateLocations: @escaping ([CLLocation]) -> Void, failed: @escaping () -> Void)
    {
        locManager.startUpdatingLocation()
        self.didUpdateLocations = didUpdateLocations
        self.failed = failed
    }
    
    func requestPermission()
    {
        locManager.requestWhenInUseAuthorization()
    }
    
    private func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            // If status has not yet been determied, ask for authorization
            locManager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            // If authorized when in use
            locManager.startUpdatingLocation()
            break
        case .authorizedAlways:
            // If always authorized
            locManager.startUpdatingLocation()
            break
        case .restricted:
            failed()
            // If restricted by e.g. parental controls. User can't enable Location Services
            break
        case .denied:
            failed()
            // If user denied your app access to Location Services, but can grant access from Settings.app
            break
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        if(!canAskPermission())
        {
            failed()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        didUpdateLocations(locations)
    }
    
    func stopListening()
    {
        locManager.stopUpdatingLocation()
    }
    
    func isLocationServiceEnabled() -> Bool {
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
             case .notDetermined:
             return true
             case .restricted, .denied:
             return false
             case .authorizedAlways, .authorizedWhenInUse:
                return true
                default:
                print("Something wrong with Location services")
                return false
            }
        }
        else {
                print("Location services are not enabled")
                return false
         }
    }
    
    func canAskPermission() -> Bool
    {
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
             case .notDetermined:
                return true
             case .restricted, .denied:
                return false
             case .authorizedAlways, .authorizedWhenInUse:
                return false
                default:
                print("Something wrong with Location services")
                return false
            }
        }
        else {
                print("Location services are not enabled")
                return false
         }
    }
}
