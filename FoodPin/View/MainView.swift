//
//  MainView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-12.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTabIndex = 0
    
    var body: some View {
        
        TabView(selection: $selectedTabIndex) {
            
            RestaurantListView()
                .tabItem{
                    Label("Favorites", systemImage: "tag.fill")
                }
                .tag(0)
            
            Text("Discover")
                .tabItem {
                    Label("Discover", systemImage: "wand.and.rays")
                }
                .tag(1)
            
            Text("About")
                .tabItem{
                    Label("About", systemImage: "square.stack")
                }
                .tag(2)
        }
        
        
    }
}

#Preview {
    MainView()
}
