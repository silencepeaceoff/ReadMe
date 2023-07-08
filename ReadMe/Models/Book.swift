//
//  Book.swift
//  ReadMe
//
//  Created by Dmitrii Tikhomirov on 7/5/23.
//

import Foundation
import Combine

class Book: ObservableObject {
  @Published var title: String
  @Published var author: String
  @Published var microRewiew: String
  @Published var readMe: Bool

  init(
    title: String = "Title",
    author: String = "Author",
    microRewiew: String = "",
    readMe: Bool = true
  ) {
    self.title = title
    self.author = author
    self.microRewiew = microRewiew
    self.readMe = readMe
  }
}

extension Book: Hashable, Identifiable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

extension Book: Equatable {
  static func == (lhs: Book, rhs: Book) -> Bool {
    lhs === rhs
  }


}


