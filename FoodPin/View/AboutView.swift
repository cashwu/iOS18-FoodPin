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
                    Link(destination: URL(string: WebLink.rateUs.rawValue)!, label: { Label("Rate us on App Store", image: "store")
                            .foregroundStyle(.primary)
                    })
                    
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

enum WebLink : String {
    
    case rateUs = "https:/www.apple.com/ios/app-store"
    case feedback = "https:/blog.cashwu.com"
    case twitter = "https://x.com/CashWuGeek"
    case facebook = "https://www.facebook.com/cashwugeek"
    case instagrem = "https://www.instagram.com/cashwugeek"

}


#Preview {
    AboutView()
}
