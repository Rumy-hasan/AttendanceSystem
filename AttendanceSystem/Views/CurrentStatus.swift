//
//  CurrentStatus.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 22/7/22.
//

import SwiftUI
import Combine

struct CurrentStatus: View {
    @Binding var tab: Tab
    @EnvironmentObject var mv: OfficeTimeLogic
    
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            Text("Today's data")
                .font(.title)
                .padding()
            VStack {
                if let checkIn = self.mv.currentStaffActivityEntity?.checkin{
                    Text("Check In Time = \(checkIn.timeString())")
                }
                if let checkOut = self.mv.currentStaffActivityEntity?.checkout{
                    Text("Last Check Out Time = \(checkOut.timeString())")
                }
            }
            
            if(self.mv.locationDataModel.isInsideTheRegion){
                VStack{
                    Text("Current Status = inside")
                    Text("Current Floor = \(self.mv.locationDataModel.floor)")
                }
            }else{
                if self.mv.currentStaffActivityEntity == nil {
                    Text("Current Status = Not comming yet.")
                }else{
                    Text("Current Status = outside")
                }
            }
            
            if let outSideSpendingTime = self.mv.currentStaffActivityEntity?.outsideSpendingTime{
                let hour = outSideSpendingTime/60
                let min = outSideSpendingTime%60
                let finalText = hour == 0 ? "\(min)m" : "\(hour)h:\(min)m"
                Text("OutSide Spending Time = \(finalText)")
            }
            Spacer()
        }
        .padding()
    }
}

