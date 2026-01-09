//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-09.
//

import SwiftUI

struct NewRestaurantView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var restaurantName = ""
    
    @State private var restaurantImage: UIImage? = UIImage(named: "newphoto")
    
    @State private var showPhotoOptions = false
    
    @State private var photoSource: PhotoSource?
    
    var body: some View {
        
        
        NavigationStack {
            
            ScrollView {
                
                VStack {
                    
                    Image(uiImage: restaurantImage ?? UIImage(named: "newphoto")!)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .padding(.bottom)
                        .onTapGesture {
                            self.showPhotoOptions.toggle()
                        }
                    
                    FormTextField(label: "Name",
                                  placeholder: "Fill in the restaurant name",
                                  value: .constant(""))

                    FormTextField(label: "type",
                                  placeholder: "Fill in the restaurant type",
                                  value: .constant(""))
                    
                    FormTextField(label: "address",
                                  placeholder: "Fill in the restaurant address",
                                  value: .constant(""))
                    
                    FormTextField(label: "phone",
                                  placeholder: "Fill in the restaurant phone",
                                  value: .constant(""))
                    
                    
                    FormTextView(label: "Description", value: .constant(""), height: 100)
                        
                }
                .padding()
                
            }
            
            .navigationTitle("New Restaurant")
            
            
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button(action: {
                        dismiss()
                    }) {
                        
                        Image(systemName: "xmark")
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(Color("NavigationBarTitle"))
                    
                }

                
            }
            
        }
        .confirmationDialog("Choose your photo source",
                            isPresented: $showPhotoOptions,
                            titleVisibility: .visible) {
            
            Button("Camera") {
                self.photoSource = .camera
            }
            
            Button("Photo Library") {
                self.photoSource = .photoLibrary
            }
            
        }
        .fullScreenCover(item: $photoSource) { source in
            
            switch source {
                
            case .photoLibrary: ImagePicker(sourceType: .photoLibrary, image: $restaurantImage)
                    .ignoresSafeArea()
                
            case .camera: ImagePicker(sourceType: .camera, image: $restaurantImage)
                    .ignoresSafeArea()

            }
            
        }
        .tint(.primary)
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

enum PhotoSource : Identifiable {
    case photoLibrary
    case camera
    
    var id: Int {
        hashValue
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
