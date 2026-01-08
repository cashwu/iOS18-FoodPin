//
//  ReviewView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-08.
//

import SwiftUI

struct ReviewView: View {
    
    @Binding var isDisplayed: Bool
    var restaurant: Restaurant
    
    var body: some View {
        
        ZStack {
            
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .ignoresSafeArea()
            
            Color.black
                .opacity(0.6)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                
                VStack {
                    Button(action: {
                        withAnimation(.easeOut(duration: 0.3)) {
                            self.isDisplayed = false
                        }
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer()
                }
                
            }
            
            VStack(alignment: .leading) {
                
                ForEach(Restaurant.Rating.allCases, id: \.self) { rating in
                    
                    HStack {
                        Image(rating.image)
                        
                        Text(rating.rawValue.capitalized)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                }
                
                
                
            }
        }
        
        
    }
}

#Preview {
    ReviewView(isDisplayed: .constant(true), restaurant: Restaurant(
            name: "Cafe Deadend",
            type: "Cafe",
            location: "Hong Kong",
            phone: "123-456",
            description: "desc",
            image: "cafedeadend",
            isFavorite: true
        ))
}
