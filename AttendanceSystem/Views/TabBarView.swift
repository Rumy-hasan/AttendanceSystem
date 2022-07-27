//
//  TabBarView.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 23/7/22.
//

import SwiftUI

struct TabBarView: View {
    @State var selection: Tab = .today
    let mv = OfficeTimeLogic()
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                CurrentStatus(tab: $selection)
                    .environmentObject(mv)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Label("Today", systemImage: "house.fill")
                    .accessibility(label: Text("Today"))
            }
            .tag(Tab.today)
            
            NavigationView {
                History(tab: $selection)
                    .environmentObject(mv)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Label("History", systemImage: "house.fill")
                    .accessibility(label: Text("History"))
            }
            .tag(Tab.history)
        }
    }
}
