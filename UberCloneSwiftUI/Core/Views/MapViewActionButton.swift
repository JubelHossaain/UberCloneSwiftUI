//
//  MapViewActionButton.swift
//  UberCloneSwiftUI
//
//  Created by Appnap WS13 on 12/19/22.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapState
    var body: some View {
        Button {
            withAnimation(.spring()) {
                mapState = .noInput
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: Color.black, radius: 6)
        }
        .frame(maxWidth: .infinity,alignment: .leading)

    }
    
    func actoinForState(_ state: MapState) {
        switch state {
            
        case .noInput:
            print("")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected:
            mapState = .noInput
        }
    }
    
    func imageNameForState(_ state: MapState) ->String{
        switch state {
            
        case .noInput:
           return "line.3.horizontal"
        case .searchingForLocation, .locationSelected:
           return "arrow.left"
        }
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
}
