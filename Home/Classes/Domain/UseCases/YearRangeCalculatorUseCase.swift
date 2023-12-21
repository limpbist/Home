//
//  YearRangeCalculatorUseCase.swift
//  Home
//
//  Created by Aaron Andres Gaspar Peña on 11/12/23.
//

class YearRangeCalculatorUseCase {
    static let limitYear = 1500
    static func getRange() -> [String] {
        var yearsArray: [String] = []
        let currentYear = Calendar.current.component(.year, from: Date()) //AÑO ACTUAL

        for itemYear in limitYear...currentYear {
            yearsArray.append(String(itemYear))
        }
        return yearsArray.reversed()
    }
}
