//
//  TestimonialView.swift
//  fire
//
//  Created by Joseph Yeh on 3/15/21.
//  Copyright © 2021 Sacheth Sathyanarayanan. All rights reserved.
//

import UIKit
protocol AddLoansCollectionViewCellDelegate: class {
    func didPressAddLoanCell()
}
class AddLoansCollectionView: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    let cellId = "testimonialId"
    var cellTitleLabel:UILabel!
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AddLoanCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    

    let loansCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.backgroundColor = .white
        cv.isScrollEnabled = true
        
        return cv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    var delegate:AddLoansCollectionViewCellDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didPressAddLoanCell()
    }
    var loanType: String!
    
    func setupView() {
        cellTitleLabel = makeLabel(title: loanType, color: .black, font: "Avenir Heavy", size: 20, numberOfLines: 1, textAlignment: .left)
        self.addSubview(cellTitleLabel)
        cellTitleLabel.anchor(top: nil, left: self.leadingAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
      
        self.addSubview(loansCollectionView)
        loansCollectionView.anchor(top: self.cellTitleLabel.bottomAnchor, left: self.leadingAnchor, bottom: nil, right: self.trailingAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 70)
        loansCollectionView.register(AddLoanCell.self, forCellWithReuseIdentifier: cellId)
        loansCollectionView.delegate = self
        loansCollectionView.dataSource = self
    }

}
