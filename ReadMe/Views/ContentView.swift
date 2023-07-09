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
      .listStyle(.insetGrouped)
      .toolbar(content: EditButton.init)
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

  var title: String {
    switch section {
    case .readMe:
      return "Read Me!"
    case .finished:
      return "Finished!"
    }
  }

  var body: some View {
    if let books = library.sortedBooks[section] {
      SwiftUI.Section {
        ForEach(books) { book in
          BookRowView(book: book)
            .swipeActions(edge: .leading) {
              Button {
                withAnimation {
                  book.readMe.toggle()
                  library.sortBooks()
                }
              } label: {
                book.readMe ? Label("Finished!", systemImage: "bookmark.slash") : Label("Read Me!", systemImage: "bookmark")
              }
              .tint(.accentColor)
            }
            .swipeActions(edge: .trailing) {
              Button(role: .destructive) {
                guard let index = books.firstIndex(where: { $0.id == book.id }) else { return }
                withAnimation {
                  library.deleteBooks(atOffsets: .init(integer: index), section: section)
                }
              } label: {
                Label("Delete", systemImage: "trash")
              }
            }
        }
        .onDelete(perform: { indexSet in
          library.deleteBooks(atOffsets: indexSet, section: section)
        })
        .onMove(perform: { indexes, newOffset in
          library.moveBooks(oldOffset: indexes, newOffset: newOffset, section: section)
        })
        .labelStyle(.iconOnly)

      } header: {
        ZStack {
          Image("BookTexture")
            .resizable()
            .scaledToFit()

          Text(title)
            .font(.custom("American Typewriter", size: 24))
            .foregroundColor(.primary)
        }
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
