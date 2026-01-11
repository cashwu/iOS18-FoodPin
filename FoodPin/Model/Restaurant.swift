//
//  Restaurant.swift
//  FoodPin
//
//  Created by Cash on 2026-01-02.
//

import Foundation
import Combine
import SwiftData
import SwiftUI

@Model class Restaurant {
    
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

    var name: String = ""
    var type: String = ""
    var location: String = ""
    var phone: String = ""
    var summary: String = ""
    
    @Attribute(.externalStorage) var imageData = Data()
    
    @Transient var image: UIImage {
        
        get {
            UIImage(data: imageData) ?? UIImage()
        }
        
        set {
            self.imageData = newValue.pngData() ?? Data()
        }
    }
    
    var isFavorite: Bool = false
    
    @Transient var rating: Rating? {
        
        get {
            guard let ratingText = ratingText else {
                return nil
            }
            
            return Rating(rawValue: ratingText)
        }
        
        set {
            self.ratingText = newValue?.rawValue
        }
    }
    
    @Attribute(originalName: "rating") var ratingText: Rating.RawValue?
    
    init(name: String, type: String, location: String, phone: String = "123", description: String = "desc", image: UIImage? = nil, isFavorite: Bool = false, rating: Rating? = nil) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.summary = description
        if let image = image {
            self.image = image
        }
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
