//
//  TestimonialView.swift
//  fire
//
//  Created by Joseph Yeh on 3/15/21.
//  Copyright © 2021 Sacheth Sathyanarayanan. All rights reserved.
//

import UIKit

class BankAccountView: UIView{
    
    
    
  
    var bankNameLabel: UILabel!
    var accountNameLabel: UILabel!
    var balanceLabel:UILabel!
//    var bankAccountInfo: BankAccountInfo!
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
          }
          
          //initWithCode to init view from xib or storyboard
          required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupView()
          }
          
          //common func to init our view
        
    

    
   
    func setupView() {
        let accountInfo = UserData.shared.fundingAccount!
       
        bankNameLabel = makeLabel(title: accountInfo.bankName!, color: .black, font: "Avenir Heavy", size: 20, numberOfLines: 1, textAlignment: .left)
        balanceLabel = makeLabel(title: "Balance: " + String(accountInfo.balances.current), color: .black, font: "Avenir", size: 15, numberOfLines: 1, textAlignment: .left)
        
        accountNameLabel = makeLabel(title: accountInfo.name, color: .black, font: "Avenir Heavy", size: 15, numberOfLines: 1, textAlignment: .left)
        self.addSubview(bankNameLabel)
        self.addSubview(balanceLabel)
        
        
        self.addSubview(accountNameLabel)
        
        bankNameLabel.anchor(top: self.topAnchor, left: self.leadingAnchor, bottom: nil, right: self.trailingAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: -10, width: 0, height: 0)
        accountNameLabel.anchor(top: bankNameLabel.bottomAnchor, left: self.leadingAnchor, bottom: nil, right: self.trailingAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: -10, width: 0, height: 0)
        balanceLabel.anchor(top: nil, left: self.leadingAnchor, bottom: self.bottomAnchor, right: self.trailingAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: -10, width: 0, height: 0)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 10
      
      
      
    }

}
