//
//  FoodPinApp.swift
//  FoodPin
//
//  Created by Cash on 2025-12-31.
//

import SwiftUI
import SwiftData

@main
struct FoodPinApp: App {
    
    init() {
        
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle") ?? UIColor.gray, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle") ?? UIColor.gray, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]

        navBarAppearance.backgroundColor = .clear
        navBarAppearance.backgroundEffect = .none
        navBarAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance

    }
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Restaurant.self)
    }
}
