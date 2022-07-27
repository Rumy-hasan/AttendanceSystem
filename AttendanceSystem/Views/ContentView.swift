//
//  ContentView.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 24/7/22.
//

import SwiftUI

struct ContentView: View {
    @State var isInitialSetupDone: Bool = UserDefaults.standard.bool(forKey: Constants.isInitialSetupDone.rawValue)
    
    var body: some View {
        if isInitialSetupDone {
            TabBarView()
        }else{
            OnboardingView(keyboardHandler: KeyboardFollower(), isInitialSetupDone: $isInitialSetupDone)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
