//
//  MainView.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/08/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView {
             AllItemView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("すべて")
                    }
                Text("お気に入り")
                    .tabItem {
                        Image(systemName: "star")
                        Text("お気に入り")
                    }
                Text("設定")
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text("設定")
                    }
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
