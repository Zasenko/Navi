//
//  PlaceView.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 17.02.23.
//

import SwiftUI

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct PlaceView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                Image("testbar")
                    .resizable()
                    .scaledToFill()
                    .frame(height: .infinity)
                
                
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceView()
    }
}
