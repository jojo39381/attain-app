import UIKit

class UserData {
    static let shared = UserData()
    public var userInfo = UserInfo()
    public var username: String?
    public var fundingAccount:BankAccount?
    public var current_rounding: Float?
}

