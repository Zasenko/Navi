//
//  TabBarItemView.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 17.02.23.
//

import SwiftUI

struct TabBarItemView: View {
    
    var namespace: Namespace.ID
    let item: TabBarItem
    
    var body: some View {
        VStack {
            item.color
                .frame(width: 4, height: 4)
                .matchedGeometryEffect(id: "img", in: namespace)
                .frame(width: 20, height: 20)
            item.icon
                .foregroundColor(item.color)
            Text(item.text)
                .foregroundColor(item.color)
            
        }
    }
}

//struct TabBarItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarItemView()
//    }
//}
