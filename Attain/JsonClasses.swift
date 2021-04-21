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
struct UserInfo: Codable {
    var first_name: String?
    var last_name: String?
    var date_of_birth: String?
    var email:String?
    var address: Address?
    var attaininfo: AttainInfo?
    private enum CodingKeys: String, CodingKey {
            case first_name,last_name,date_of_birth, email, address, attaininfo
        }
    init() {
        first_name = ""
        last_name = ""
        date_of_birth = ""
        email = ""
        address = Address()
        
        
    }
}

struct Address: Codable {
    var line1:String
    var line2:String?
    var city:String
    var state:String
    var zip:String
    private enum CodingKeys: String, CodingKey {
            case line1,line2,city,state,zip
        }
    init() {
        line1 = ""
        line2 = nil
        city = ""
        state = ""
        zip = ""
    }
}

struct AttainInfo: Codable {
    var transactions:[Transaction]
    var current_rounding:Float
}

struct Transaction: Codable {
    var amount:Float
    var city: String
    var name: String
    var merchant_name:String
    var pending:Bool
    var rounding:Float
}





struct Balances: Codable {
    var available: Float
    var current: Float
    
}


struct RoundingHistory: Codable {
    var total_rounding: Float
    var current_rounding: Float
} 
