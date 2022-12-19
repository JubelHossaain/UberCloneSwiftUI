//
//  LocatoinSearchView.swift
//  UberCloneSwiftUI
//
//  Created by Appnap WS13 on 12/19/22.
//

import SwiftUI

struct LocatoinSearchView: View {
    @State private var startLocationText = ""
    @Binding var showLocationSearchView: Bool
    @EnvironmentObject var viewModel: LocationSearchViewModel
    var body: some View {
        VStack{
            //header view
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 6, height: 6)
                    
                }
                
                VStack{
                   TextField("Current Location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                         .frame(height: 32)
                         .background(Color(.systemGray4))
                         .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            Divider()
                .padding(.vertical)
           
            // list view
            
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(viewModel.results, id: \.self) {result in
                        LocationSearchResultCell(title: result.title, subTitle: result.subtitle)
                            .onTapGesture {
                                viewModel.selectedLocaton(result)
                                showLocationSearchView.toggle()
                            }
                    }
                }
            }
        }
        .background(.white)
    }
}

struct LocatoinSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocatoinSearchView(showLocationSearchView: .constant(false))
    }
}
