//
//  ReviewAndImageStack.swift
//  ReadMe
//
//  Created by Dmitrii Tikhomirov on 7/8/23.
//

import SwiftUI

struct ReviewAndImageStack: View {

  @State private var isShowingDialog = false
  @ObservedObject var book: Book
  @Binding var image: Image?

  var body: some View {
    VStack {
      Divider()
        .padding(.vertical)
      TextField("Review…", text: $book.microRewiew)
        .padding()
      Divider()
        .padding(.vertical)

      Book.Image(
        image: image,
        cornerRadius: 16,
        title: book.title,
        size: nil
      )
      .scaledToFit()

      HStack {
        if image != nil {
          Button("Delete image") {
            isShowingDialog = true
          }
          .confirmationDialog("Delete image for \(book.title)?",
                              isPresented: $isShowingDialog) {
            Button("Delete", role: .destructive) {
              image = nil
            }
          } message: {
            Text("Delete image for \(book.title)?")
          }
          Spacer()
        }
        PhotoView(image: $image)
          .padding()
      }
      Spacer()
    }
  }
}

struct ReviewAndImageStack_Previews: PreviewProvider {
  static var previews: some View {
    ReviewAndImageStack(book: .init(), image: .constant(nil))
      .padding(.horizontal)
  }
}
