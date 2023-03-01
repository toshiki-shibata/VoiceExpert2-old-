//
//  Alert.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/08/30.
//

import SwiftUI

struct AlertView: View {

    @State private var presentAlert = false
    @State private var username: String = ""

    var body: some View {
        Button("Show Alert") {
            presentAlert = true
        }
        .alert("保存", isPresented: $presentAlert, actions: {
            TextField("タイトル", text: $username)



            Button("保存", action: {})
            Button("キャンセル", role: .cancel, action: {})
        }, message: {
            Text("")
        })
    }
}
struct Alert_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
