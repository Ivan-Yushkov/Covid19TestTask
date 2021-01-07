//
//  Summary.swift
//  Covid19TestTask
//
//  Created by Иван Юшков on 07.01.2021.
//

import Foundation

struct CountryData {
    let country: String
    let newConfirmed: Int
    let totalConfirmed: Int
    let newDeath: Int
    let totalDeath: Int
    let newRecovered: Int
    let totalRecovered: Int
    let date: String
    
    var countryName: String {
        return "" + country
    }
    
    var newConfirmedText: String {
        return "New confirmed cases: " + String(newConfirmed)
    }
    
    var totalConfirmedText: String {
        return "Total confirmed cases: " + String(totalConfirmed)
    }
    
    var dateText: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let newDate = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: newDate ?? Date())
        return dateString
    }
    
    var newDeathText: String {
        return "Number of new deaths: " + String(newDeath)
    }
    
    var totalDeathText: String {
        return "Number of total deaths: " + String(totalDeath)
    }
    
    var newRecoveredText: String {
        return "New recovored cases: " + String(newRecovered)
    }
    
    var totalRecoveredText: String {
        return "Total recovered: " + String(totalRecovered)
    }
    
    init?(fromData countryData: Country) {
        country = countryData.country
        newConfirmed = countryData.newConfirmed
        totalConfirmed = countryData.totalConfirmed
        newDeath = countryData.newDeaths
        totalDeath = countryData.totalDeaths
        newRecovered = countryData.newRecovered
        totalRecovered = countryData.totalRecovered
        date = countryData.date
    }
    
    
}
