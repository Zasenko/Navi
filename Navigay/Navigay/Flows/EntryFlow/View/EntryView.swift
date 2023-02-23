//
//  EntryView.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 23.02.23.
//

import SwiftUI

struct EntryView: View {
    
    //MARK: - Prorepties
    
    @StateObject var viewModel = EntryViewModel()
    @Binding var isUserLoggenIn: Bool?
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            LogoAnimationView(isAnimationFinished: $viewModel.isLogoAnimationFinished)
            if (viewModel.isLogoAnimationFinished && isUserLoggenIn != nil) {
                Spacer()
                Color.red
            }
        }
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(isUserLoggenIn: .constant(false))
    }
}
