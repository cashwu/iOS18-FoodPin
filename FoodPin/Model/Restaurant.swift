//
//  Restaurant.swift
//  FoodPin
//
//  Created by Cash on 2026-01-02.
//

import Foundation
import Combine

class Restaurant : ObservableObject {
    
    @Published var name: String = ""
    @Published var type: String = ""
    @Published var location: String = ""
    @Published var phone: String = ""
    @Published var description: String = ""
    @Published var image: String = ""
    @Published var isFavorite: Bool = false
    @Published var rating: Rating?
    
    enum Rating : String, CaseIterable {
        
        case awesome
        case good
        case okay
        case bad
        case terible
        
        var image : String {
            switch self {
            case .awesome:
                return "love"
            case .good:
                return "cool"
            case .okay:
                return "happy"
            case .bad:
                return "sad"
            case .terible:
                return "angry"
            }
        }
        
    }
    
    init(name: String, type: String, location: String, phone: String = "123", description: String = "desc", image: String, isFavorite: Bool = false, rating: Rating? = nil) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.description = description
        self.image = image
        self.isFavorite = isFavorite
        self.rating = rating
    }
}


//struct Restaurant {
//    var name: String
//    var type: String
//    var location: String
//    var image: String
//    var isFavorite: Bool
//    
//    init(name: String, type: String, location: String, image: String, isFavorite: Bool) {
//        self.name = name
//        self.type = type
//        self.location = location
//        self.image = image
//        self.isFavorite = isFavorite
//    }
//    
//    init() {
//        self.name = ""
//        self.type = ""
//        self.location = ""
//        self.image = ""
//        self.isFavorite = false
//    }
//}
