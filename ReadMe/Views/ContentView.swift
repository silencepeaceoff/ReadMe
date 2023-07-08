//
//  ContentView.swift
//  ReadMe
//
//  Created by Dmitrii Tikhomirov on 7/5/23.
//

import SwiftUI
import Combine

struct ContentView: View {

  @EnvironmentObject var library: Library
  @State var isAddNewBook = false

  var body: some View {
    NavigationView {
      List {
        Button {
          isAddNewBook = true
        } label: {
          Spacer()

          VStack(spacing: 6.0) {
            Image(systemName: "book.circle")
              .font(.system(size: 60))
            Text("Add New Book")
              .font(.title2)
          }

          Spacer()
        }
        .buttonStyle(.borderless)
        .padding(.vertical, 8)
        .sheet(isPresented: $isAddNewBook, content: NewBookView.init)

        ForEach(Section.allCases, id: \.self) {
          SectionView(section: $0)
        }
      }
      
      .navigationTitle("My Library")
    }
  }
}

private struct BookRowView: View {

  @ObservedObject var book: Book
  @EnvironmentObject var library: Library

  var body: some View {

    NavigationLink(destination: DetailView(book: book)) {
      HStack {
        Book.Image(
          image: library.images[book],
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

private struct SectionView: View {

  let section: Section
  @EnvironmentObject var library: Library

  var body: some View {
    if let books = library.sortedBooks[section] {
      SwiftUI.Section {
        ForEach(books) { book in
          BookRowView(book: book)
        }
      } header: {
        Image("BookTexture")
          .resizable()
          .scaledToFit()
          .listRowInsets(.init())
      }

    }

  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(Library())
  }
}
