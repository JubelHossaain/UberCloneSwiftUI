//
//  LocationSearchViewModel.swift
//  UberCloneSwiftUI
//
//  Created by Appnap WS13 on 12/19/22.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    @Published var results  =  [MKLocalSearchCompletion]()
    @Published var selectedUberLocation: UberLocation?
    @Published var pickUpTime: String?
    @Published var dropOffTime: String?
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = ""{
        didSet{
            searchCompleter.queryFragment = queryFragment
            print("DEBUG quary fragment is : \(queryFragment)")
        }
    }
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
     var userLocation: CLLocationCoordinate2D?
    //MARK: - Helper
    func selectedLocaton(_ localSearch: MKLocalSearchCompletion){
        locationSearch(forLocalSearchCompletion: localSearch) { response, error  in
            if let error = error {
                print("DEBUG ERROR : \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else {return}
            let coordinate = item.placemark.coordinate
            print("DEBUG MODE: coordinate: \(coordinate)")
            self.selectedUberLocation = UberLocation(title: localSearch.title, coordinate: coordinate)
        }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping(MKLocalSearch.CompletionHandler)){
        let searchResult = MKLocalSearch.Request()
        searchResult.naturalLanguageQuery = localSearch.subtitle.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchResult)
        search.start(completionHandler: completion)
    }
    
    func computeRidePrice(for rideType: RideType) -> Double{
        guard let coordinate = selectedUberLocation?.coordinate else {return 0.0}
        guard let userLocaition = self.userLocation else {return 0.0}
        let userLocation = CLLocation(latitude: userLocaition.latitude, longitude: userLocaition.longitude)
        let destination = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let tripDestinationInMeter = userLocation.distance(from: destination)
        return rideType.calculatePrice(for: tripDestinationInMeter)
    }
    
    func getDirectionRoute(from userLocatoin: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, completion: @escaping(MKRoute) -> Void ){
        let userPlacemark = MKPlacemark(coordinate: userLocatoin)
        let destPlacemark = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: destPlacemark)
        let direction = MKDirections(request: request)
        direction.calculate { response, error in
            if let error = error {
                print("DEBUG : \(error.localizedDescription)")
                return
            }
            guard let route = response?.routes.first else {return}
            self.configurePickUpandDropOffTime(with: route.expectedTravelTime)
            completion(route)
        }
    }
    
    func configurePickUpandDropOffTime(with expectedTraveltime: Double){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm: a"
        pickUpTime = formatter.string(from: Date())
        dropOffTime = formatter.string(from: Date() + expectedTraveltime)
    }
}
//MARK: - LocationSearchViewModel
extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
