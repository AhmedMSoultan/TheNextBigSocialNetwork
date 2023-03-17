//
//  HomeView.swift
//  TheNextBigSocialNetwork
//
//  Created by Ahmed Soultan on 14/03/2023.
//

import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
        TabView {
            PostsView()
                .tabItem {
                    TabBarItem(tabItemImage: .home)
                }
            
            Text("Shop")
                .tabItem {
                    TabBarItem(tabItemImage: .shop)
                }
            
            Text("Discount")
                .tabItem {
                    TabBarItem(tabItemImage: .discount)
                }
            
            Text("Gallery")
                .tabItem {
                    TabBarItem(tabItemImage: .gallery)
                }
            
            Text("Profile")
                .tabItem {
                    TabBarItem(tabItemImage: .profile)
                }
        }
    }
}

struct TabBarItem: View {
    var tabBarImage: TabBarImage
    
    init(tabItemImage: TabBarImage) {
        self.tabBarImage = tabItemImage
    }
    
    var body: some View {
        VStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 12, height: 2)
            
            Image(tabBarImage.rawValue)
                .renderingMode(.template)
                .resizable()
                .frame(width: 10, height: 10)
                .scaledToFit()
        }
        .frame(width: 24, height: 24)
    }
}

enum TabBarImage: String {
    case home = "home-icon"
    case shop = "shop-icon"
    case discount = "discount-shape-icon"
    case gallery = "gallery-icon"
    case profile = "profile-icon"
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
