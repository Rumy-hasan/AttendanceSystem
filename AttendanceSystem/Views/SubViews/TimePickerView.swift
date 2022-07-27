//
//  TimePickerView.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 22/7/22.
//

import SwiftUI

struct TimePickerView: View {
    var initialString: String
    @Binding var pickTime: Date
    
    var body: some View {
        VStack(alignment: .center){
            Text(initialString)
            DatePicker("", selection: $pickTime, displayedComponents: .hourAndMinute)
        }
    }
}

struct TimePickerView_Previews: PreviewProvider {
    @State static var datesV = Date()
    static var previews: some View {
        TimePickerView(initialString: "CheckIn", pickTime: $datesV)
    }
}
