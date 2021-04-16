//
//  Utilities.swift
//  Attain
//
//  Created by Hugo Zhan on 4/15/21.
//

import UIKit
import Firebase

let db = Firestore.firestore()
let auth = Auth.auth()
class Utilities {
    static func styleTextField(_ textfield:UITextField) {
        // Create the bottom line
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: UIScreen.main.bounds.height * 0.08 / 1.25, width: UIScreen.main.bounds.width * 0.84, height: 2)
        bottomLine.backgroundColor = UIColor(red: 23/255, green: 50/255, blue: 69/255, alpha: 1).cgColor
        // Remove border on text field
        textfield.borderStyle = .none
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
    }
    
    static func styleYellowButton(_ button:UIButton) {
        // Filled rounded corner style
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 74/255, alpha: 1)
        button.setTitleColor(UIColor(red: 23/255, green: 50/255, blue: 69/255, alpha: 1), for: .normal)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 0.04
    }
    
    static func styleBlueButton(_ button:UIButton) {
        // Filled rounded corner style
        button.backgroundColor = UIColor(red: 23/255, green: 50/255, blue: 69/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = UIScreen.main.bounds.height * 0.04
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func handleError(error: Error) -> String {
       /// the user is not registered
       /// user not found
       let errorAuthStatus = AuthErrorCode.init(rawValue: error._code)!
       switch errorAuthStatus {
       case .wrongPassword:
        return "*Incorrect Password"
       case .invalidEmail:
        return "*Invalid Email"
       case .operationNotAllowed:
        return "*Operation not allowed"
       case .userDisabled:
        return "*Disabled Account"
       case .userNotFound:
        return "*Account does not exist"
       case .emailAlreadyInUse:
        return "*Email is already in use"
       case .tooManyRequests:
        return "*A verfication email was already sent"
       default: fatalError("*Error not supported here")
       }
    }
    
    static func fetchProfileData(completion: @escaping () -> Void) {
        let docRef = db.collection("users").document(auth.currentUser!.uid)
        docRef.getDocument {(document, error) in
            UserData.shared.username = document?.get("username") as? String
            completion()
        }
    }
    
    static func fetchAPIKey(completion: @escaping (String) -> ()) {
        let docRef = db.collection("users").document(auth.currentUser!.uid)
        docRef.getDocument {(document, error) in
            if let error = error {
                print(error)
                return
            }
            completion(document?.get("api_key") as? String ?? "")
        }
    }
    
    static func checkUsername(username: String, completion: @escaping (Bool) -> Void) {
        db.collection("users").whereField("username", isEqualTo: username).getDocuments() { (snapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                completion(snapshot?.count != 0)
            }
        }
    }
    
    
}
