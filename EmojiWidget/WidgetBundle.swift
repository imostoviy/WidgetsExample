//
//  WidgetBundle.swift
//  Widgets Example
//
//  Created by Ihor Mostovyi on 7/24/22.
//

import SwiftUI
import WidgetKit

@main
struct EmojiWidgetBundle: WidgetBundle {

  @WidgetBundleBuilder
  var body: some Widget {
    RandomEmojiWidget()
    CustomEmojiWidget()
  }
}
