//
//  TabBarView.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 17.02.23.
//

import SwiftUI

struct TabBarView: View {
    
    var tabBarItems = [TabBarItem(id: 1, text: "Calendar", icon: Image(systemName: "calendar"), color: .red),
                       TabBarItem(id: 2, text: "Map", icon: Image(systemName: "map"), color: .orange),
                       TabBarItem(id: 3, text: "Catalog", icon: Image(systemName: "globe.europe.africa.fill"), color: .gray),
                       TabBarItem(id: 4, text: "Settings", icon: Image(systemName: "gearshape.fill"), color: .blue)]
    
    @Namespace var nameSpase

    var body: some View {
        TabView {
            ForEach(tabBarItems) { item in
                item.color
                    //.badge("!")
                    .ignoresSafeArea(.container, edges: .top)
                    .tabItem {
                        TabBarItemView(namespace: nameSpase, item: item)
                    }
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
