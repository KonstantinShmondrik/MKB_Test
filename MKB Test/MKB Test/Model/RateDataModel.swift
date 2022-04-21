//
//  Model.swift
//  MKB Test
//
//  Created by Константин Шмондрик on 21.04.2022.
//

import Foundation


// MARK: - RateData
struct RateData: Codable {
    let ratesDate, messageTitle: String
    let code: Int
    let rid, message: String
    let rates: [Rate]
    let downloadDate: String
    let productState: Int
}

// MARK: - Rate
struct Rate: Codable {
    let from: Int
    let currMnemFrom: CurrMnemFrom
    let tp: Int
    let sale, buy, deltaSale, basic: String
    let deltaBuy, currMnemTo: String
    let to: Int
    let name: String
}

enum CurrMnemFrom: String, Codable {
    case eur = "EUR"
    case rur = "RUR"
    case usd = "USD"
}
