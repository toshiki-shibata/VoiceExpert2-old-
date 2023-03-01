//
//  AddItemView.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/08/21.
//

import SwiftUI
import CoreData

struct AddItemView: View {
    @State var text: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .padding()
            .padding(.horizontal)
        }
        .navigationBarTitle("新規作成", displayMode: .inline)
        .navigationBarItems(leading: Button(action: {
//            ItemRepositoryImpl().save(body: text)
        }, label: {
            Image(systemName: "checkmark")
        }))
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
