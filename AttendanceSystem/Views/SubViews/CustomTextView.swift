//
//  CustomTextView.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 22/7/22.
//

import SwiftUI

struct CustomTextView: View {
    var upperTitle: String
    @Binding var value: Double
    
    var body: some View {
        VStack{
            Text("\(upperTitle)")
            TextField("Give \(upperTitle)", value: $value, format: .number)
                .bordered()
                .keyboardType(.decimalPad)
        }.padding([.bottom], 10)
    }
}
