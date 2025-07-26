//
//  MainView.swift
//  test
//
//  Created by Lydia Ostos on 7/22/25.
//

import SwiftUI
import BatteryView

struct MainView: View {
    @State var level: Float = 0.8
    @State var state: BatteryState = .unplugged
    @State var mode: BatteryMode = .normal
    @State var hapticstrength: HapticStrength = .medium
    @State var vibrationfeedback: VibrationFeedbackMode = .on
    @State var obstaclerange: Float = 4.0
    @Binding var selectedTab: appTab
    @State var spatialaudiotoggle: spatialaudioToggle = .on

    
    var body: some View {
        ZStack {
            // Background gradient
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
            
            // Welcome text
            VStack (alignment: .leading) {
                HStack{
                    Text("Welcome back, Jane!")
                        .font(.system(size: 27, weight: .bold))  // single clean font
                        .foregroundColor(Color(red: 0.0, green: 0.392, blue: 0.580))
                        .padding(EdgeInsets(top: 40, leading: 0, bottom: 30, trailing: 0))
                    Spacer()
                    
                    //profile image
                    Image("profilePhoto")
                        .resizable() // Enables resizing
                        .aspectRatio(contentMode: .fit) // Preserves aspect ratio, fits within the frame
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                }
                
                HStack {
                    //Jane's belt text box
                    VStack (alignment: .leading) { Text("Jane's Belt")
                            .font(.system(size: 20))
                            .padding(2.0)
                        
                        //connected text box
                        Text("Connected")
                            .font(.system(size: 17))
                            .foregroundColor(Color(red: 0.235, green: 0.235, blue: 0.263)).opacity(0.6)
                    }
                    
                    Spacer()
                    
                    VStack (alignment: .trailing){
                        //battery
                        Battery($level, $state, $mode)
                            .frame(width: 30)
                        //80% text
                        Text("80%")
                            .font(.system(size: 18))
                            .foregroundColor(Color(red: 0.235, green: 0.235, blue: 0.263)).opacity(0.6)
                    }
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                
                VStack (alignment: .leading) {
                    //vibration feedback
                    Text("Vibration Feedback")
                        .font(.headline)
                    //vibration feedback picker
                    Picker("Vibration Feedback", selection: $vibrationfeedback){
                        Text("Off").tag(VibrationFeedbackMode.off)
                        Text("On").tag(VibrationFeedbackMode.on)
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    
                    VStack (alignment: .leading) {
                        
                        // Haptic strength text box
                        Text("Haptic Strength")
                            .font(.headline)
                        
                        //haptic strength picker
                        Picker("Haptic Strength", selection: $hapticstrength) {
                            Text("Low").tag(HapticStrength.low)
                            Text("Medium").tag(HapticStrength.medium)
                            Text("High").tag(HapticStrength.high)
                            
                            
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    
                    VStack (alignment: .leading) {
                        Text("Spatial Audio")
                            .font(.headline)
                        Picker("Spatial Audio", selection: $spatialaudiotoggle){
                            Text("Off").tag(spatialaudioToggle.off)
                            Text("On").tag(spatialaudioToggle.on)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    
                    
                    VStack (alignment: .leading) {
                        //obstacle range text box
                        Text("Obstacle Range")
                            .font(.headline)
                        //obstacle range slider
                        Slider(value: $obstaclerange, in: 1...5)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    
                    
                    Spacer()
                
                }
                .padding()
                .onAppear{
                    
                }
            }
        .onChange(of: vibrationfeedback) {
            if vibrationfeedback == .off {
                spatialaudiotoggle = .on
            }
        }
        .onChange(of: spatialaudiotoggle) {
            if spatialaudiotoggle == .off {
                vibrationfeedback = .on
            }
        }
    }
}

#Preview {
    MainView(selectedTab: .constant(.home))
}

