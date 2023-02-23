//
//  LogoAnimationView.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 23.02.23.
//

import SwiftUI

struct LogoAnimationView: View {
    
    @State private var animate = false
    
    var body: some View {
            HStack(spacing: 0) {
                if !animate {
                    AppImages.leftLogo
                        .resizable()
                        .scaledToFit()
                }
                    
                AppImages.mainLogo
                    .resizable()
                    .scaledToFit()
                if !animate {
                    AppImages.rightLogo
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(height: 50)
            .onAppear() {
                withAnimation(.spring()) {
                    animate.toggle()
                }
            }
        
    }
}

struct LogoAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LogoAnimationView()
    }
}
