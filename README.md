# EchoApp

#HomePage

import SwiftUI

struct HomePage: View {
    @State private var selectedTab: appTab = .home
    @State private var tutorialPageIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainView(selectedTab: $selectedTab)
                .tag(appTab.home)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            tutorialPage(
                selectedTab: $selectedTab,
                tutorialPageIndex: $tutorialPageIndex
            )
            .tag(appTab.tutorial)
            .tabItem {
                Label("Tutorial", systemImage: "figure")
            }

            PeopleView()
                .tag(appTab.faces)
                .tabItem {
                    Label("My People", systemImage: "person.2")
                }
        }
        .onChange(of: selectedTab) {
            if selectedTab == .tutorial {
                tutorialPageIndex = 0
            }
        }
    }
}

#Preview {
    HomePage()
}

