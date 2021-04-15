//
//  JsonClasses.swift
//  Attain
//
//  Created by Joseph Yeh on 4/12/21.
//

import Foundation
struct BankAccount: Codable {
    var account_id: String
    var balances: Balances
    var name: String
    var bankName:String?
    
    private enum CodingKeys: String, CodingKey {
            case account_id,balances,name
        }
}

struct Balances: Codable {
    var available: Float
    var current: Float
    
}


struct RoundingHistory: Codable {
    var total_rounding: Float
    var current_rounding: Float
} 
