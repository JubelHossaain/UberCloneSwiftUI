//
//  RideType.swift
//  UberCloneSwiftUI
//
//  Created by Appnap WS13 on 12/22/22.
//

import Foundation
enum RideType: Int, CaseIterable, Identifiable {
case uberX, black, ubserXL
    var id: Int {return rawValue}
    
    var description: String {
        switch self {
        
        case .uberX:
            return "UberX"
        case .black:
            return "Uber Black"
        case .ubserXL:
            return "Uber XL"
        }
    }
    
    var imageName: String {
        switch self {
        case .uberX:
            return "uber-x"
        case .black:
            return "uber-black"
        case .ubserXL:
            return "uber-x"
        }
    }
    
    var baseFare: Double {
        switch self {
            
        case .uberX:
            return 5
        case .black:
            return 20
        case .ubserXL:
            return 10
        }
    }
    
    func calculatePrice(for distanceMeter: Double) -> Double {
        let distanceInMeter = distanceMeter / 1600
        
        switch self {
        case .uberX:
            return distanceInMeter * 1.5 + baseFare
        case .black:
            return distanceInMeter * 2.0 + baseFare
        case .ubserXL:
            return distanceInMeter * 1.75 + baseFare
        }
    }
}

