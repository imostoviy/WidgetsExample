//
//  IntentHandler.swift
//  WidgetExampleIntent
//
//  Created by Ihor Mostovyi on 7/24/22.
//

import Intents

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        return self
    }
}

extension IntentHandler: SelectEmojiIntentHandling {

    func provideEmojiOptionsCollection(
        for intent: SelectEmojiIntent,
        with completion: @escaping (INObjectCollection<EmojiIntentObject>?, Error?) -> Void
    ) {
        var emojiItems = [EmojiIntentObject]()
        EmojiProvider.all().forEach { emojiDetails in
            let emojiIntentObject =
            EmojiIntentObject(identifier: emojiDetails.id, display: "\(emojiDetails.emoji) \(emojiDetails.name)")
            emojiItems.append(emojiIntentObject)
        }
        completion(INObjectCollection(items: emojiItems), nil)
    }
}
