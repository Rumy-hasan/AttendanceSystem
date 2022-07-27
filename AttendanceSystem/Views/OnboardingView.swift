//
//  ContentView.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 22/7/22.
//

import SwiftUI

struct OnboardingView: View {
    @State var baseObj: BaseData = BaseData()
    @ObservedObject var keyboardHandler: KeyboardFollower
    @Binding var isInitialSetupDone: Bool
    
    var body: some View {
        VStack{
            Spacer()
            Text("Office Setup")
                .font(.title)
            Spacer()
            HStack{
                TimePickerView(initialString: "Check In Time", pickTime: $baseObj.checkIn)
                TimePickerView(initialString: "Check Out Time", pickTime: $baseObj.checkOut)
            }.padding()
            Spacer()
            Text("Provide building information")
                .bold()
                .padding()
            VStack{
                CustomTextView(upperTitle: "Latitude", value: $baseObj.centerLat)
                CustomTextView(upperTitle: "Longitude", value: $baseObj.centerLon)
                CustomTextView(upperTitle: "Height per floor in meter", value: $baseObj.floorHeight)
                CustomTextView(upperTitle: "Building radius in Meter", value: $baseObj.buildingRadius)
            }.padding()
            Spacer()
            Button("Save Data") {
                self.baseObj.saveData()
                self.isInitialSetupDone = true
            }
            .padding()
            .bordered()
            Spacer()
        }
        .padding(.bottom, keyboardHandler.keyboardHeight)
        .edgesIgnoringSafeArea(keyboardHandler.isVisible ? .bottom : [])
    }
    
    
    
}



//struct COnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView(keyboardHandler: KeyboardFollower())
//            .environmentObject(BaseData())
//    }
//}
