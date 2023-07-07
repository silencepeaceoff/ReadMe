//
//  Library.swift
//  ReadMe
//
//  Created by Dmitrii Tikhomirov on 7/5/23.
//

import SwiftUI

struct Library {
  
  var sortedBooks: [Book] { bookshelf }

  private var bookshelf: [Book] = [
    .init(title: "Dune", author: "Frank Herbert", microRewiew: "Some short review..."),
    .init(title: "Dune Messiah", author: "Frank Herbert", microRewiew: "Some short review..."),
    .init(title: "Children of Dune", author: "Frank Herbert", microRewiew: "Some short review..."),
    .init(title: "God Emperor of Dune", author: "Frank Herbert", microRewiew: "Some short review..."),
    .init(title: "Heretics of Dune", author: "Frank Herbert", microRewiew: "Some short review..."),
    .init(title: "Chapterhouse: Dune", author: "Frank Herbert", microRewiew: "Some short review..."),

    .init(title: "The Hobbit", author: "J.R.R.Tolkien"),
    .init(title: "The Lord of the Rings: The Fellowship of the Ring", author: "J.R.R.Tolkien"),
    .init(title: "The Lord of the Rings: The Two Towers", author: "J.R.R.Tolkien"),
    .init(title: "The Lord of the Rings: The Return of the King", author: "J.R.R.Tolkien"),

    .init(title: "The Complete Robot", author: "Isaac Asimov"),
    .init(title: "I, Robot", author: "Isaac Asimov"),
    .init(title: "Second Foundation", author: "Isaac Asimov"),
    .init(title: "The Caves of Steel", author: "Isaac Asimov"),
    .init(title: "The Naked Sun", author: "Isaac Asimov"),
    .init(title: "The Robots of Dawn", author: "Isaac Asimov"),
    .init(title: "Robots and Empire", author: "Isaac Asimov"),
    .init(title: "The Currents of Space", author: "Isaac Asimov"),
    .init(title: "Pebble in the Sky", author: "Isaac Asimov"),
    .init(title: "Prelude to Foundation", author: "Isaac Asimov"),
    .init(title: "Foundation", author: "Isaac Asimov"),
    .init(title: "Foundation and Empire", author: "Isaac Asimov"),
    .init(title: "Second Foundation", author: "Isaac Asimov"),
    .init(title: "Foundation's Edge", author: "Isaac Asimov"),
    .init(title: "Foundation and Earth", author: "Isaac Asimov")
  ]

  var images: [Book: Image] = [:]
}
