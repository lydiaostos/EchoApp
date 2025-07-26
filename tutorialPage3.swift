//
//  tutorialPage3.swift
//  test
//
//  Created by Lydia Ostos on 7/21/25.
//

import SwiftUI

struct tutorialPage3: View {
    @Binding var selectedTab: appTab
    @Binding var tutorialPageIndex: Int
    
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
                            .font(.system(size: 43))
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        
                        Image("profilePhoto")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)
                    }
                    .padding(.horizontal)
//                    .padding(.top, 20)
                    
                    ScrollView{
                        VStack {
                            Text("Place your AirPods into")
                            Text("your ears and")
                            Text("enable spatial audio")
                                .fontWeight(.bold)
                        }
                                .font(.system(size: 25))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 10)
                                .padding(.top, 0)
                        
                    Spacer()
                        
                        Text("Ensure that spatial audio is enabled on supported AirPods models.")
                            .fontWeight(.regular)
                            .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                            .opacity(0.6)
                            .multilineTextAlignment(.center)
                            .padding(.top, 375)
                            
                           
                        Button(action: {
                            // selectedTab = .home
                            tutorialPageIndex = 0
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 26)
                                    .fill(Color(red: 0.0, green: 0.392, blue: 0.580))
                                    .opacity(0.5)
                                    .frame(width: 325, height: 55)
                                
                                Text("Done")
                                    .foregroundColor(.white)
                                    .fontWeight(.regular)
                                
                            }
                        }
                        
                    }
                }
                
            }
        }
    }
}
    
    //}
    #Preview {
        struct PreviewWrapper: View {
            @State private var index = 2
            var body: some View {
                tutorialPage3(
                    selectedTab: .constant(.tutorial),
                    tutorialPageIndex: $index
                )
            }
        }
        return PreviewWrapper()
    }

