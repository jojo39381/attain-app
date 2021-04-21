//
//  BasicInfoFormViewController.swift
//  Nebula
//
//  Created by Joseph Yeh on 4/5/21.
//

import UIKit

class OnboardDateOfBirthViewController : UIViewController {

    let greetingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 40)
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Let's get a little more info..."
        return label
    }()
    
    let dateOfBirthTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Date of Birth"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.datePicker(target: self,
                                  doneAction: #selector(doneAction),
                                  cancelAction: #selector(cancelAction),
                                  datePickerMode: .date)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    
  

    
    @objc
    func cancelAction() {
        dateOfBirthTextField.resignFirstResponder()
    }

    @objc
    func doneAction() {
        if let datePickerView = dateOfBirthTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.dateOfBirthTextField.text = dateString
            
            print(datePickerView.date)
            print(dateString)
            
            self.dateOfBirthTextField.resignFirstResponder()
        }
    }
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
    @objc func goToNextForm() {
        UserData.shared.userInfo.date_of_birth = dateOfBirthTextField.text!
        Utilities.fetchAPIKey { (api_key) in
            updateDate(uuid:api_key)
        }
        
        let nextView = OnboardAddressViewController()
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
        view.backgroundColor = .white
        view.addSubview(greetingLabel)
        greetingLabel.anchor(top: view.topAnchor, left: view.leadingAnchor, bottom: nil, right:nil, paddingTop: 100, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: view.frame.width * 0.7, height: 220)
        setupInputFields()
        setupNextButton()
        setupPrevButton()
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
    fileprivate func setupInputFields() {
        view.addSubview(dateOfBirthTextField)
       
        dateOfBirthTextField.anchor(top: greetingLabel.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 20, paddingLeft: 40, paddingBottom: 0, paddingRight: -40, width: 0, height: 50)
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
