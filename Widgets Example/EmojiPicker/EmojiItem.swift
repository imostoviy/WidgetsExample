//
//  EmojiItem.swift
//  Widgets Example
//
//  Created by Ihor Mostovyi on 7/24/22.
//

import Foundation

struct EmojiItem: Identifiable {
    let emoji: String
    let name: String
    let description: String
    let url: URL?

    var id: String {
        emoji
    }

    init(emoji: String, name: String, description: String) {
      self.emoji = emoji
      self.name = name
      self.description = description
      self.url = URL(string: "emoji://\(name.filter { !$0.isWhitespace })")
    }
}
