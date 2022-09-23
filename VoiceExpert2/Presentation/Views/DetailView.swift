//
//  DetailView.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/08/21.
//

import SwiftUI
import CoreData

struct DetailView: View {
    let item: Item

    @State var text = ""

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $text)
                HStack {
                    VStack {
                        Image(systemName: "folder")
                        Text("エクスポート")
                    }
                    VStack {
                        Image(systemName: "folder")
                        Text("エクスポート")
                    }
                    VStack {
                        Image(systemName: "folder")
                        Text("書き出し")
                    }
                }
            }
            .navigationTitle(item.title ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
        }
    }
}
//
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let ctx = PersistenceController.preview.container.viewContext
//        let item = Item.create(title: "テストのタイトル", body: "テストの本文", inContext: ctx)
//
//        DetailView(item: item)
//            .environment(\.managedObjectContext, ctx)
//    }
//}
