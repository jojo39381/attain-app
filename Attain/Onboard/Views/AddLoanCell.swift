//
//  TestimonialView.swift
//  fire
//
//  Created by Joseph Yeh on 3/15/21.
//  Copyright © 2021 Sacheth Sathyanarayanan. All rights reserved.
//

import UIKit

class AddLoanCell: UICollectionViewCell{
    
    
    
  
    var plusSignLabel: UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    

    
   
    func setupView() {
        plusSignLabel = makeLabel(title: "+", color: .black, font: "Avenir Heavy", size: 40, numberOfLines: 1, textAlignment: .center)
        self.addSubview(plusSignLabel)
        plusSignLabel.anchor(top: self.topAnchor, left: self.leadingAnchor, bottom: self.bottomAnchor, right: self.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.width/2
      
      
      
    }

}
