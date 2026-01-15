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
    
    @Environment(\.scenePhase) var scenePhase
    
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
        .onChange(of: scenePhase) { oldValue, newValue in
            
            switch newValue {
                
                case .active:
                    print("Active")
                case .inactive:
                    print("Inactive")
                case .background:
                    createQuickActions()
                default:
                    print("default scene phase")
            }
        }
    }
    
    func createQuickActions() {
        
        if let bundleIdentifier = Bundle.main.bundleIdentifier {
            
            let shortcutItem1 = UIApplicationShortcutItem(type: "\(bundleIdentifier).OpenFavorites",
                                      localizedTitle: "show favorites",
                                      localizedSubtitle: nil,
                                      icon: UIApplicationShortcutIcon(systemImageName: "tag"),
                                      userInfo: nil)
            
            let shortcutItem2 = UIApplicationShortcutItem(type: "\(bundleIdentifier).OpenDiscover",
                                      localizedTitle: "discover restaurants",
                                      localizedSubtitle: nil,
                                      icon: UIApplicationShortcutIcon(systemImageName: "eyes"),
                                      userInfo: nil)

            let shortcutItem3 = UIApplicationShortcutItem(type: "\(bundleIdentifier).NewRestaurant",
                                      localizedTitle: "new favorites",
                                      localizedSubtitle: nil,
                                      icon: UIApplicationShortcutIcon(type: .add),
                                      userInfo: nil)
            
            UIApplication.shared.shortcutItems = [shortcutItem1, shortcutItem2, shortcutItem3]
        }
        
    }
}
