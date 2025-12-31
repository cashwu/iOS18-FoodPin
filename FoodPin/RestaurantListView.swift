//
//  ContentView.swift
//  FoodPin
//
//  Created by Cash on 2025-12-31.
//

import SwiftUI

struct RestaurantListView: View {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)
    
    var body: some View {
        List {
            ForEach(restaurantNames.indices, id:\.self) { index in
                
                
                BasicTextImageRow(
                    imageName: restaurantImages[index],
                    name: restaurantNames[index],
                    type: "type",
                    location: "location",
                    isFavorite: $restaurantIsFavorites[index],
                )
                
//                FullImageRow(imageName: restaurantImages[index],
//                                  name: restaurantNames[index],
//                                  type: "type",
//                                  location: "location")
            }
            
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct BasicTextImageRow : View {
    
    @State private var showOptions = false
    @State private var showError = false
    
    var imageName: String
    var name:String
    var type:String
    var location:String
    
    @Binding var isFavorite: Bool

    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            Image(imageName)
                .resizable()
                .frame(width: 120, height: 118)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading) {
                
                Text(name)
                    .font(.system(.title2, design: .rounded))
                
                Text(type)
                    .font(.system(.body, design: .rounded))
                
                Text(location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.gray)
                
            }
            
            if isFavorite {
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundStyle(.yellow)
            }
            
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .confirmationDialog("What do you want to do ?",
                            isPresented: $showOptions,
                            titleVisibility: .visible) {
            
            Button ("Reserve a table") {
                self.showError.toggle()
            }
            
            Button ("Mark as favorite") {
                isFavorite.toggle()
            }
        }
        .alert("Not yet available",
               isPresented: $showError) {
            
            Button("OK") {
                
            }
            
        } message: {
            Text("Sorry, this feature is not availabe yet, Please retry latter.")
        }
    }

}

struct FullImageRow : View {
    
    var imageName: String
    var name:String
    var type:String
    var location:String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading) {
                
                Text(name)
                    .font(.system(.title2, design: .rounded))
                
                Text(type)
                    .font(.system(.body, design: .rounded))
                
                Text(location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.gray)
                
            }
            .padding(.horizontal)
            .padding(.bottom)
            
        }
    }

}


#Preview {
    RestaurantListView()
}
