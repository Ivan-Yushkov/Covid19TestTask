//
//  SummaryDataForParse.swift
//  Covid19TestTask
//
//  Created by Иван Юшков on 07.01.2021.
//

import Foundation

// MARK: - SummaryData
struct SummaryData: Codable {
    let message: String
    let global: Global
    let countries: [Country]
    let date: String
    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
}

// MARK: - Country
struct Country: Codable {
    let country, countryCode, slug: String
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int
    let newRecovered, totalRecovered: Int
    let date: String
    
    let premium: Premium

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case date = "Date"
        case premium = "Premium"
    }
}

// MARK: - Premium
struct Premium: Codable {
}

// MARK: - Global
struct Global: Codable {
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int
    let newRecovered, totalRecovered: Int

    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
}
