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
    private let viewModel = DetailViewModel()

    @State var text = ""

    var body: some View {
        NavigationView {
            
            VStack {
                TextArea("ここに入力してください", text: $text)
                    .onAppear() {
                        self.text = item.body ?? ""
                    }
            }
            .navigationBarTitle(item.title ?? "", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("タイトル変更", action: {  })
                        Button("読み上げ", action: { viewModel.speech() })
                        Button("メモの出力", action: { })
                        Button("音声ファイル書き出し", action:  { viewModel.create() })
                        Button("情報", action: {  })
                        
                    } label: {
                        Label("", systemImage: "ellipsis.circle")
                    }
                }

            }
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
