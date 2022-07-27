//
//  DatePickerView.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 27/7/22.
//

import SwiftUI

struct DatePickerView: View {
    var initialString: String
    var lastSelectedDate: Date = Date()
    @Binding var pickTime: Date
    
    var body: some View {
        VStack(alignment: .center){
            Text(initialString)
                .font(.title)
                .padding()
            //DatePicker("\(initialString)", selection: $pickTime, in: ...lastSelectedDate, displayedComponents: .date)
            DatePicker("", selection: $pickTime, in: ...lastSelectedDate, displayedComponents: .date)
                .frame(width: 300, height: 70, alignment: .center)
        }.padding()
    }
}

struct DatePickerView_Previews: PreviewProvider {
    @State static var datesV = Date()
    static var previews: some View {
        DatePickerView(initialString: "CheckIn", pickTime: $datesV)
    }
}
