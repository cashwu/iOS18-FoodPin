//
//  AboutView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-12.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        
        
        NavigationStack {
            
            List{
                
                Image("about")
                    .resizable()
                    .scaledToFit()
                
                Section {
                    
                    Label("Rate us on App Store", image: "store")
                    
                    Label("Tell us your feedback", image: "chat")

                }
                
                Section {
                    
                    Label("Twitter", image: "facebook")
                    
                    Label("Facebook", image: "facebook")

                    Label("Instagram", image: "instagram")

                }
            }
            .listStyle(.grouped)
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.automatic)
            
            
        }
        
        
    }
}

#Preview {
    AboutView()
}
