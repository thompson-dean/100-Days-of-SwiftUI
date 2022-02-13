//
//  AddView.swift
//  Milestone13-15
//
//  Created by Dean Thompson on 2022/02/10.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    let colors = Colors()
    
    @State var showMap = false
    @State var image = UIImage()
    @State var name =  ""
    @State var description = ""
    
    var body: some View {
        
        
        
        VStack {
            
            HStack {
                Spacer()
                Button("Map") {
                    showMap = true
                }
                .padding(10)
                .background(showMap ? colors.secondLightestColor : nil)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
               
                Spacer()
                Button("Photo") {
                    showMap = false
                }
                .padding(10)
                .background(showMap ? nil : colors.secondLightestColor)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                Spacer()
            }
            .foregroundColor(.white)
            
            
            if showMap {
                MapView(viewModel: viewModel)
                    .cornerRadius(10)
                .frame(maxWidth: .infinity)
                .padding(20)
                
            } else {
                ZStack {
                    colors.darkestColor
                     .clipShape(RoundedRectangle(cornerRadius: 10))
                     .padding()
                    
                    Text("Add Photo")
                    
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .onTapGesture {
                            viewModel.source = .library
                            viewModel.showImagePicker()
                        }
                }
            }
            
            if !showMap {
            
            HStack {
                Spacer()
                Button {
                    viewModel.source = .camera
                    viewModel.showImagePicker()
                } label: {
                    Image(systemName: "camera")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                }
                Spacer()
                Button {
                    viewModel.source = .library
                    viewModel.showImagePicker()
                } label: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                Spacer()
                
            }
                        }
            
            Form {
                Section {
                    TextField("Add title", text: $name)
                    
                    TextField("Add description", text: $description)
                }
                
                
                Section {
                    Button("Save") {
                        
                        let imageUUID = saveImage()
                        viewModel.save(post: Post(id: UUID(), name: name, description: description, image: imageUUID, latitude: viewModel.mapRegion.center.latitude, longitude: viewModel.mapRegion.center.longitude))
                        dismiss()
                    }
                    .disabled(name.isEmpty || description.isEmpty)
                }
            }
            
            Spacer()
            
        }
        .sheet(isPresented: $viewModel.showPhotoPicker) {
            ImagePicker(image: $image, sourceType: viewModel.source == .library ? .photoLibrary : .camera)
        }
        .onAppear(perform: viewModel.checkIfLocationServicesIsAvailable)
        
        
        
        
    }
    
    func saveImage() -> UUID {
        let imageUUID = UUID()
        // save image to persistent storage
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            let url = FileManager.default.getDocumentsDirectory().appendingPathComponent(imageUUID.uuidString)
            try? jpegData.write(to: url, options: [.atomicWrite])
        }
        return imageUUID
    }

}


