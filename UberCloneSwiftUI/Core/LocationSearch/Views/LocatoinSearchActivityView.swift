//
//  LocatoinSearchActivityView.swift
//  UberCloneSwiftUI
//
//  Created by Appnap WS13 on 12/19/22.
//

import SwiftUI

struct LocatoinSearchActivityView: View {
    var body: some View {
        HStack{
            Rectangle()
                .fill(Color.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            Text("Where's to")
                .foregroundColor(Color(.darkGray))
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(color: Color.black, radius: 6)
        )
    }
}

struct LocatoinSearchActivityView_Previews: PreviewProvider {
    static var previews: some View {
        LocatoinSearchActivityView()
    }
}
