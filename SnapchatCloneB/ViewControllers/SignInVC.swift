//
//  SignInVC.swift
//  SnapchatCloneB
//
//  Created by Emirhan Cankurt on 12.02.2023.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SignInVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signInClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata:AuthDataResult?, error:Error?) in
                if error != nil {
                    self.makeAlert(title: "error", message: error?.localizedDescription ?? "error" )
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            self.makeAlert(title: "Error!", message: "Username/Password?")
            
        }
    }
    @IBAction func signUpClicked(_ sender: Any) {
        if usernameText.text != "" && emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (success:AuthDataResult?, error:Error?) in
                if error != nil {
                    self.makeAlert(title: "error", message: error?.localizedDescription ?? "error" )
                } else {
                    let fireStore = Firestore.firestore()
                    if let userDictionary = ["email" : self.emailText.text!,"username": self.usernameText.text!] as? [String : Any] {
                        fireStore.collection("UserInfo").addDocument(data: userDictionary) { (error:Error?) in
                            if error != nil {
                                self.makeAlert(title: "error", message: error?.localizedDescription ?? "error")
                            } else {
                                self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                            }
                            
                        }
                        
                        
                    }
                    
                    
                }
                
            }
        } else {
            self.makeAlert(title: "Error!", message: "Username/Password?")
        }
    }
                
                
                
                
                
                
                
                
                
    
    func makeAlert(title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
}

