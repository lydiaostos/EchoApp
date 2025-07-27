import SwiftUI

struct tutorialPage3: View {
    @Binding var selectedTab: appTab
    @Binding var tutorialPageIndex: Int
    @State private var goBackToFirstPage = false

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
                    // Header with identical padding as tutorialPage
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

                    ScrollView {
                        VStack(spacing: 0) {
                            Text("Place your AirPods into")
                                .font(.system(size: 25))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 10)

                            Text("your ears and")
                                .font(.system(size: 25))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 10)

                            Text("enable spatial audio")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 10)
                        }
                    }

                    Text("Ensure that spatial audio is enabled on supported AirPods models.")
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 0.373, green: 0.373, blue: 0.373))
                        .opacity(0.6)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)

                    Button(action: {
                        tutorialPageIndex = 0
                        goBackToFirstPage = true
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 26)
                                .fill(Color(red: 0.0, green: 0.392, blue: 0.580))
                                .opacity(0.5)
                                .frame(width: 325, height: 55)

                            Text("Done")
                                .foregroundColor(.white)
                                .fontWeight(.regular)
                                .padding(.horizontal, 30)
                        }
                    }
                    .padding(.bottom, 10)
                }
                .padding(.bottom, 10)
            }
        }
        .onChange(of: tutorialPageIndex) { newValue in
            if newValue == 0 {
                goBackToFirstPage = false
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var tutorialPageIndex = 2
        var body: some View {
            tutorialPage3(
                selectedTab: .constant(.tutorial),
                tutorialPageIndex: $tutorialPageIndex
            )
        }
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


    

