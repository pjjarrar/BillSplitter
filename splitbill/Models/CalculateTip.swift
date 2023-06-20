//
//  CalculateTip.swift
//  splitbill
//
//  Created by phillip jarrar on 6/19/23.
//

import Foundation
import UIKit

struct CalculateTip {
    func calculate(totalAmount: Float, percentTipped: Float, totalPeople: Float) -> Float{
        let tipAmount = totalAmount * percentTipped
        let answer = (totalAmount + tipAmount) / totalPeople
        return answer
    }
    
    func decimalToPercent(percent: Float?) -> Int{
        if let percent = percent{
            let percentToInt = Int(percent * 100)
            return percentToInt
        } else {
            return 0
        }
    }
}
