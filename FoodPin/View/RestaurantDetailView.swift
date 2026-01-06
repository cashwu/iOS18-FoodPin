//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-06.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    var restaurant: Restaurant
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, idealWidth: .infinity)
                .ignoresSafeArea()
            
            Color.black
                .frame(height: 100)
                .opacity(0.8)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                .overlay {
                    VStack(spacing: 5) {
                        Text(restaurant.name)
                        Text(restaurant.type)
                        Text(restaurant.location)
                    }
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(.white)
                }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
           ToolbarItem(placement: .navigationBarTrailing) {
               
               Button(action: {
                  dismiss()
               }){
                   Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
               }
            }
        }
    }
}

#Preview {
    RestaurantDetailView(restaurant: Restaurant(
        name: "Cafe Deadend", type: "Cafe", location: "Hong Kong", image: "cafedeadend", isFavorite: true
    ))
}
