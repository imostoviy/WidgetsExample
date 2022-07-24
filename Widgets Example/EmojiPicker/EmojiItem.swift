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
    let id: UUID = .init()
}
