//
//  ContentView.swift
//  ReadMe
//
//  Created by Dmitrii Tikhomirov on 7/5/23.
//

import SwiftUI
import Combine

struct ContentView: View {

  @State var library = Library()

  var body: some View {
    NavigationView {
      List {
        Button {

        } label: {
          Spacer()
          VStack(alignment: .center) {
            Image(systemName: "book.circle")
              .font(.system(size: 60))
            Text("Add New Book")
              .font(.title2)
          }
          Spacer()
        }
        .buttonStyle(.borderless)
        .padding(.vertical, 8)

        ForEach(library.sortedBooks) { book in
          BookRowView(
            book: book,
            image: $library.images[book]
          )
        }
//        .listRowSeparatorTint(.red)
      }
//      .listStyle(.plain)
      
      .navigationTitle("My Library")
    }
//    .listStyle(.plain)
  }
}

struct BookRowView: View {

  @ObservedObject var book: Book
  @Binding var image: Image?

  var body: some View {

    NavigationLink(destination: DetailView(book: book, image: $image)) {
      HStack {
        Book.Image(
          image: image,
          cornerRadius: 12,
          title: book.title,
          size: 80.0
        )

        VStack(alignment: .leading) {
          TitleAndAuthorStack(
            book: book,
            titleFont: .title2,
            authorFont: .title3
          )

          if !book.microRewiew.isEmpty {
            Spacer()
            Text(book.microRewiew)
              .font(.subheadline)
              .foregroundColor(.secondary)
          }
        }
        .lineLimit(1)

      }
    }
    .padding(.vertical)

  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
