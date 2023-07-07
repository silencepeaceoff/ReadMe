//
//  PhotosPicker.swift
//  ReadMe
//
//  Created by Dmitrii Tikhomirov on 7/5/23.
//

//import PhotosUI
//import SwiftUI

//struct PhotosSelector: View {
//  @State var selectedImage: PhotosPickerItem? = nil
//  @Binding var image: Image?
//
//  var body: some View {
//    PhotosPicker(selection: $selectedImage, matching: .images) {
//      Text("Select Photo")
//    }
//  }
//
//  func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
//    return imageSelection.loadTransferable(type: Image.self) { result in
//      DispatchQueue.main.async {
//        guard imageSelection == self.imageSelection else { return }
//        switch result {
//        case .success(let image?):
//          print("Success")
//        case .success(nil):
//          print("Empty value")
//        case .failure(let error):
//          print("Error")
//        }
//      }
//    }
//  }
//
//}

//struct PhotosSelector: View {
//  @State var avatarItem: PhotosPickerItem?
//  @State var image: Image?
//
//  var body: some View {
//    VStack {
//      PhotosPicker("Select avatar", selection: $avatarItem, matching: .images)
//
//      if let image {
//        image
//          .resizable()
//          .scaledToFit()
//          .frame(width: 300, height: 300)
//
//      }
//    }
//    .onChange(of: avatarItem) { _ in
//      Task {
//        if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
//          if let uiImage = UIImage(data: data) {
//            image = Image(uiImage: uiImage)
//            return
//          }
//        }
//
//        print("Failed")
//      }
//    }
//  }
//}
