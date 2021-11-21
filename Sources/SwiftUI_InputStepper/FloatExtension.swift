//
//  FloatExtension.swift
//  
//
//  Created by Mateusz Budnik on 21/11/2021.
//

import Foundation


extension Float {
    var decimalPlaces: Int {
           let decimals = String(self).split(separator: ".")[1]
           return decimals == "0" ? 0 : decimals.count
       }
}
