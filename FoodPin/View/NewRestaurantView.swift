//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-09.
//

import SwiftUI
import SwiftData

struct NewRestaurantView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext

    @Bindable private var restaurantFormViewModel : RestaurantFormViewModel
    
    @State var restaurantName = ""
    
    @State private var showPhotoOptions = false
    
    @State private var photoSource: PhotoSource?
    
    init() {
        let viewModel = RestaurantFormViewModel()
        viewModel.image = UIImage(named: "newphoto")
        restaurantFormViewModel = viewModel
    }
    
    var body: some View {
        
        
        NavigationStack {
            
            ScrollView {
                
                VStack {
                    
                    Image(uiImage: restaurantFormViewModel.image ?? UIImage(named: "newphoto") ?? UIImage())
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
                    
                    FormTextField(label: String(localized: "Name") ,
                                  placeholder: String("Fill in the restaurant name"),
                                  value: $restaurantFormViewModel.name)

                    FormTextField(label: "type",
                                  placeholder: "Fill in the restaurant type",
                                  value: $restaurantFormViewModel.type)
                    
                    FormTextField(label: "address",
                                  placeholder: "Fill in the restaurant address",
                                  value: $restaurantFormViewModel.location)
                    
                    FormTextField(label: "phone",
                                  placeholder: "Fill in the restaurant phone",
                                  value: $restaurantFormViewModel.phone)
                    
                    
                    FormTextView(label: "Description", value: $restaurantFormViewModel.summary , height: 100)
                        
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
                    
                    Button {
                        save()
                        dismiss()
                    } label: {
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(Color("NavigationBarTitle"))
                        
                    }
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
                
            case .photoLibrary: ImagePicker(sourceType: .photoLibrary,
                                            image: $restaurantFormViewModel.image).ignoresSafeArea()
                
            case .camera: ImagePicker(sourceType: .camera, image: $restaurantFormViewModel.image)
                    .ignoresSafeArea()

            }
        }
        .tint(.primary)
    }
    
    private func save(){
        let restaurant = Restaurant(name: restaurantFormViewModel.name,
                                    type: restaurantFormViewModel.type,
                                    location: restaurantFormViewModel.location,
                                    phone: restaurantFormViewModel.phone,
                                    description: restaurantFormViewModel.summary,
                                    image: restaurantFormViewModel.image)
                                    
        modelContext.insert(restaurant)
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
