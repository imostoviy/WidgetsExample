//
//  EmojiWidget.swift
//  EmojiWidget
//
//  Created by Ihor Mostovyi on 7/24/22.
//

import SwiftUI
import WidgetKit

private typealias Entry = RandomEmojiEntry

struct RandomEmojiWidgetProvider: TimelineProvider {

    func placeholder(in context: Context) -> RandomEmojiEntry {
        return RandomEmojiEntry(date: Date(), emojiItem: EmojiProvider.random())
    }

    func getSnapshot(in context: Context, completion: @escaping (RandomEmojiEntry) -> Void) {
        let entry = RandomEmojiEntry(date: Date(), emojiItem: EmojiProvider.random())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<RandomEmojiEntry>) -> Void) {
        let currentDate = Date()
        let entries = (0 ..< 5).map {
            Calendar.current.date(byAdding: .hour, value: $0, to: currentDate)!
        }.map {
            RandomEmojiEntry(date: $0, emojiItem: EmojiProvider.random())
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct RandomEmojiEntry: TimelineEntry {

    public let date: Date
    public let emojiItem: EmojiItem
}

struct RandomEmojiWidgetEntryView: View {

    let entry: RandomEmojiWidgetProvider.Entry

    var body: some View {
        EmojiWidgetView(emojiDetails: entry.emojiItem)
    }
}

struct RandomEmojiWidget: Widget {
    private let kind: String = "RandomEmojiWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: RandomEmojiWidgetProvider()
        ) {
            entry in
            RandomEmojiWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Random Emoji Widget")
        .description("Display a widget with an emoji that is updated randomly.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct RandomEmojiWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        RandomEmojiWidgetEntryView(
            entry: RandomEmojiEntry(
                date: Date(),
                emojiItem: EmojiProvider.random()
            )
        )
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
