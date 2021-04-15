//
//  ViewController.swift
//  Nebula
//
//  Created by Joseph Yeh on 4/4/21.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: accountCellID, for: indexPath) as UICollectionViewCell
    
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerViewID, for: indexPath)
////        headerView.addAccountButton.addTarget(self, action: #selector(tappedConnectBankButton) , for: .touchUpInside)
//
//
//        headerView.backgroundColor = .white
//        return headerView
//    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 50)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height:200)
    }


    let accountCellID = "accountCellID"
    let headerViewID = "headerViewID"

   
  
    
    
    let logoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 40)
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Attain"
        return label
    }()
    
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 25)
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Hello, Joseph"
        return label
    }()
    let roundUpLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 25)
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Hello, Joseph"
        return label
    }()
    
    let accountsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        

        let cv = UICollectionView(frame:.zero, collectionViewLayout: layout)
        return cv
        
    }()
    
   
    
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let rounding = getRounding(uuid: "1")
        roundUpLabel.text = String(UserData.shared.current_rounding!)
        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.hidesBottomBarWhenPushed = true
        
        view.addSubview(logoLabel)
        view.addSubview(greetingLabel)
        view.addSubview(roundUpLabel)
        logoLabel.anchor(top: view.topAnchor, left: view.leadingAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        greetingLabel.anchor(top: logoLabel.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        roundUpLabel.anchor(top: greetingLabel.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(accountsCollectionView)
        accountsCollectionView.delegate = self
        accountsCollectionView.dataSource = self
        accountsCollectionView.backgroundColor = .white
//        accountsCollectionView.register(AccountsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerViewID)
        
        accountsCollectionView.anchor(top: roundUpLabel.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 50, paddingLeft: 25, paddingBottom: 0, paddingRight: -25, width: 0, height: 500)
        accountsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: accountCellID)
//        let accountView = AccountView()
//        view.addSubview(accountView)
//        accountView.anchor(top: greetingLabel.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 50, paddingLeft: 25, paddingBottom: 0, paddingRight: -25, width: 0, height: 200)
//
        
//        view.addSubview(openLinkButton)
//        openLinkButton.anchor(top: view.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 200, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
//        view.addSubview(createCardHolderButton)
//        createCardHolderButton.anchor(top: openLinkButton.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 200, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        
    }


}
