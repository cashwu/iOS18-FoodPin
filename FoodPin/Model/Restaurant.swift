//
//  Restaurant.swift
//  FoodPin
//
//  Created by Cash on 2026-01-02.
//

import Foundation

struct Restaurant {
    var name: String = ""
    var type: String = ""
    var location: String = ""
    var phone: String = ""
    var description: String = ""
    var image: String = ""
    var isFavorite: Bool = false
    
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
