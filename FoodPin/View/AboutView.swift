//
//  AboutView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-12.
//

import SwiftUI

struct AboutView: View {
    
    @State private var link: WebLink?
    
    
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
                        .onTapGesture {
                            link = .feedback
                        }

                }
                
                Section {
                    
                    Label("Twitter", image: "facebook")
                        .onTapGesture {
                            link = .twitter
                        }

                    Label("Facebook", image: "facebook")
                        .onTapGesture {
                            link = .facebook
                        }

                    Label("Instagram", image: "instagram")
                        .onTapGesture {
                            link = .instagrem
                        }

                }
            }
            .listStyle(.grouped)
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.automatic)
            .sheet(item: $link) { item in
                
                if let url = URL(string: item.rawValue) {
//                    WebView(url: url)
                    SafariView(url: url)
                }
                
            }

            
        }
        
        
    }
}

enum WebLink : String, Identifiable {
    
    case rateUs = "https:/www.apple.com/ios/app-store"
    case feedback = "https:/blog.cashwu.com"
    case twitter = "https://x.com/CashWuGeek"
    case facebook = "https://www.facebook.com/cashwugeek"
    case instagrem = "https://www.instagram.com/cashwugeek"

    
    var id : UUID {
        UUID()
    }
}


#Preview {
    AboutView()
}

#Preview("about (German)") {
    AboutView()
        .environment(\.locale, .init(identifier: "de"))
}
