//
//  NewBookView.swift
//  ReadMe
//
//  Created by Dmitrii Tikhomirov on 7/8/23.
//

import SwiftUI

struct NewBookView: View {

  @ObservedObject var book = Book(title: "", author: "", microRewiew: "")
  @State var image: Image? = nil
  @EnvironmentObject var library: Library
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationView {
      VStack(spacing: 24.0) {
        TextField("Title", text: $book.title)
        TextField("Author", text: $book.author)
        ReviewAndImageStack(book: book, image: $image)
      }
      .padding()
      .navigationBarTitle("Got a new book?")
      .toolbar {
        ToolbarItem(placement: .status) {
          Button("Add to Library") {
            library.addNewBook(book, image: image)
            dismiss()
          }
          .disabled(
            [book.title, book.author]
              .contains(where: \.isEmpty)
          )
        }
      }
    }
  }
}

struct NewBookView_Previews: PreviewProvider {
  static var previews: some View {
    NewBookView().environmentObject(Library())
  }
}
