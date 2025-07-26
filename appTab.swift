//
//  Tab.swift
//  test
//
//  Created by Lydia Ostos on 7/24/25.
//

import SwiftUI

enum appTab: Hashable {
    case home
    case tutorial
    case faces
}

//enum Tab {
//    case home, tutorial, faces
//}
//
//struct CustomTabBarView: View {
//    @Binding var selectedTab: Tab
//
//    var body: some View {
//        HStack {
//            Spacer()
//            tabItem(icon: "house", label: "Home", tab: .home)
//            Spacer()
//            tabItem(icon: "figure", label: "Tutorial", tab: .tutorial)
//            Spacer()
//            tabItem(icon: "person.2", label: "Faces", tab: .faces)
//            Spacer()
//        }
//        .padding()
//        .background(Color.white)
//    }

//    private func tabItem(icon: String, label: String, tab: Tab) -> some View {
//        VStack {
//            Image(systemName: icon)
//                .foregroundColor(selectedTab == tab ? Color("006494") : .gray)
//            Text(label)
//                .foregroundColor(selectedTab == tab ? Color("006494") : .gray)
//        }
//        .onTapGesture {
//            selectedTab = tab
//        }
//    }
//}

//import Foundation
//import SwiftUI
//
//enum TabSelection {
//    case home
//    case tutorial
//    case faces
//}

//TabView<<#SelectionValue: Hashable#>, Content>(selection: $selectedTab) {
//    MainView(selectedTab: $selectedTab)
//        .tag(Tab.home)
//        .tabItem {
//            Image(systemName: "house")
//                .foregroundColor(selectedTab == .home ? Color(hex: "006494") : .gray)
//            Text("Home")
//        }
//
//    TutorialView(selectedTab: $selectedTab)
//        .tag(Tab.tutorial)
//        .tabItem {
//            Image(systemName: "figure")
//                .foregroundColor(selectedTab == .tutorial ? Color.gray : .gray)
//            Text("Tutorial")
//        }
//
//    PeopleView(selectedTab: $selectedTab)
//        .tag(Tab.faces)
//        .tabItem {
//            Image(systemName: "person.2")
//                .foregroundColor(selectedTab == .faces ? Color.gray : .gray)
//            Text("Faces")
//        }
//}
