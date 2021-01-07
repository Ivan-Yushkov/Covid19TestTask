//
//  GlobalData.swift
//  Covid19TestTask
//
//  Created by Иван Юшков on 07.01.2021.
//

import Foundation

struct GlobalData {
    let newConfirmed: Int
    let totalConfirmed: Int
    
    var newConfirmedText: String {
        return "New confirmed cases: " + String(newConfirmed)
    }
    
    var totalConfirmedText: String {
        return "Total cases: " + String(totalConfirmed)
    }
    
    init(global: Global) {
        newConfirmed = global.newConfirmed
        totalConfirmed = global.totalConfirmed
    }
}
