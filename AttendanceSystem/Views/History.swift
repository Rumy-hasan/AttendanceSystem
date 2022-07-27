//
//  History.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 23/7/22.
//

import SwiftUI
import Combine
import Foundation

struct History: View {
    @Binding var tab: Tab
    @EnvironmentObject var mv: OfficeTimeLogic
    @State var pickedDate: Date = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    
    var body: some View {
        VStack {
            DatePickerView(initialString: "Pick a date to see that day activity", pickTime: $pickedDate)
            if(self.mv.anyStaffActivityEntity != nil){
                VStack {
                    if let checkIn = self.mv.anyStaffActivityEntity?.checkin{
                        Text("Check In Time = \(checkIn.timeString())")
                    }
                    if let checkOut = self.mv.anyStaffActivityEntity?.checkout{
                        Text("Check Out Time = \(checkOut.timeString())")
                    }
                    if let outSideSpendingTime = self.mv.anyStaffActivityEntity?.outsideSpendingTime{
                        Text("OutSide Spending Time = \(outSideSpendingTime)")
                    }
                }
            }else{
                Text("May be he/she is absent that day.")
            }
            Spacer()
        }
        .onAppear(perform: {
            self.mv.fetchStaffActivity(of: pickedDate)
        })
        .onChange(of: pickedDate) { newValue in
            self.mv.fetchStaffActivity(of: newValue)
        }
    }
}
