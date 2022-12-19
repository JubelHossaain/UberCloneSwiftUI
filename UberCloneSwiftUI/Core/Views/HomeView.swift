//
//  HomeView.swift
//  UberCloneSwiftUI
//
//  Created by Appnap WS13 on 12/19/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
