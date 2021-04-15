//
//  ViewUtils.swift
//  Attain
//
//  Created by Joseph Yeh on 4/9/21.
//

import Foundation
import UIKit
func makeButton(title:String = "", color:UIColor = .black,cornerRadius:CGFloat = 0, backgroundColor:UIColor = .clear, shadow:Bool = false) -> UIButton {
    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.setTitleColor(color, for: .normal)
    button.backgroundColor = backgroundColor
    button.layer.cornerRadius = cornerRadius
   
    
    return button
}

func makeLabel(title:String = "", color:UIColor = .black, font:String, size:CGFloat, numberOfLines:Int = 0, textAlignment:NSTextAlignment) -> UILabel {
    let label = UILabel()
    label.font = UIFont(name:font, size:size)
    label.numberOfLines = numberOfLines
    label.textColor = color
    label.text = title
    label.textAlignment = textAlignment

    return label
}
