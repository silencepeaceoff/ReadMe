//
//  photopick.swift
//  ReadMe
//
//  Created by Dmitrii Tikhomirov on 7/5/23.
//

import SwiftUI
import PhotosUI

struct PhotoView: View {

  @State private var selectedItem: PhotosPickerItem? = nil
  @State private var selectedImageData: Data? = nil
  @Binding var image: Image?

  var body: some View {
    PhotosPicker(
      selection: $selectedItem,
      matching: .images,
      photoLibrary: .shared()) {
        Text("Select a photo")
      }
      .onChange(of: selectedItem) { newItem in
        Task {
          guard let selectedItem = selectedItem else { return }
          loadTransferable(from: selectedItem)
        }
      }
  }

  func loadTransferable(from selectedItem: PhotosPickerItem) -> Progress {
    return selectedItem.loadTransferable(type: Image.self) { result in
      DispatchQueue.main.async {
        guard selectedItem == self.selectedItem else { return }
        switch result {
        case .success(let image?):
          self.image = image
        case .success(nil):
          print("Nil")
        case .failure(let error):
          print("Error")
        }
      }
    }
  }
}

struct PhotoView_Preview: PreviewProvider {
  static var previews: some View {
    PhotoView(image: .constant(nil))
  }
}
