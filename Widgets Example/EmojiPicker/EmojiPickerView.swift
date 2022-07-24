//
//  EmojiPickerView.swift
//  Widgets Example
//
//  Created by Ihor Mostovyi on 7/24/22.
//

import SwiftUI

struct EmojiPickerView: View {

    let emojiData = EmojiProvider.all()
    @State private var emojiDetailsViewIsShown = false

    var body: some View {
        NavigationView {

            List {

                ForEach(emojiData) { emojiItem in

                    Button(action: {
                        emojiDetailsViewIsShown.toggle()
                    }, label: {
                        rowView(for: emojiItem)
                    })
                    .sheet(isPresented: $emojiDetailsViewIsShown) {
                        EmojiDetailsView(emojiDetails: emojiItem)
                    }
                }
            }
            .foregroundColor(.black)
            .listStyle(.insetGrouped)
            .navigationBarTitle("Emoji Picker")
        }
    }

    private func rowView(for item: EmojiItem) -> some View {
        Text("\(item.emoji) \(item.name)")
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
