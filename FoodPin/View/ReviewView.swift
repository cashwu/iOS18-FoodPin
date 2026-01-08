//
//  ReviewView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-08.
//

import SwiftUI

struct ReviewView: View {
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                
                VStack {
                    Button(action: {}) {
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
    ReviewView()
}
