//
//  PostCell.swift
//  TheNextBigSocialNetwork
//
//  Created by Ahmed Soultan on 16/03/2023.
//

import SwiftUI

struct PostCell: View {
    var post: Post
    @Binding var searchText: String
    let numberOfPhotos = Int(arc4random_uniform(4))
    let columns = [
        GridItem(.flexible(), alignment: .top),
        GridItem(.flexible(), alignment: .top)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            //MARK: Header View
            HStack(spacing: 4) {
                Image("UserDefaultImage")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFit()
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text((post.userId ?? 0).description)
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(textColor)
                        Spacer()
                        
                        Image(systemName: "ellipsis")
                            .resizable()
                            .frame(width: 16, height: 4)
                            .foregroundColor(dotsColor)
                    }
                    
                    Text("2 days ago")
                        .font(.system(size: 13))
                        .foregroundColor(dateColor)
                }
                Spacer()
            }
            
            //MARK: Post Text View
            HighlightedText(text: post.body ?? "",
                            textPart: searchText,
                            textPartFgColor: Color.black,
                            fontSize: 19,
                            maxLineLength: 100,
                            multilineEnabled: true)
            .font(.system(size: 17, weight: .regular))
            
//            hilightedText(str: post.body ?? "", searched: searchText, textSize: 17)
            
            //MARK: Post Image View
            LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                // MARK: Lists from Universal Search
                
                ForEach((0...numberOfPhotos), id: \.self) {_ in
                    KingFisherImage(imageSize: CGSize(width: 170, height: 170),
                                    url: URL(string: "https://picsum.photos/170/17\(Int(arc4random_uniform(100)))")!,
                                    hasCornerRadius: true)
                }
            }
        }
        .padding(.horizontal, 16)
    }
    
    func hilightedText(str: String, searched: String, textSize: CGFloat) -> Text {
        guard !str.isEmpty && !searched.isEmpty else { return Text(str) }
        
        var result: Text!
        let parts = str.components(separatedBy: searched)
        for i in parts.indices {
            result = (result == nil ? Text(parts[i]) : result + Text(parts[i]))
            if i != parts.count - 1 {
                result = result + Text(searched).bold().font(.system(size: textSize + 2))
            }
        }
        return result ?? Text(str).font(.system(size: textSize))
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PostCell(post: Post(id: 1,
                                title: "This is important to remember.",
                                body: "This is important to remember. Love isn't like pie. You don't need to divide it among all your friends and loved ones. No matter how much love you give, you can always give more. It doesn't run out, so don't try to hold back giving it as if it may one day run out. Give it freely and as much as you want.",
                                userId: 12,
                                tags: ["magical","crime"],
                                reactions: 2), searchText: .constant("important"))
        }
    }
}
