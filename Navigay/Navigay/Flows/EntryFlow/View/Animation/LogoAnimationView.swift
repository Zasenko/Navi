//
//  LogoAnimationView.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 23.02.23.
//

import SwiftUI

struct LogoAnimationView: View {
    
    
    //MARK: - Prorepties
    
    @State private var animate = false
    @Binding var isAnimationFinished: Bool
    
    //MARK: - Body
    
    var body: some View {
            HStack(spacing: 0) {
                if !animate {
                    AppImages.leftLogo
                        .resizable()
                        .scaledToFit()
                        .transition(.scale(scale: 0, anchor: .trailing).combined(with: .opacity))
               }
                AppImages.mainLogo
                    .resizable()
                    .scaledToFit()
                    .animation(.interpolatingSpring(stiffness: 800, damping: 10), value: animate)
                if !animate {
                    AppImages.rightLogo
                        .resizable()
                        .scaledToFit()
                        .transition(.scale(scale: 0, anchor: .leading).combined(with: .opacity))
                }
            }
            .frame(height: 50)
            .onAppear() {
                withAnimation(.interactiveSpring()) {
                    animate.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.interactiveSpring()) {
                        isAnimationFinished.toggle()
                    }
                }
            }
    }
}
//
//struct LogoAnimationView_Previews: PreviewProvider {
//    static var previews: some View {
//        LogoAnimationView(isAnimateFinished: .constant(false))
//    }
//}
