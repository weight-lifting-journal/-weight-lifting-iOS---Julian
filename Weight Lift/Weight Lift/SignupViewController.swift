//
//  SignupViewController.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/4/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        styleButton()
    }
    
    func styleButton() {
        signupButton.layer.cornerRadius = 25
        signupButton.backgroundColor = .blue
        signupButton.setTitleColor(.white, for: .normal)
        cancelButton.layer.cornerRadius = 25
        cancelButton.backgroundColor = .red
        cancelButton.setTitleColor(.white, for: .normal)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        print("Signup button tapped")
        
        if (emailTextField.text?.isEmpty)! || (usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
            displayMessage(userMessage: "All fields are required.")
            return
        }
        
        let url = URL(string: "https://weightliftingjournallambda.herokuapp.com/users/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        
        let postString = ["email": emailTextField.text, "username": usernameTextField.text, "password": passwordTextField.text]
    }
    
    func displayMessage(userMessage: String) -> Void {
        DispatchQueue.main.async
            {
                let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    print("Ok button tapped")
                    DispatchQueue.main.async
                        {
                            self.dismiss(animated: true, completion: nil)
                    }
                }
                alertController.addAction(action)
                self.present(alertController, animated: true, completion:nil)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) { navigationController?.popViewController(animated: true)    }
    
    // MARK: - Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
}
