//
//  DetailView.swift
//  ReadMe
//
//  Created by Dmitrii Tikhomirov on 7/5/23.
//

//import class PhotosUI.PHPickerViewController
import SwiftUI
import PhotosUI

struct DetailView: View {

  @ObservedObject var book: Book
  @Binding var image: Image?
  @State var showingImagePicker = false
  @State private var isShowingDialog = false

  var body: some View {
    VStack(alignment: .leading) {
      HStack(spacing: 16.0) {
        Button {
          book.readMe.toggle()
        } label: {
          Image(systemName: book.readMe ? "bookmark.fill" : "bookmark")
            .font(.system(size: 48, weight: .light))
        }

        TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
          .padding()
      }
      VStack {
        Divider()
          .padding(.vertical)
        TextField("Review the book…", text: $book.microRewiew)
          .padding()
        Divider()
          .padding(.vertical)
        Book.Image(image: image, cornerRadius: 16, title: book.title, size: nil)
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
        }
        .padding()
      }
      Spacer()
      //        Button("Update Image…", action: {
      //          showingImagePicker = true
      //        })
    }
    .padding()
    //    .sheet(isPresented: $showingImagePicker) {
    //      PhotosSelector(image: $image)
    //      PHPickerViewController.View(image: $image) // This is UIKit method
    //    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(book: .init(), image: .constant(nil))
  }
}
