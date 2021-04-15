//
//  NetworkRequests.swift
//  Nebula
//
//  Created by Joseph Yeh on 4/4/21.
//

import Foundation

func getPlaidToken() -> String {
    let url = URL(string: "https://khchqs4x.brev.dev/api/config")!
    let semaphore = DispatchSemaphore(value: 0)
    var result = ""
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let data = data else { return }
        
        result = String(data: data, encoding: .utf8)!.replacingOccurrences(of: "\"", with: "")
      
        semaphore.signal()
        
    }
   
    
    task.resume()
    semaphore.wait()
    return result
}
func getPlaidLiabilitiesToken(type:String) -> String {
    var url = URLComponents(string: "https://khchqs4x.brev.dev/api/liabilitiesConfig")!
    url.queryItems = [
        URLQueryItem(name: "type", value:type )
    ]
    let request = URLRequest(url: url.url!)
    let semaphore = DispatchSemaphore(value: 0)
    var result = ""
    let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
        guard let data = data else { return }
        
        
        result = String(data: data, encoding: .utf8)!.replacingOccurrences(of: "\"", with: "")
      
        semaphore.signal()
        
    }
   
    
    task.resume()
    semaphore.wait()
    return result
}

func saveAccessToken(public_token:String) -> String{
    let url = URL(string: "https://khchqs4x.brev.dev/api/plaid_exchange")!
    let semaphore = DispatchSemaphore(value: 0)
    let session = URLSession.shared
    var request = URLRequest(url: url)
    request.httpMethod = "POST" //set http method as POST
    

    let parameters = [
        "uuid":"1",
        "public_token":public_token
    ] as [String : Any]
    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
       
        
        // pass dictionary to nsdata object and set it as request body
    } catch let error {
        print(error.localizedDescription)
    }

    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    var result = ""
    let task = session.dataTask(with: request as URLRequest) {(data, response, error) in
        guard let data = data else { return }
        
        result = String(data: data, encoding: .utf8)!.replacingOccurrences(of: "\"", with: "")
        print(result)
        semaphore.signal()
        
    }
   
    
    task.resume()
    semaphore.wait()
    return result
   
}


func getAccountInfo(uuid:String) -> BankAccount{
    
    var url = URLComponents(string: "https://khchqs4x.brev.dev/api/funding_account")!
    url.queryItems = [
        URLQueryItem(name: "uuid", value: uuid)
    ]
    let request = URLRequest(url: url.url!)
    let semaphore = DispatchSemaphore(value: 0)
    var result:BankAccount!
    let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
        guard let data = data else { return }
        
       
        result = try! JSONDecoder().decode(BankAccount.self, from: data)
        semaphore.signal()
        
    }
    task.resume()
    semaphore.wait()
    return result
}

func getTransactions(uuid:String) -> BankAccount{
    
    var url = URLComponents(string: "https://khchqs4x.brev.dev/api/transactions")!
    url.queryItems = [
        URLQueryItem(name: "uuid", value: uuid)
    ]
    let request = URLRequest(url: url.url!)
    let semaphore = DispatchSemaphore(value: 0)
    var result:BankAccount!
    let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
        guard let data = data else { return }
        
       
//        result = try! JSONDecoder().decode(BankAccount.self, from: data)
        semaphore.signal()
        
    }
    task.resume()
    semaphore.wait()
    return result
}
   

func getRounding(uuid:String) -> RoundingHistory{
    
    var url = URLComponents(string: "https://khchqs4x.brev.dev/api/rounding")!
    url.queryItems = [
        URLQueryItem(name: "uuid", value: uuid)
    ]
    let request = URLRequest(url: url.url!)
    let semaphore = DispatchSemaphore(value: 0)
    var result:RoundingHistory!
    let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
        guard let data = data else { return }
        
       
        result = try! JSONDecoder().decode(RoundingHistory.self, from: data)
        UserData.shared.current_rounding = result.current_rounding
        semaphore.signal()
        
        
    }
    task.resume()
    semaphore.wait()
    return result
}




func getMethodLinkToken(entity_id:String) -> String{
    
    var url = URLComponents(string: "https://khchqs4x.brev.dev/api/liabilitiesConfig")!
    url.queryItems = [
        URLQueryItem(name: "entity_id", value: entity_id)
    ]
    let request = URLRequest(url: url.url!)
    let semaphore = DispatchSemaphore(value: 0)
    var result:String!
    let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
        guard let data = data else { return }
        
       
        result = String(data: data, encoding: .utf8)!.replacingOccurrences(of: "\"", with: "")
        
        semaphore.signal()
        
    }
    task.resume()
    semaphore.wait()
    return result
}
