//
//  CustomAlert.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2023/01/02.
//

import SwiftUI

struct CustomAlert: View {
    
    @Binding var presentAlert: Bool
      
      /// The alert type being shown
      @State var alertType: AlertType = .success
      
      /// based on this value alert buttons will show vertically
      var isShowVerticalButtons = false
      
      var leftButtonAction: (() -> ())?
      var rightButtonAction: (() -> ())?
      
      let verticalButtonsHeight: CGFloat = 80
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.75)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {

                    if alertType.title() != "" {

                        // alert title
                        Text(alertType.title())
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(height: 25)
                            .padding(.top, 16)
                            .padding(.bottom, 8)
                            .padding(.horizontal, 16)
                    }

                    // alert message
                    Text(alertType.message())
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                        .minimumScaleFactor(0.5)

                    Divider()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 0.5)
                        .padding(.all, 0)

                }
                .frame(width: 270, height: alertType.height(isShowVerticalButtons: isShowVerticalButtons))
                .background(
                    Color.white
                )
                .cornerRadius(4)
            }
        }
    }


//struct CustomAlert_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomAlert()
//    }
//}
