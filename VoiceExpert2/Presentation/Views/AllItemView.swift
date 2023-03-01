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
                NavigationLink(destination: AddItemView()) {
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .frame(width: 60, height: 60)
                        .background(Color.orange)
                        .cornerRadius(30.0)
                        .shadow(color: .gray, radius: 3, x: 3, y: 3)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 16.0))
                }
            }
            .navigationTitle("すべて")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("検索", action: {print("テスト")})
                    } label: {
                        Label("", systemImage: "ellipsis.circle")
                    }
                }
            }
        }
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllItemView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
