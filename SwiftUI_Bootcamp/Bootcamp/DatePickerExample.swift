//
//  DatePickerExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 30.01.2024.
//

import SwiftUI

struct DatePickerExample: View {

    @State var selectedDate = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endingDate: Date = Date()

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }

    var body: some View {
        VStack {

            Text("Selected date is:")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)

            DatePicker("Select a date", selection: $selectedDate)
                .datePickerStyle(
                    CompactDatePickerStyle()
                )

            DatePicker("Select a date(years)", selection: $selectedDate, displayedComponents: [.date])

            DatePicker("Select a date(range)", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date])
        }
//            .accentColor(.red)
//            .tint(.green)
    }
}

#Preview {
    DatePickerExample()
}
