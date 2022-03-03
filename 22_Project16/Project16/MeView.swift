//
//  MeView.swift
//  Project16
//
//  Created by Dean Thompson on 2022/02/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    @State private var name = "Anonymous"
    @State private var emailAddress = "you@yoursite.com"
    @State private var qrCode = UIImage()
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("name...", text: $name)
                    .textContentType(.name)
                    .font(.title3)
                
                TextField("Email Address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    
                HStack {
                    Spacer()
                    Image(uiImage: qrCode)
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .contextMenu {
                            Button {
                                let imageSaver = ImageSaver()
                                imageSaver.writeToPhotoAlbum(image: qrCode)
                            } label: {
                                Label("Save to Photos", systemImage: "square.and.arrow.down")
                            }
                        }
                    Spacer()
                }
            }
            .navigationTitle("Your Code")
            .onAppear {
                updateCode()
            }
            .onChange(of: name) { _ in
                updateCode()
            }
            .onChange(of: emailAddress) { _ in
                updateCode()
            }
        }
    }
    
    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(emailAddress)")
    }
    
    func generateQRCode(from string: String) -> UIImage{
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
                
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
