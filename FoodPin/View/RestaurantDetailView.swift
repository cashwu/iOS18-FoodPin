//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-06.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    var restaurant: Restaurant
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                Image(restaurant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, idealWidth: .infinity)
                    .frame(height: 445)
                    .overlay {
                        VStack {
                            
                            Image(systemName: "heart")
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                                .padding()
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .padding(.top, 40)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(restaurant.name)
                                    .font(.custom("Nunito-Regular", size: 35, relativeTo: .largeTitle))
                                    .bold()
                                
                                Text(restaurant.type)
                                    .font(.system(.headline, design: .rounded))
                                    .padding(.all, 5)
                                    .background(Color.black)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity,
                                   minHeight: 0, maxHeight: .infinity,
                                   alignment: .bottomLeading)
                            .foregroundStyle(.white)
                            .padding()
                        }
                    }
                
                Text(restaurant.description)
                    .padding()
                
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading) {
                        Text("ADDRESS")
                            .font(.system(.headline, design: .rounded))
                        
                        Text(restaurant.location)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                    VStack(alignment: .leading) {
                        Text("PHONE")
                            .font(.system(.headline, design: .rounded))
                        
                        Text(restaurant.phone)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                
                
                NavigationLink (
                    destination:
                        MapView(location: "台中市太平區太興路18號")
                        .toolbarBackground(.hidden, for: .navigationBar)
                        .edgesIgnoringSafeArea(.all)
                ) {
                    MapView(location: "台中市太平區太興路18號")
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding()
                }
            }
            
            
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
           ToolbarItem(placement: .navigationBarLeading) {
               
               Button(action: {
                  dismiss()
               }){
                   Text("\(Image(systemName: "chevron.left"))")
               }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack {
        RestaurantDetailView(restaurant: Restaurant(
            name: "Cafe Deadend",
            type: "Cafe",
            location: "Hong Kong",
            phone: "123-456",
            description: "desc",
            image: "cafedeadend",
            isFavorite: true
        ))
        .toolbarBackground(.hidden, for: .navigationBar)
        .environment(\.dynamicTypeSize, .xxxLarge)
    }.tint(.white)
}
