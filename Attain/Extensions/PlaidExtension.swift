//
//  ViewController+LinkToken.swift
//  LinkDemo-Swift
//
//  Copyright © 2020 Plaid Inc. All rights reserved.
//

import LinkKit

extension BaseViewController {
    func createLiabilitiesLinkTokenConfiguration(category:String) -> LinkTokenConfiguration {
        #warning("Replace <#GENERATED_LINK_TOKEN#> below with your link_token")
        // In your production application replace the hardcoded linkToken below with code that fetches an link_token
        // from your backend server which in turn retrieves it securely from Plaid, for details please refer to
        // https://plaid.com/docs/#create-link-token

        let linkToken:String = getPlaidLiabilitiesToken(type:category)
        
        
        
        
       
        // With custom configuration using a link_token
        var linkConfiguration = LinkTokenConfiguration(token: linkToken) { success in
            print("success")
            print("public-token: \(success.publicToken) metadata: \(success.metadata)")

            Utilities.fetchAPIKey { (api_key) in

//                let accountData = getAccountInfo(uuid:api_key)
//                UserData.shared.fundingAccount = accountData
//                UserData.shared.fundingAccount!.bankName = success.metadata.institution.name
//                self.success = true
                
                
                let linktoken = getMethodLinkToken(uuid: api_key, ins_id: success.metadata.institution.id, mask: success.metadata.accounts[0].mask!)

                print(success.metadata.institution.id)
                print(success.metadata.accounts[0].mask!)
                print(linktoken)
                let webview = LiabilitiesWebViewController(linkToken: linktoken, publicToken:success.publicToken)


                self.present(webview, animated: true, completion: nil)
            }
            
            
           
        }
        linkConfiguration.onExit = { exit in
            if let error = exit.error {
                print("error")
                print("exit with \(error)\n\(exit.metadata)")
            } else {
               
                
                print("exit with \(exit.metadata)")
            }
            
        }
   
        
        return linkConfiguration
    }
    func createLinkTokenConfiguration() -> LinkTokenConfiguration {
        #warning("Replace <#GENERATED_LINK_TOKEN#> below with your link_token")
        // In your production application replace the hardcoded linkToken below with code that fetches an link_token
        // from your backend server which in turn retrieves it securely from Plaid, for details please refer to
        // https://plaid.com/docs/#create-link-token

        let linkToken:String = getPlaidToken()
        
        
        
        
       
        // With custom configuration using a link_token
        var linkConfiguration = LinkTokenConfiguration(token: linkToken) { success in
            print("success")
            print("public-token: \(success.publicToken) metadata: \(success.metadata)")
            self.success = true
            Utilities.fetchAPIKey { (api_key) in
                let temp = saveAccessToken(type:"checking", uuid:api_key, public_token: success.publicToken)
                print(temp)
                
                let accountData = getAccountInfo(uuid:api_key
                )
                UserData.shared.fundingAccount = accountData
                UserData.shared.fundingAccount!.bankName = success.metadata.institution.name
                
          
            }
            
            
       
        }
        linkConfiguration.onExit = { exit in
            if let error = exit.error {
                print("error")
                print("exit with \(error)\n\(exit.metadata)")
            } else {
               
                
                print("exit with \(exit.metadata)")
            }
            
        }
   
        
        return linkConfiguration
    }
    
//    func getLinkConfiguration()  {
//    var linkConfiguration = LinkTokenConfiguration(token: linkToken) { success in
//        print("public-token: \(success.publicToken) metadata: \(success.metadata)")
//    }
//    linkConfiguration.onExit = { exit in
//        if let error = exit.error {
//            print("exit with \(error)\n\(exit.metadata)")
//        } else {
//            print("exit with \(exit.metadata)")
//        }
//    }
//    return linkConfiguration
//    }

    // MARK: Start Plaid Link using a Link token
    // For details please see https://plaid.com/docs/#create-link-token
    func presentPlaidLinkUsingLinkToken(category:String) {
        
        let linkConfiguration = (category == "credit_card") ? createLiabilitiesLinkTokenConfiguration(category:category) : createLinkTokenConfiguration()
        
     
        let result = Plaid.create(linkConfiguration)
        switch result {
        case .failure(let error):
            print("Unable to create Plaid handler due to: \(error)")
        case .success(let handler):
            linkHandler = handler
            let method: PresentationMethod = .custom { (vc) in
                vc.modalPresentationStyle = .fullScreen
                
                self.present(vc, animated: true, completion: nil)
                
            }
            
            linkHandler!.open(presentUsing:method)
            
           
        }
    }
}
