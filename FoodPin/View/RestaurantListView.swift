//
//  ContentView.swift
//  FoodPin
//
//  Created by Cash on 2025-12-31.
//

import SwiftUI

struct RestaurantListView: View {
    
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)
    
    @State var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend"),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei"),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha"),
        Restaurant(name: "Cafe Loisl", type: "Austrian / Causual Dine", location: "Hong Kong", image: "cafeloisl"),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster"),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkee"),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier"),
        Restaurant(name: "Bourke Street Bakery", type: "Chocolate", location: "Hong Kong", image: "bourkestreetbakery"),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Hong Kong", image: "haigh"),
        Restaurant(name: "Palomino Espresso", type: "American", location: "Sydney", image: "palomino"),
        Restaurant(name: "Upstate", type: "Seafood", location: "Sydney", image: "upstate"),
        Restaurant(name: "Traif", type: "American", location: "Sydney", image: "traif"),
        Restaurant(name: "Graham Avenue Meats", type: "American", location: "New York", image: "graham"),
        Restaurant(name: "Waffle & Wolf", type: "Breakfast & Brunch", location: "New York", image: "waffleandwolf"),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves"),
        Restaurant(name: "Cafe Lore", type: "Coffee & Tea", location: "New York", image: "cafelore"),
        Restaurant(name: "Confessional", type: "Latin American", location: "New York", image: "confessional"),
        Restaurant(name: "Barrafina", type: "Spanish", location: "New York", image: "barrafina"),
        Restaurant(name: "Donostia", type: "Spanish", location: "New York", image: "donostia"),
        Restaurant(name: "Royal Oak", type: "Spanish", location: "London", image: "royaloak"),
        Restaurant(name: "CASK Pub and Kitchen", type: "British", location: "London", image: "cask")
    ]
    
    
    @State private var showNewRestaurant = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants.indices, id:\.self) { index in
                    
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: RestaurantDetailView(restaurant: restaurants[index])) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        BasicTextImageRow(restaurant: $restaurants[index])
                    }
                    
                    
                    //                    BasicTextImageRow(restaurant: $restaurants[index])
                    //                        .swipeActions(edge:.leading,allowsFullSwipe: false) {
                    //                            Button {
                    //
                    //                            } label: {
                    //                                Image(systemName: "heart")
                    //                            }
                    //                            .tint(.green)
                    //
                    //                            Button {
                    //
                    //                            } label: {
                    //                                Image(systemName: "square.and.arrow.up")
                    //                            }
                    //                            .tint(.orange)
                    //                        }
                }
                .onDelete(perform: { indexSet in
                    restaurants.remove(atOffsets:indexSet)
                })
                
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            
            .navigationTitle("FoodPin")
            .navigationBarTitleDisplayMode(.automatic)
            
            .toolbar {
                
                Button(action: {
                    
                    self.showNewRestaurant = true
                    
                }) {
                    Image(systemName: "plus")
                }
            }
            .tint(.primary)
        }
        .sheet(isPresented: $showNewRestaurant) {
           NewRestaurantView()
        }
    }
}

struct BasicTextImageRow : View {
    
    // MARK: - Binding
    
    @Binding var restaurant: Restaurant
    
    
    @State private var showOptions = false
    @State private var showError = false

    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            Image(restaurant.image)
                .resizable()
                .frame(width: 120, height: 118)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading) {
                
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.gray)
                
            }
            
            if restaurant.isFavorite {
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundStyle(.yellow)
            }
            
        }
        .contextMenu{
           
            Button(action: {
                self.showError.toggle()
            }) {
                HStack{
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            }
            
            Button(action: {
                self.restaurant.isFavorite.toggle()
            }) {
                HStack {
                    Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")
                    Image(systemName: "heart")
                }
            }
            
            Button ( action: {
                    self.showOptions.toggle()
            }) {
                
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .alert("Not yet available",
               isPresented: $showError) {
            
            Button("OK") {
                
            }
            
        } message: {
            Text("Sorry, this feature is not availabe yet, Please retry latter.")
        }
        .sheet(isPresented: $showOptions) {
            
            let defaultText = "Just checking in at \(restaurant.name)"
            
            if let imageToShare = UIImage(named: restaurant.image) {
                
                ActivityView(activityItems: [defaultText, imageToShare])
                
            } else {
                
                ActivityView(activityItems: [defaultText])

            }
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

#Preview("BasicTextImageRow", traits: .sizeThatFitsLayout) {
    
    BasicTextImageRow(restaurant: .constant(Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend"),
    ))
    
}

#Preview("FullImageRow", traits: .sizeThatFitsLayout) {
    
    FullImageRow(
        imageName: "cafedeadend",
        name: "CafeDeadend",
        type: "Cafe",
        location: "Hong Kong",
    )
    
}
