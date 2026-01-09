//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-09.
//

import SwiftUI

struct NewRestaurantView: View {
    
    @State var restaurantName = ""
    
    var body: some View {
        
        
//        VStack(alignment: .leading) {
//            
//            
//            Text("NAME")
//                .font(.system(.headline, design: .rounded))
//                .foregroundStyle(Color(.darkGray))
//                .padding(.horizontal, 10)
//            
//            TextField("Fill in the restaurant name", text: $restaurantName)
//                .font(.system(size: 20, weight: .semibold, design: .rounded))
//                .padding(.horizontal)
//                .padding(10)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 5)
//                        .stroke(Color(.systemGray5), lineWidth: 1)
//                )
//                .padding(.vertical, 10)
//        }
        
        FormTextField(label: "Name", 
                      placeholder: "Fill in the restaurant name",
                      value: $restaurantName)

    }
}

struct FormTextField: View {
    
    let label: String
    var placeholder: String = ""
    
    @Binding var value: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(label.uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundStyle(Color(.darkGray))
                .padding(.horizontal, 10)
            
            TextField(placeholder, text: $value)
                .font(.system(.body, design: .rounded))
                .textFieldStyle(PlainTextFieldStyle())
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .padding(.vertical, 10)
        }

    }
}

struct FormTextView : View {
    
    let label: String
    @Binding var value: String
    
    var height: CGFloat = 200.0
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(label.uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundStyle(Color(.darkGray))
                .padding(.horizontal, 10)
            
            TextEditor(text: $value)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .padding(.top, 10)
        }

    }
}
#Preview {
    NewRestaurantView()
}

#Preview("FormTextField", traits: .fixedLayout(width: 300, height: 200)) {
    
    FormTextField(label: "Name",
                  placeholder: "Fill in the restaurant name",
                  value: .constant(""))
}

#Preview("FormTextView", traits: .sizeThatFitsLayout) {
    
    FormTextField(label: "Description",
                  value: .constant(""))
}
