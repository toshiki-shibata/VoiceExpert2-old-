//
//  FloatingButton.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/09/03.
//

import Foundation
import SwiftUI

struct FloatingButton: View {
    
    var tappedAction: ()-> ()?
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    tappedAction()
//                    print("Tapped!!")
                }, label: {
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                })
                .frame(width: 60, height: 60)
                .background(Color.orange)
                .cornerRadius(30.0)
                .shadow(color: .gray, radius: 3, x: 3, y: 3)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 16.0)) // --- 5

            }
        }
    }
}
