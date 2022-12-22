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
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
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
            self.selectedLocationCoordinate = coordinate
        }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping(MKLocalSearch.CompletionHandler)){
        let searchResult = MKLocalSearch.Request()
        searchResult.naturalLanguageQuery = localSearch.subtitle.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchResult)
        search.start(completionHandler: completion)
    }
    
    func computeRidePrice(for rideType: RideType) -> Double{
        guard let coordinate = selectedLocationCoordinate else {return 0.0}
        guard let userLocaition = self.userLocation else {return 0.0}
        let userLocation = CLLocation(latitude: userLocaition.latitude, longitude: userLocaition.longitude)
        let destination = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let tripDestinationInMeter = userLocation.distance(from: destination)
        return rideType.calculatePrice(for: tripDestinationInMeter)
    }
}
//MARK: - LocationSearchViewModel
extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
