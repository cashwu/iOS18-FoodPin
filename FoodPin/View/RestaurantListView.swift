//
//  ContentView.swift
//  FoodPin
//
//  Created by Cash on 2025-12-31.
//

import SwiftUI
import SwiftData

struct RestaurantListView: View {
    
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)
    
    @Query var restaurants : [Restaurant]
    
    @Environment(\.modelContext) private var modelContext
    @State private var showNewRestaurant = false
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                
                if restaurants.count == 0 {
                    
                    Image("emptydata")
                        .resizable()
                        .scaledToFit()
                    
                } else {
                    
                    ForEach(restaurants.indices, id:\.self) { index in
                        
                        ZStack(alignment: .leading) {
                            NavigationLink(destination: RestaurantDetailView(restaurant: restaurants[index])) {
                                EmptyView()
                            }
                            .opacity(0)
                            
                            BasicTextImageRow(restaurant: restaurants[index])
                        }
                        
                    }
                    .onDelete(perform: deleteRecord)
                    .listRowSeparator(.hidden)
                }
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
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Search restaurants ...")
    }
    
    private func deleteRecord(indexSet: IndexSet) {
        
        for index in indexSet {
            let itemToDelete = restaurants[index]
            modelContext.delete(itemToDelete)
        }
        
    }
}

struct BasicTextImageRow : View {
    
    // MARK: - Binding
    
    @Bindable var restaurant: Restaurant
    
    
    @State private var showOptions = false
    @State private var showError = false

    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            Image(uiImage: restaurant.image)
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
            
            ActivityView(activityItems: [defaultText, restaurant.image])
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
    
    BasicTextImageRow(restaurant: Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: UIImage(named: "cafedeadend")!, isFavorite: true),
    )
    
}

#Preview("FullImageRow", traits: .sizeThatFitsLayout) {
    
    FullImageRow(
        imageName: "cafedeadend",
        name: "CafeDeadend",
        type: "Cafe",
        location: "Hong Kong",
    )
    
}
