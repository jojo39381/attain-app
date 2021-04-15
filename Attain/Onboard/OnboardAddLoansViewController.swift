//
//  ViewController.swift
//  Attain
//
//  Created by Joseph Yeh on 4/9/21.
//

import UIKit

class OnboardAddLoansViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AddLoansCollectionViewCellDelegate {
    func didPressAddLoanCell() {
        let linkToken = presentPlaidLinkUsingLinkToken(type:"student_loan")
        
//        let webview = LiabilitiesWebViewController(linkToken: linkToken)
//
//        webview.linkToken = linkToken
//        self.present(webview, animated: true, completion: nil)
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(data.count)
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AddLoansCollectionView
        cell.delegate = self
        cell.loanType = data[indexPath.item]
        cell.setupView()
       
       
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    let cellId = "cellId"
    var greetingLabel: UILabel!
    var nextButton: UIButton!
    var instructionLabel: UILabel!
    var detailedInstructionLabel: UILabel!
    var loansCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
    }()
    let data = ["Credit Cards", "Student Loans", "Mortgage"]
    
    

    
    @objc func goToNextForm() {
        let nextView = OnboardSettingsViewController()




        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
       
        self.navigationController?.setNavigationBarHidden(true, animated: true)
       
        setupGreetingLabel()
        setupInstructionLabels()
        setupLoansCollectionView()
        setupNextButton()
        // Do any additional setup after loading the view.
    }
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    fileprivate func setupGreetingLabel() {
        greetingLabel = makeLabel(title: "Connect Your Accounts", color: .black, font: "Avenir Heavy", size:40, numberOfLines: 0, textAlignment: .left)
        view.addSubview(greetingLabel)
        greetingLabel.anchor(top: view.topAnchor, left: view.leadingAnchor, bottom: nil, right:nil, paddingTop: 100, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: view.frame.width * 0.7, height: 170)
    }
    
    
    
    fileprivate func setupInstructionLabels() {
        instructionLabel = makeLabel(title: "Connect your accounts below", color: .black, font: "Avenir Heavy", size:20, numberOfLines: 0, textAlignment: .center)
        view.addSubview(instructionLabel)
        instructionLabel.anchor(top: greetingLabel.bottomAnchor, left: view.leadingAnchor, bottom: nil, right:view.trailingAnchor, paddingTop: 10, paddingLeft: 50, paddingBottom: 0, paddingRight: -50, width: 0, height: 0)
        detailedInstructionLabel = makeLabel(title: "select all that applies", color: .black, font: "Avenir", size:12, numberOfLines: 1, textAlignment: .center)
        view.addSubview(detailedInstructionLabel)
        detailedInstructionLabel.anchor(top: instructionLabel.bottomAnchor, left: view.leadingAnchor, bottom: nil, right:view.trailingAnchor, paddingTop: 20, paddingLeft: 50, paddingBottom: 0, paddingRight: -50, width: 0, height: 0)
        
    }
    fileprivate func setupLoansCollectionView() {
        
       
        view.addSubview(loansCollectionView)
        
        loansCollectionView.anchor(top: detailedInstructionLabel.bottomAnchor, left: view.leadingAnchor    , bottom: nil, right: view.trailingAnchor, paddingTop: 30, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 0, height: 500)
        loansCollectionView.backgroundColor = .white
        loansCollectionView.delegate = self
        loansCollectionView.dataSource = self
        loansCollectionView.register(AddLoansCollectionView.self, forCellWithReuseIdentifier: cellId)
    }
    
    
    
    
    fileprivate func setupNextButton() {
        nextButton = makeButton(title: "Next", color: .black)
        view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(goToNextForm), for: .touchUpInside)
        nextButton.anchor(top: nil, left: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -50, paddingRight: -50, width: 0, height: 50)
    }




}

