//
//  EmojiPickerView.swift
//  Widgets Example
//
//  Created by Ihor Mostovyi on 7/24/22.
//

import SwiftUI

struct EmojiPickerView: View {

    let emojiData = EmojiProvider.all()
    @State private var visibleEmojiDetails: EmojiItem?

    var body: some View {
        NavigationView {

            List {

                ForEach(emojiData) { emojiDetails in
                    Button(action: {
                        visibleEmojiDetails = emojiDetails
                    }, label: {
                        EmojiItemView(emoji: emojiDetails.emoji, emojiName: emojiDetails.name)
                    })
                }
            }
            .foregroundColor(.black)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Emoji pedia")
        }
        .onOpenURL { url in
            guard let emojiDetails = emojiData.first(where: { $0.url == url }) else { return }
            visibleEmojiDetails = emojiDetails
        }
        .sheet(item: $visibleEmojiDetails, content: { emojiDetails in
            EmojiDetailsView(emojiDetails: emojiDetails)
        })
    }
}

struct EmojiItemView: View {

    let emoji: String
    let emojiName: String

    var body: some View {
        Text("\(emoji) \(emojiName)")
            .font(.largeTitle)
            .padding([.top, .bottom])
    }
}

struct EmojiDetailsView: View {

    var emojiDetails: EmojiItem

    var body: some View {
        ZStack {

            Color.indigo.edgesIgnoringSafeArea(.all)

            VStack {
                VStack(alignment: .leading) {

                    Text("\(emojiDetails.emoji) \(emojiDetails.name)")
                        .font(.largeTitle)
                        .bold()
                        .padding()

                    Text(emojiDetails.description)
                        .padding([.leading, .trailing, .bottom])
                        .font(.title)
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct EmojiPickerView_Previews: PreviewProvider {

    static var previews: some View {
        EmojiPickerView()
    }
}
