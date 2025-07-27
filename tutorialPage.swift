//
//  tutorialPage.swift
//  test
//
//  Created by Lydia Ostos on 7/21/25.
//

import SwiftUI

struct tutorialPage: View {
    @Binding var selectedTab: appTab
    @Binding var tutorialPageIndex: Int
    @State private var goToNextPage = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.0, green: 0.392, blue: 0.580).opacity(0.3),
                        Color(red: 0.0, green: 0.392, blue: 0.580)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                .opacity(0.2)
                
                VStack {
                    HStack {
                        Text("Tutorial")
                            .font(.system(size: 43, weight: .bold))
                            .padding(.top, 30)
                        
                        Spacer()
                        
                        Image("profilePhoto")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)
                            .padding(.top, 30)
                    }
                    .padding()
                    
                    ScrollView{
                        VStack {
                            Text("Place the belt on your waist")
                                .font(.system(size: 25))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 10)
                            
                            Text("on top of any clothing.")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                        }
                    }

                    NavigationLink(
                        destination:
                            tutorialPage3( selectedTab: $selectedTab, tutorialPageIndex: $tutorialPageIndex ),
                        
                        isActive: $goToNextPage
                    ) {
                        EmptyView()
                    }
                    
                    Text("Adjust the belt snugly and ensure that the belt is facing forward.")
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                        .opacity(0.6)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    Button(action: {
                        tutorialPageIndex = 1
                        goToNextPage = true
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 26)
                                .fill(Color(red: 0.0, green: 0.392, blue: 0.580))
                                .opacity(0.5)
                                .frame(width: 325, height: 55)
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .fontWeight(.regular)
                            
                                .padding(.horizontal, 30)
                        }
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .onChange(of: tutorialPageIndex) {
            if tutorialPageIndex == 0 {
                goToNextPage = false
            }
        }
    }
}
    
    //}
    #Preview{
        struct PreviewWrapper: View {
            @State var tutorialPageIndex = 1
            var body: some View {
                tutorialPage(
                    selectedTab: .constant(.tutorial),
                    tutorialPageIndex: $tutorialPageIndex
                )
            }
        }
        return PreviewWrapper()
    }
    
