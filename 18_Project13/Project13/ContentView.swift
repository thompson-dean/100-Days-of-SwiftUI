//
//  ContentView.swift
//  Project13
//
//  Created by Dean Thompson on 2022/01/27.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5
    
    @State private var animationAmount = 0.0
    
    
    @State private var filterName = "Change Filter"
    @State private var inputImage: UIImage?
    @State private var showImagePicker = false
    @State private var processedImage: UIImage?
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var showingDialog = false

    @State private var disableSave = true
    
    var body: some View {
        
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.red).opacity(0.2)
                        
                    if image == nil {
                        Text("Text to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    } else {
                        
                    }
                    
                    
                    image?
                        .resizable()
                        .scaledToFit()
                        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
                }
                .onTapGesture {
                    showImagePicker = true
                    animationAmount = 0.0
                }
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity) { _ in applyProcessing()
                        }
                }
                .padding(.vertical)
                HStack {
                    Text("Radius")
                    Slider(value: $filterRadius)
                        .onChange(of: filterRadius) { _ in
                            applyProcessing()
                        }
                }
                .padding(.vertical)
                HStack {
                    Text("RandomKey")
                    Slider(value: $filterScale)
                        .onChange(of: filterScale) { _ in
                            applyProcessing()
                        }
                }
                .padding(.vertical)
                
                HStack {
                    Button(filterName) {
                        showingDialog = true
                    }
                    Spacer()
                    if image == nil {
                        Button("Save") {
                            
                        }
                        .disabled(disableSave)
                    } else {
                        Button("Save") {
                            withAnimation {
                                animationAmount += 180
                            }
                            save()
                            
                        }
                    }
                    
                   
                    
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("InstaFilter")
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .confirmationDialog("Which filter?", isPresented: $showingDialog) {
                Button("Crystallize") {
                    setFilter(CIFilter.crystallize())
                    filterName = "Crystallize"
                }
                Button("Edges") {
                    setFilter(CIFilter.edges())
                    filterName = "Edges"
                }
                Button("Gaussian Blur") {
                    setFilter(CIFilter.gaussianBlur())
                    filterName = "Gaussian Blur"
                }
                Button("Pixellate") {
                    setFilter(CIFilter.pixellate())
                    filterName = "Pixellate"
                }
                Button("Sepia Tone") {
                    setFilter(CIFilter.sepiaTone())
                    filterName = "Sepia Tone"
                }
                Button("Unsharp Mask") {
                    setFilter(CIFilter.unsharpMask())
                    filterName = "Unsharp Mask"
                }
                Button("Vignette") {
                    setFilter(CIFilter.vignette())
                    filterName = "Vignette"
                }
                
                // Challenge 3 Add 3 new filters -
                // motionblur uses keys inputAngle and input Radius
                
                Button("Motion Blur") {
                    setFilter(CIFilter.motionBlur())
                    filterName = "Motion Blur"
                }
                
                Button("Box Blur") {
                    setFilter(CIFilter.boxBlur())
                    filterName = "Box Blur"
                }
                //Hue Adjust uses inputAngle as a key
                Button("Hue Adjust") {
                    setFilter(CIFilter.hueAdjust())
                    filterName = "Hue Adjust"
                }
            }
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func save() {
        guard let processedImage = processedImage else {
            return
        }
        let imageSaver = ImageSaver()
        imageSaver.successHandler = {
            print("Success")
        }
        imageSaver.errorHandler = {
            print("Oops \($0.localizedDescription)")
        }
        imageSaver.writeToPhotoAlbum(image: processedImage)

    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey)
        }
        if inputKeys.contains(kCIInputAngleKey) {
            currentFilter.setValue(filterScale * 10, forKey: kCIInputAngleKey)
        }
        
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
