//
//  AddItemView.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/08/21.
//

import SwiftUI

struct AddItemView: View {
    @State var text: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var alertIsPresented = false

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $text)
                    .padding()
                    .border(Color.black, width: 1)
                HStack {
                    Text("テスト")
                    Spacer()
                    Text("テスト")
                    Spacer()
                    Text("テスト")
                }
                .padding(.horizontal)
            }
                .navigationTitle("新規作成")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            self.alertIsPresented.toggle()
//                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("保存")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        }.alert("保存", isPresented: $alertIsPresented, actions: {
                            TextField("タイトル", text: $text)



                            Button("保存", action: {
                                //保存処理を書く
                            })
                            Button("キャンセル", role: .cancel, action: {})
                        }, message: {
                            Text("")
                        })
                    }
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("キャンセル")
                        }
                    }
                }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
