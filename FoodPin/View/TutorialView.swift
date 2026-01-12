//
//  TutorialView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-12.
//

import SwiftUI

struct TutorialView : View {
    
    let pageHeadings = ["create your own food guide",
                        "show you the location",
                        "discover great restaurants"]
    
    let pageSubHeadings = [
        "Pin your favorite restaurants and crate your own food guide",
        "Search and locate our favrite restaurant on mpas",
        "find restaurants shared by your friends and other foodies"
    ]
    
    let pageImages = [ "onboarding-1","onboarding-2" ,"onboarding-3"  ]
    
    init() {
        
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemIndigo
    }

    var body: some View {
        
        TabView {
            
            ForEach(pageHeadings.indices, id: \.self) { index in
                
                TutorialPage(image: pageImages[index],
                             heading: pageHeadings[index],
                             subHeading: pageSubHeadings[index])
                .tag(index)
                
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        
    }
}

struct TutorialPage : View {
    
    let image: String
    let heading: String
    let subHeading: String
    
    
    var body: some View {
        
        VStack(spacing: 70) {
            
            Image(image)
                .resizable()
                .scaledToFit()
                
            VStack(spacing: 10) {
                
                Text(heading)
                    .font(.headline)
                
                Text(subHeading)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                
            }
            .padding(.horizontal, 40)
            
            Spacer()
            
        }
        .padding(.top)
        
    }
}

#Preview {
   TutorialView()
}

#Preview ("TotorialPage", traits: .sizeThatFitsLayout){
    TutorialPage(image: "onboarding-1",
                 heading: "Create your own food guide",
                 subHeading: "pin your favrite restaurants and create your own food guid")
}
