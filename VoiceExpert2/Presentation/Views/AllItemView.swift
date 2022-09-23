//
//  ContentView.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/08/21.
//

import SwiftUI
import CoreData

struct AllItemView: View {
    @ObservedObject var viewModel = AllItemViewModel()

    @State private var isShowingAddItemView: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.items, id: \.self) { item in
                    NavigationLink {
                        DetailView(item: item)
                    } label: {
                        ItemCell(item: item)

                    }

                }
                .listStyle(InsetGroupedListStyle())
                FloatingButton {
                    isShowingAddItemView.toggle()
                }
            }
            .navigationTitle("すべて")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("仮")
                }
            }
        }
//                FloatingButton()
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            AllItemView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
