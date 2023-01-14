//
//  ItemRowView.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/08/21.
//

import SwiftUI
import CoreData

struct ItemCell: View {

    var item: Item

    var body: some View {
        HStack(spacing: 8) {

            Image(systemName: "folder")
            VStack {
                HStack {
                    Text(item.title!)
                        .font(.title)
                        .lineLimit(1)
                        .padding(.leading)
                    Spacer()
                }
                Text(item.body!)
                    .font(.body)
                    .lineLimit(2)
                HStack {
                    Spacer()
                    Text(item.hasCreated ?? Date() , style: .date)
                        .font(.footnote)
                }
            }
            Menu {
                Button("削除", action: { })
            } label: {
                Label("", systemImage: "ellipsis.circle")
            }
            
//            Button(action: {
//                print("テスト")
//            }) {
//                Image(systemName: "ellipsis.circle")
//                    .font(.system(size: 24))
//                    .frame(width: 44, height: 44)
//            }.buttonStyle(.plain)
        }
//        Divider()
    }
}

//struct ItemRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        static let context = PersistenceController.preview.container.viewContext
//        ItemCell(item: item)
//            .previewLayout(.sizeThatFits)
//    }
//}
