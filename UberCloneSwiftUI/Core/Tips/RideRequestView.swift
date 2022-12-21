//
//  RideRequestView.swift
//  UberCloneSwiftUI
//
//  Created by Appnap WS13 on 12/21/22.
//

import SwiftUI

struct RideRequestView: View {
    var body: some View {
        VStack{
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
            
            //tips view
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 8, height: 8)
                    
                }
                VStack(alignment: .leading, spacing: 24){
                    HStack{
                        Text("Current Location")
                            .font(.system(size: 16,weight: .semibold))
                            .foregroundColor(Color(.gray))
                        Spacer()
                        Text("1:04PM")
                            .font(.system(size: 14,weight: .semibold))
                            .foregroundColor(Color(.gray))
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Text("Dhaka")
                            .font(.system(size: 16,weight: .semibold))
                        Spacer()
                        Text("1:44PM")
                            .font(.system(size: 14,weight: .semibold))
                            .foregroundColor(Color(.gray))
                    }
                    .padding(.bottom, 10)
                }
                .padding(.leading, 8)
            }
            .padding()
            Divider()
            
            //ride type selection view
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal){
                HStack(spacing: 12){
                    ForEach(0..<3, id: \.self) {index in
                        VStack(alignment: .leading){
                            Image("uber-x")
                                .resizable()
                                .scaledToFit()
                            
                            Text("Uber X")
                                .font(.system(size: 14,weight: .semibold))
                            
                            Text("$22.3")
                                .font(.system(size: 14,weight: .semibold))
                        }
                        .padding(8)
                        
                    }
                    .frame(width: 112, height: 140)
                    .background(
                        Color(.systemGroupedBackground)
                            .cornerRadius(10)
                    )
                }
            }
            .padding(.horizontal)
            Divider()
                .padding(.vertical, 8)
            // payment view
            HStack{
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("*****4325")
                    .fontWeight(.bold)
                
                Spacer()
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
                
            }
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            //request ride button
            Button {
                
            } label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32 ,height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            
            
        }.background(.white)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}