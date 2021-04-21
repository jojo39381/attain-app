//
//  BasicInfoFormViewController.swift
//  Nebula
//
//  Created by Joseph Yeh on 4/5/21.
//

import UIKit

class OnboardAddressViewController : UIViewController {
    
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 40)
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "A little more... (this is where your card will be sent!)"
        return label
    }()
    
    let addressTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Address"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    let address2TextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Address"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    let cityTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "City"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    let stateTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "State"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    
    //
    //    let addressTextField: UITextField = {
    //        let tf = UITextField()
    //        tf.placeholder = "Password"
    //        tf.isSecureTextEntry = true
    //        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
    //        tf.borderStyle = .roundedRect
    //        tf.font = UIFont.systemFont(ofSize: 14)
    //        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    //        return tf
    //    }()
    //
    //    let cityTextField: UITextField = {
    //        let tf = UITextField()
    //        tf.placeholder = "Password"
    //        tf.isSecureTextEntry = true
    //        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
    //        tf.borderStyle = .roundedRect
    //        tf.font = UIFont.systemFont(ofSize: 14)
    //        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    //        return tf
    //    }()
    //
    //    let stateTextField: UITextField = {
    //        let tf = UITextField()
    //        tf.placeholder = "Password"
    //        tf.isSecureTextEntry = true
    //        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
    //        tf.borderStyle = .roundedRect
    //        tf.font = UIFont.systemFont(ofSize: 14)
    //        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    //        return tf
    //    }()
    //
    //    let zipcodeTextField: UITextField = {
    //        let tf = UITextField()
    //        tf.placeholder = "Password"
    //        tf.isSecureTextEntry = true
    //        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
    //        tf.borderStyle = .roundedRect
    //        tf.font = UIFont.systemFont(ofSize: 14)
    //        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    //        return tf
    //    }()
    //
    
    
    let zipcodeTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Zip Code"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.spacing = 25
        return sv
    }()
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(goToNextForm) , for: .touchUpInside)
        return button
        
    }()
    let prevButton: UIButton = {
        let button = UIButton()
        button.setTitle("Prev", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(goToPrevForm) , for: .touchUpInside)
        return button
        
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        view.isScrollEnabled = false
        return view
    }()
    
    @objc func goToNextForm() {
        
        UserData.shared.userInfo.address?.line1 = addressTextField.text!
        //        UserData.shared.userInfo.address?.line2 = address2TextField.text!
        UserData.shared.userInfo.address?.city = cityTextField.text!
        UserData.shared.userInfo.address?.state = stateTextField.text!
        UserData.shared.userInfo.address?.zip = zipcodeTextField.text!
        print(address2TextField.text!)
        
        Utilities.fetchAPIKey { (api_key) in
            updateAddress(uuid: api_key)
            createMethodEntity(uuid: api_key)
        }
        
        let nextView = OnboardAddAccountViewController()
        self.navigationController?.pushViewController(nextView, animated: true)
        
        
    }
    @objc func goToPrevForm() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func handleTextInputChange() {
        //        let isFormValid = emailTextField.text?.isEmpty == false && phoneNumberTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false
        //
        //        if isFormValid {
        //            signUpButton.isEnabled = true
        //            signUpButton.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237)
        //        } else {
        //            signUpButton.isEnabled = false
        //            signUpButton.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        //        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(greetingLabel)
        scrollView.anchor(top: view.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        scrollView.alwaysBounceVertical = true
        scrollView.isDirectionalLockEnabled = true
        
        greetingLabel.anchor(top: scrollView.topAnchor, left: scrollView.leadingAnchor, bottom: nil, right:nil, paddingTop: 100, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: view.frame.width * 0.7, height: 220)
        setupInputFields()
        setupNextButton()
        setupPrevButton()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        hideKeyboardWhenTappedAround()
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        scrollView.setContentOffset(CGPoint(x: 0, y: stackView.frame.minY - keyboardFrame.height + 20), animated: true)
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        scrollView.setContentOffset(CGPoint(x: 0, y: -91), animated: true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    fileprivate func setupInputFields() {
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(addressTextField)
        stackView.addArrangedSubview(address2TextField)
        stackView.addArrangedSubview(cityTextField)
        stackView.addArrangedSubview(stateTextField)
        stackView.addArrangedSubview(zipcodeTextField)
        
        
        stackView.anchor(top: greetingLabel.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 20, paddingLeft: 40, paddingBottom: 0, paddingRight: -40, width: 0, height: 235)
    }
    fileprivate func setupNextButton() {
        
        view.addSubview(nextButton)
        
        nextButton.anchor(top: nil, left: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -50, paddingRight: -50, width: 0, height: 50)
    }
    fileprivate func setupPrevButton() {
        
        view.addSubview(prevButton)
        
        prevButton.anchor(top: nil, left: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right:nil , paddingTop: 0, paddingLeft: 50, paddingBottom: -50, paddingRight:0, width: 0, height: 50)
    }
    
    
    
}
